#!/bin/bash -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$EUID" -ne 0 ] ; then
    echo "Must run as root"
    exit 1
fi

iso="$script_dir/../Install macOS Sierra.app"

if [[ ! -d "$iso" ]] ; then
    echo "$iso not found"
    exit 1
fi

rm -rf "$script_dir/../dmg"

cd "$script_dir/.."

"$script_dir/../templates/prepare_iso/prepare_iso.sh" "$iso" dmg
