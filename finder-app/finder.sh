#!/bin/sh

print_usage () {
    echo "Usage: $0 <directory> <searchstr>"
}

EXPECTED_ARGS=2

# Check if there are 2 arguments
if [ "$#" -ne "$EXPECTED_ARGS" ]; then
    echo "ERROR: 2 arguments are expected but $# were given."
    print_usage
    exit 1
fi

# Check if the directory exists
directory=$1
if [ ! -d "$directory" ]; then
    echo "ERROR: The given directory does not exist or is invalid: $1."
    print_usage
    exit 1
fi

searchString=$2

# List the files in the directory and sub-directories then count the number of files found
numFiles=$(find ${directory} -type f | wc -l)

# Search the contents in every file for the search string then count the number of found matches
numMatchingLines=$(grep ${searchString} -r ${directory} | wc -l)

echo "The number of files are $numFiles and the number of matching lines are $numMatchingLines"