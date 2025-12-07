#!/bin/bash

POKEMON="pikachu"
OUTPUT="data.json"
ERRORS="errors.txt"

# Make API request
HTTP_STATUS=$(curl -s -w "%{http_code}" -o "$OUTPUT" "https://pokeapi.co/api/v2/pokemon/$POKEMON")

# Check if request succeeded
if [ "$HTTP_STATUS" -ne 200 ]; then
    echo "Failed to fetch $POKEMON. HTTP Status: $HTTP_STATUS" >> "$ERRORS"
    rm -f "$OUTPUT"
    exit 1
fi

echo "Successfully fetched $POKEMON data."
