#!/bin/bash

POKEMONS=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")
DIR="pokemon_data"
mkdir -p "$DIR"

fetch_pokemon() {
    local POKEMON=$1
    HTTP_STATUS=$(curl -s -w "%{http_code}" -o "$DIR/$POKEMON.json" "https://pokeapi.co/api/v2/pokemon/$POKEMON")
    if [ "$HTTP_STATUS" -ne 200 ]; then
        echo "Failed to fetch $POKEMON" >> errors.txt
    else
        echo "Saved data to $DIR/$POKEMON.json ✅"
    fi
}

for POKEMON in "${POKEMONS[@]}"; do
    fetch_pokemon "$POKEMON" &
done

wait  # Wait for all background jobs to finish
echo "All Pokémon data fetched."
