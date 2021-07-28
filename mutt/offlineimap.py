#!/usr/bin/env python

import os
import re
import subprocess


def get_keychain_pass(account=None, server=None):
    keychain_path = os.path.expanduser("~/Library/Keychains/login.keychain")

    if not os.path.exists(keychain_path):
        raise Exception("Unknown keychain path: {}\n".format(keychain_path))

    params = {
        "security": "/usr/bin/security",
        "command": "find-internet-password",
        "account": account,
        "server": server,
        "keychain": keychain_path,
    }
    command = (
        "sudo -u george {security} -v {command} -g -a {account} -s {server} {keychain}"
    )
    command = command.format(**params)

    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [line for line in output.splitlines() if line.startswith("password: ")][0]

    return re.match(r'password: "(.*)"', outtext).group(1)
