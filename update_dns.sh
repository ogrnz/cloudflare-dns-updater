#!/bin/bash

# Export vars
export $(grep -v '^#' .env | xargs)

IP=$(curl ifconfig.me)

echo "$IP"

# Unset vars
unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)

