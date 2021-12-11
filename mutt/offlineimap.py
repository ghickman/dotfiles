#!/usr/bin/env python

import os
import re
import subprocess


def get_keychain_pass(account, server):
    keychain_path = os.path.expanduser("~/Library/Keychains/login.keychain-db")

    if not os.path.exists(keychain_path):
        raise Exception("Unknown keychain path: {}\n".format(keychain_path))

    command = f"sudo -u george /usr/bin/security -v find-internet-password -g -a {account} -s {server} {keychain_path}"
    output = subprocess.check_output(
        command,
        shell=True,
        stderr=subprocess.STDOUT,
    ).decode()

    outtext = [line for line in output.splitlines() if line.startswith("password: ")][0]

    return re.match(r'password: "(.*)"', outtext).group(1)
