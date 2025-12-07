#!/bin/bash

DATA_FILE="data.json"

NAME=$(jq -r '.name' "$DATA_FILE" | sed 's/.*/\u&/')
HEIGHT=$(jq -r '.height' "$DATA_FILE")
WEIGHT=$(jq -r '.weight' "$DATA_FILE")
TYPE=$(jq -r '.types[0].type.name' "$DATA_FILE" | sed 's/.*/\u&/')

echo "$NAME is of type $TYPE, weighs ${WEIGHT}kg, and is $(awk "BEGIN {printf \"%.1f\", $HEIGHT/10}")m tall."
