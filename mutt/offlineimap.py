#!/usr/bin/env python

import os
import re
import subprocess


def get_keychain_pass(account=None, server=None):
    params = {
        "security": "/usr/bin/security",
        "command": "find-internet-password",
        "account": account,
        "server": server,
        "keychain": os.path.expanduser("~/Library/Keychains/login.keychain"),
    }
    command = (
        "sudo -u george {security} -v {command} -g -a {account} -s {server} {keychain}"
    )
    command = command.format(**params)

    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [line for line in output.splitlines() if line.startswith("password: ")][0]

    return re.match(r'password: "(.*)"', outtext).group(1)
