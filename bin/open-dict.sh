#!/usr/bin/env bash
set -eux

function main() {
    open "dict://$1"
}

main "$1"
