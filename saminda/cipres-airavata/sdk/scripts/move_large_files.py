#!/usr/local/apps/python-2.7.2/bin/python

import datetime
import getpass
import os
import re
import shutil
import smtplib
import socket
import subprocess

from email.mime.text import MIMEText


class CipresError(Exception):

    pass


def call_swift(*arguments):

    swift_args = ["/usr/local/bin/swift.py", "-A", "https://cloud.sdsc.edu/auth/v1.0", "-U", "cipres:mmiller", "-K", "caslpefL"]

    for arg in arguments:
        swift_args.append(arg)

    process = subprocess.Popen(swift_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = process.communicate()

    if err:
        raise CipresError(err)

    return out


def read_job_file(dirname):

    pair_pattern = re.compile("\\s*=\\s*")
    job_file = open("%s/_JOBINFO.TXT" % (dirname))
    job_handle = None
    username = None
    user_email = None

    try:
        while True:
            container = job_file.readline();

            if not container:
                break

            pair = pair_pattern.split(container, 1)

            if len(pair) == 2:
                if pair[0] == "JobHandle":
                    job_handle = pair[1].rstrip()
                elif pair[0] == "email":
                    user_email = pair[1].rstrip()
                    index = user_email.find("@")
                    username = user_email[:index]

    finally:
        job_file.close()

    if job_handle is None or username is None or user_email is None:
        raise CipresError("_JOBINFO.TXT is corrupted")

    return job_handle, username, user_email


def container_exists(dirname):

    swift_output = call_swift("list")

    if re.search("\\b" + dirname + "\\b", swift_output):
        return True

    return False


def upload_files(source_dir):

    archive_dir = "/projects/ps-ngbt/zipfiles"
    new_containers = [ ]
    uploads = [ ]
    errors = [ ]

    os.chdir(source_dir)

    job_dirs = os.listdir(".")

    for dirname in job_dirs:
        try:
            job_handle, username, user_email = read_job_file(dirname)
            user_archive_dir = "%s/%s" % (archive_dir, username)
            archive_file = "%s.zip" % (job_handle)
            archive_pathname = "%s/%s" % (user_archive_dir, archive_file)
            new_user_container = False

            if not container_exists(username):
                new_user_container = True

            if not os.path.exists(user_archive_dir):
                os.mkdir(user_archive_dir, 0775)

            subprocess.check_output(["jar", "cvf", archive_pathname, dirname], stderr=subprocess.STDOUT)

            os.chdir(user_archive_dir)

            call_swift("upload", "-c", username, archive_file)

            if new_user_container:
                new_containers.append("Directory %s created for user %s" % (username, user_email))

            uploads.append("The file %s was written to directory %s for user %s" % (archive_file, username, user_email))

            shutil.rmtree("%s/%s" % (source_dir, dirname))

        except subprocess.CalledProcessError as process_err:
            errors.append("Upload for %s failed: %s\n" % (dirname, process_err.output))

        except (IOError, OSError, CipresError) as err:
            errors.append("Upload for %s failed: %s\n" % (dirname, str(err)))

        os.chdir(source_dir)

    result = "From %s:\n" % (source_dir)

    if len(new_containers) > 0:
        result += "\n"
        result += "\n".join(new_containers)
        result += "\n"

    if len(uploads) > 0:
        result += "\n"
        result += "\n".join(uploads)
        result += "\n"

    if len(errors) > 0:
        result += "\n"
        result += "\n".join(errors)
        result += "\n"

    return result


trestles_result = upload_files("/archive/science/ngbt/backend/trestles_workspace/MANUAL")
gordon_result = upload_files("/archive/science/ngbt/backend/gordon_workspace/MANUAL")
tscc_result = upload_files("/archive/science/ngbt/backend/tscc_workspace/MANUAL")

username = getpass.getuser()
hostname = socket.getfqdn()
sender = "%s@%s" % (username, hostname)
reciever = "mmiller@sdsc.edu"
today = datetime.date.today().strftime("%B %d, %Y")
body = "Upload activity for %s:\n\n\n" % (today)

if len(trestles_result) > 0:
    body += "%s\n\n" % (trestles_result)

if len(tscc_result) > 0:
    body += "%s\n\n" % (tscc_result)

if len(gordon_result) > 0:
    body += gordon_result

message = MIMEText(body)

message["Subject"] = "large file upload activity"
message["From"] = "%s <%s>" % (username, sender)
message["To"] = "Mark Miller <" + reciever + ">"

mail_server = smtplib.SMTP("mail.sdsc.edu")

try:
    mail_server.sendmail(sender, [ reciever ], message.as_string())

finally:
    mail_server.quit()
