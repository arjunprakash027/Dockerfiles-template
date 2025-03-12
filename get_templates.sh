#!/bin/bash

SCRIPT_NAME=$(basename "$0")
TEMPLATE_NAME="$1"

# -z checks if the length of input is 0
if [ -z "$TEMPLATE_NAME" ]; then
    echo "useage : bash $SCRIPT_NAME <template>"
    exit 1
fi


GITHUB_USERNAME="arjunprakash027"
GITHUB_TEMPLATE_REPOSITORY="Dockerfiles-template"
DOWNLOAD_URL="https://github.com/$GITHUB_USERNAME/$GITHUB_TEMPLATE_REPOSITORY"

# List out all the available Dockerfiles-template
if [ "$1" == "help" ]; then
    curl -s "https://api.github.com/repos/$GITHUB_USERNAME/$GITHUB_TEMPLATE_REPOSITORY/git/trees/main"
    exit 1
fi

# Recursive is to checkout submodules too, depth 1 is to checkout only latest commit and not the history
git clone --recursive --depth 1 "$DOWNLOAD_URL"

# Getting the location of template inside the repository
TEMPLATE_LOCATION=$(find -type d -name "$TEMPLATE_NAME" | head -n 1)

if [ -z "$TEMPLATE_LOCATION" ]; then
    echo "$TEMPLATE_NAME not found"
else
    cp -r $TEMPLATE_LOCATION ./
fi

echo "Deleting the repository"
rm -rf ./"$GITHUB_TEMPLATE_REPOSITORY"

