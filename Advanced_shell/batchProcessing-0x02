#!/bin/bash

POKEMONS=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")
DIR="pokemon_data"
mkdir -p "$DIR"

for POKEMON in "${POKEMONS[@]}"; do
    ATTEMPTS=0
    SUCCESS=0
    while [ $ATTEMPTS -lt 3 ]; do
        ATTEMPTS=$((ATTEMPTS+1))
        echo "Fetching data for $POKEMON (Attempt $ATTEMPTS)..."
        HTTP_STATUS=$(curl -s -w "%{http_code}" -o "$DIR/$POKEMON.json" "https://pokeapi.co/api/v2/pokemon/$POKEMON")
        
        if [ "$HTTP_STATUS" -eq 200 ]; then
            echo "Saved data to $DIR/$POKEMON.json ✅"
            SUCCESS=1
            break
        fi
        
        echo "Attempt $ATTEMPTS failed. Retrying in 2 seconds..."
        sleep 2
    done
    
    if [ $SUCCESS -eq 0 ]; then
        echo "Failed to fetch $POKEMON after 3 attempts" >> errors.txt
    fi
    
    sleep 1
done
