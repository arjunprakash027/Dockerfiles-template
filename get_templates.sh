#!/bin/bash

SCRIPT_NAME=$(basename "$0")

# -z checks if the length of input is 0
if [ -z "$1" ]; then
    echo "useage : bash $SCRIPT_NAME <template>"
    exit 1
fi

TEMPLATE_NAME="$1"

GITHUB_USERNAME="arjunprakash027"
GITHUB_TEMPLATE_REPOSITORY="Templates"
DOWNLOAD_URL="https://github.com/$GITHUB_USERNAME/$GITHUB_TEMPLATE_REPOSITORY"

# List out all the available templates
if [ "$1" == "help" ]; then
    curl -s "https://api.github.com/repos/$GITHUB_USERNAME/$GITHUB_TEMPLATE_REPOSITORY/git/trees/main"
    exit 1
fi

# Recursive is to checkout submodules too, depth 1 is to checkout only latest commit and not the history
git clone --recursive --depth 1 "$DOWNLOAD_URL"

cp -r ./"$GITHUB_TEMPLATE_REPOSITORY"/"$TEMPLATE_NAME"/. ./

rm -rf ./"$GITHUB_TEMPLATE_REPOSITORY"

