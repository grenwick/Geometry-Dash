#!/bin/sh
echo -ne '\033c\033]0;Geometry Dash\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Geometry Dash.x86_64" "$@"
