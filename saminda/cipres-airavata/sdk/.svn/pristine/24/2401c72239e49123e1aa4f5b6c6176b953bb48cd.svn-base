#!/usr/bin/env python
"""
    Functions for sending email from cipres cron jobs. 

    Note that caller will get exceptions if there's a problem talking to the smtp server or the
    email is badly formed, but not if the mail can't be delivered.  If mail can't be delivered
    to one or more of the recipients the fromaddr account can expect to receive an email
    about it though.

    Sorry, lots of stuff is hardcoded here.  See sendMail function below for a fairly generic but
    limited method to send an email message.

"""
import sys
import os
import re
import string
import subprocess
import tempfile
import getopt
import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEText import MIMEText

smtpServer = "smtp.sdsc.edu"
ccaddr = "mmiller@sdsc.edu"
fromaddr = "mmiller@sdsc.edu" 


def overLimitWarning(toaddr, level):
    warningFiles = (("allocation_message1.txt", "allocation_message1.html"), 
        ("allocation_message2.txt", "allocation_message2.html"), 
        ("allocation_message3.txt", "allocation_message3.html"),
        ("allocation_message4.txt", "allocation_message4.html"), 
        ("allocation_message5.txt", "allocation_message5.html"))
    plainFile = warningFiles[level][0] 
    htmlFile = warningFiles[level][1]

    msg = MIMEMultipart('related')
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Cc'] = ccaddr
    msg['Subject'] = "Usage notice from the CIPRES Science Gateway" 

    alternatives = MIMEMultipart('alternative')
    msg.attach(alternatives)

    plain= open(plainFile, 'r').read()
    alternatives.attach(MIMEText(plain, 'plain'));

    html = None
    try:
        html= open(htmlFile, 'r').read()
        alternatives.attach(MIMEText(html, 'html'))
    except IOError:
        pass

    mail = smtplib.SMTP(smtpServer, 25)
    # mail.set_debuglevel(1)
    toaddrs = [toaddr] + [ccaddr]
    mail.sendmail(fromaddr, toaddrs, msg.as_string())
    mail.quit()

def sendMail(toA, fromA, ccA, subject, file): 
    # print "sendMail(%s, %s, %s)" % (toA, subject, file)

    msg = MIMEMultipart('related')
    msg['From'] = fromA
    msg['To'] = toA
    msg['Cc'] = ccA
    if subject:
        msg['Subject'] = subject 
    else:
        msg['Subject'] = "Usage notice from the CIPRES Science Gateway" 
    alternatives = MIMEMultipart('alternative')
    msg.attach(alternatives)

    plain= open(file, 'r').read()
    alternatives.attach(MIMEText(plain, 'plain'));

    mail = smtplib.SMTP(smtpServer, 25)
    # mail.set_debuglevel(1)
    toA = [toA] + [ccA]
    mail.sendmail(fromA, toA, msg.as_string())
    mail.quit()

