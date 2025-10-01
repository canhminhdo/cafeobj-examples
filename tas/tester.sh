#!/bin/sh

echo "~~~~~~~~~~ TESTING ~~~~~~~~~~"
DIR="test"
BASEDIR=$PWD
ls | grep "proof" | sort -V | while read -r PROOF; do
    echo "Checking $PROOF ..."
    NAME=`echo $PROOF | cut -d '.' -f1`
    cafeobj -batch $PROOF | grep -E "\(true\):Bool|case" > "$DIR/$NAME.out"
    diff "$DIR/$NAME.expected" "$DIR/$NAME.out"
    rm "$DIR/$NAME.out"
done
echo "DONE!"