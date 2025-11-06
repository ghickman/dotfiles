#!/usr/bin/env python

import fileinput
import os
import re
import sys

line_pat = re.compile(r"^(?P<mod>.*)\.py:\s*class\s(?P<name>.*)[\(|:]")

# take the input path and ignore everything up to the final part when
# generating the module path
raw_prefix = sys.argv[1]
ignore, _ = os.path.split(raw_prefix)


module = ""
for line in fileinput.input(sys.argv[2:]):
    line = line.replace(f"{ignore}/", "")
    m = line_pat.match(line)

    if not m:
        # print("FAIL: ", line)
        continue

    name = m.group("name")
    name = re.sub(r"\(.*\)$", "", name)
    mod = m.group("mod").replace("/", ".")
    print(f"{mod}.{name}")
