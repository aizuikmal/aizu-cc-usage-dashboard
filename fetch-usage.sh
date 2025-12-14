#!/bin/bash
set -e
cd "$(dirname "$0")"
mkdir -p data

echo "Fetching ccusage data..."
ccusage daily --json > data/daily.json
ccusage monthly --json > data/monthly.json
ccusage session --json > data/sessions.json

echo "Data fetched at $(date)"
