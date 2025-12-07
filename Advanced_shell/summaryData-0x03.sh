#!/bin/bash

DIR="pokemon_data"
REPORT="pokemon_report.csv"

echo "Name,Height (m),Weight (kg)" > "$REPORT"
TOTAL_HEIGHT=0
TOTAL_WEIGHT=0
COUNT=0

for FILE in "$DIR"/*.json; do
    NAME=$(jq -r '.name' "$FILE" | sed 's/.*/\u&/')
    HEIGHT=$(jq -r '.height' "$FILE")
    WEIGHT=$(jq -r '.weight' "$FILE")
    HEIGHT_M=$(awk "BEGIN {printf \"%.1f\", $HEIGHT/10}")
    echo "$NAME,$HEIGHT_M,$WEIGHT" >> "$REPORT"
    
    TOTAL_HEIGHT=$(awk "BEGIN {print $TOTAL_HEIGHT + $HEIGHT_M}")
    TOTAL_WEIGHT=$(awk "BEGIN {print $TOTAL_WEIGHT + $WEIGHT}")
    COUNT=$((COUNT+1))
done

AVG_HEIGHT=$(awk "BEGIN {printf \"%.2f\", $TOTAL_HEIGHT/$COUNT}")
AVG_WEIGHT=$(awk "BEGIN {printf \"%.2f\", $TOTAL_WEIGHT/$COUNT}")

echo -e "\nAverage Height: $AVG_HEIGHT m"
echo "Average Weight: $AVG_WEIGHT kg"
