#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v javac >/dev/null 2>&1; then
    echo "[ERROR] javac not found. Install JDK 8+ and add its bin directory to PATH." >&2
    exit 1
fi

mkdir -p build/classes

RELEASE=()
if javac -help 2>&1 | grep -q -- '--release'; then
    RELEASE=(--release 8)
fi

javac "${RELEASE[@]}" -Xlint:-options -encoding UTF-8 -d build/classes -cp lib/jsfml.jar src/*.java
echo "Build OK: build/classes"
