#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v java >/dev/null 2>&1; then
    echo "[ERROR] java not found. Install JDK 8+ and add its bin directory to PATH." >&2
    exit 1
fi

./build.sh

case "$(uname -s)" in
    MINGW*|MSYS*|CYGWIN*) SEP=';' ;;
    *) SEP=':' ;;
esac

exec java -cp "build/classes${SEP}lib/jsfml.jar" Game
