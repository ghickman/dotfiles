#!/bin/bash

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Pass a path to look for classes, eg: classes foo/bar"
  exit 1
fi

rg "\bclass " -tpy "$1" | classes.py "$1" | sort > classes.txt
