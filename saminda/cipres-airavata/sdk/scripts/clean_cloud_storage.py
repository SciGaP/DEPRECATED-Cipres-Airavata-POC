#!/usr/local/apps/python-2.7.2/bin/python

import re
import subprocess

from datetime import datetime, timedelta


class SwiftError(Exception):

    pass


def call_swift(*arguments):

    swift_args = ["/usr/local/bin/swift.py", "-A", "https://cloud.sdsc.edu/auth/v1.0", "-U", "cipres:mmiller", "-K", "caslpefL"]

    for arg in arguments:
        swift_args.append(arg)

    process = subprocess.Popen(swift_args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = process.communicate()

    if err:
        raise SwiftError(err)

    return out


name_pattern = re.compile("NGBW-JOB-\\S+\\.zip")
mod_date_pattern = re.compile("\\s*Last Modified:\\s*(.+)")
cutoff_date = datetime.today() - timedelta(days=30)
swift_output = call_swift("list")
containers = re.split("\n", swift_output.strip())

for container in containers:
    swift_output = call_swift("list", container)
    objects = re.split("\n", swift_output.strip())

    for item in objects:
        if not name_pattern.match(item):
            continue

        swift_output = call_swift("stat", container, item)
        item_info = re.split("\n", swift_output.strip())

        for line in item_info:
            match = mod_date_pattern.match(line)

            if match:
                mod_date = datetime.strptime(match.group(1), "%a, %d %b %Y %H:%M:%S %Z")

                if mod_date < cutoff_date:
                    call_swift("delete", container, item)

                break
