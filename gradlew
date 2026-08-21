#!/bin/sh
set -e
DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
if [ -f "$DIR/gradle/wrapper/gradle-wrapper.jar" ]; then
  exec java -jar "$DIR/gradle/wrapper/gradle-wrapper.jar" "$@"
fi
if command -v gradle >/dev/null 2>&1; then
  echo "Gradle wrapper JAR is not bundled; using installed Gradle as a bootstrap fallback."
  exec gradle "$@"
fi
echo "Gradle wrapper JAR is missing and no system Gradle was found." >&2
exit 1
