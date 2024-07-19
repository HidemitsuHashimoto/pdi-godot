#!/bin/sh
echo -ne '\033c\033]0;Review v3\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/start.x86_64" "$@"
