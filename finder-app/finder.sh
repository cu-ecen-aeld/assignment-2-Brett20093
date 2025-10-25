#!/bin/sh

print_usage () {
    echo "Usage: $0 <directory> <searchstr>"
}

EXPECTED_ARGS=2

if [ "$#" -ne "$EXPECTED_ARGS" ]; then
    echo "ERROR: 2 arguments are expected but $# were given."
    print_usage
    exit 1
fi

DIR=$1
if [ ! -d "$DIR" ]; then
    echo "ERROR: The given directory does not exist or is invalid: $1."
    print_usage
    exit 1
fi

SEARCH_STR=$2
NUM_FILES=$(find ${DIR} -type f | wc -l)
NUM_MATCHING_LINES=$(grep ${SEARCH_STR} -r ${DIR} | wc -l)

echo "The number of files are $NUM_FILES and the number of matching lines are $NUM_MATCHING_LINES"