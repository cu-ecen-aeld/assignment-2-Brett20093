#!/bin/sh

print_usage () {
    echo "Usage: $0 <writefile> <searchstr>"
}

EXPECTED_ARGS=2

# Check if there are 2 arguments
if [ "$#" -ne "$EXPECTED_ARGS" ]; then
    echo "ERROR: 2 arguments are expected but $# were given."
    print_usage
    exit 1
fi

writeFile=$1

# Extract the directory out of the writeFile argument
directory="${writeFile%/*}"

# Make the directory if it doesn't exist, touch the file, then overwrite the file with <searchstr>
mkdir -p $directory
touch $writeFile
echo "$2" > $writeFile
