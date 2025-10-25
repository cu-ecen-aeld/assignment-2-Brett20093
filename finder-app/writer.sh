#!/bin/sh

print_usage () {
    echo "Usage: $0 <writefile> <searchstr>"
}

EXPECTED_ARGS=2

if [ "$#" -ne "$EXPECTED_ARGS" ]; then
    echo "ERROR: 2 arguments are expected but $# were given."
    print_usage
    exit 1
fi

FILE=$1

DIRECTORY="${FILE%/*}"

mkdir -p $DIRECTORY
touch $FILE
echo "$2" > $FILE
