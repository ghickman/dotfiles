#!/bin/bash

set -eu

if ! grep '/etc/auto_master' -e 'auto_nfs'; then
  printf "/-\t\t\tauto_nfs" >> /etc/auto_master
  automount -cv
fi
