#!/bin/bash

# export vars
export $(grep -v '^#' .env | xargs)

IP=$(curl ifconfig.me)
curl -sS --request PUT \
  --url "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_RECORD_ID" \
  --header "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{
  \"type\": \"A\",
  \"name\":\"$RECORD\",
  \"content\":\"$IP\",
  \"ttl\": 60,
  \"proxied\": false
}"

# Unset vars
unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)

