#!/usr/bin/env python

import fileinput
import re

line_pat = re.compile(r"^(?P<mod>.*)\.py:\s*class\s(?P<name>.*)[\(|:]")

module = ""
for line in fileinput.input():
    m = line_pat.match(line)

    if not m:
        # print("FAIL: ", line)
        continue

    name = m.group("name")
    name = re.sub(r"\(.*\)$", "", name)
    mod = m.group("mod").replace("/", ".")
    print(f"{mod}.{name}")
