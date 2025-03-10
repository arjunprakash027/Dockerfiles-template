#!/bin/bash
first_match=$(find -type d -name "$1" | head -n 1)
echo "Found folder: $first_match"
