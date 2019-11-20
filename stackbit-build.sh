#!/usr/bin/env bash

set -e
set -o pipefail
set -v

if [[ -z "${STACKBIT_API_KEY}" ]]; then
    echo "WARNING: No STACKBIT_API_KEY environment variable set, skipping stackbit-pull"
else
    npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://a9f7d68d.ngrok.io/pull/5dd5829b64a87e4e2eac41cc 
fi
jekyll build
./inject-netlify-identity-widget.js _site
