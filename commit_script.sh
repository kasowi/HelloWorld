#!/bin/bash

# Define the phrase to spell out
PHRASE="HELLO WORLD"

# Get the current date
CURRENT_DATE=$(date +"%Y-%m-%d")

# Count the number of manual commits for the day
MANUAL_COMMITS=$(git rev-list --count --since="midnight" HEAD)

# Loop through each character in the phrase
for ((i=0; i<${#PHRASE}; i++)); do
    # Get the current character
    CHAR="${PHRASE:$i:1}"

    # Create a new branch for the character
    git checkout -b "${CHAR}_${CURRENT_DATE}"

    # Make a commit only if it hasn't been manually committed
    if [ $i -ge $MANUAL_COMMITS ]; then
        git commit --allow-empty -m "Add ${CHAR} pixel"
    fi

    # Push the branch to GitHub
    git push origin "${CHAR}_${CURRENT_DATE}"

    # Sleep for a while to avoid rate limiting
    sleep 5
done

# Switch back to the main branch
git checkout main
