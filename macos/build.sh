#!/bin/bash -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(
    cd "$script_dir/templates"
    packer build -only=vmware-iso -var-file=macos1012.json macos.json
)

rm -rf "$script_dir/box"
mkdir -p "$script_dir/box"
cp -R "$script_dir"/templates/box/* "$script_dir/box/"
