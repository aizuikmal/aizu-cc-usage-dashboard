#!/bin/bash
set -e
cd "$(dirname "$0")"

echo "=========================================="
echo "Deploy started at $(date)"
echo "=========================================="

# Fetch latest usage data
./fetch-usage.sh

# Configure git for cron environment
git config user.email "bot@localhost" 2>/dev/null || true
git config user.name "Usage Bot" 2>/dev/null || true

# Check if there are changes
if git diff --quiet data/ 2>/dev/null && git diff --cached --quiet data/ 2>/dev/null; then
    echo "No changes to data files, skipping commit"
    exit 0
fi

# Add and commit changes
git add data/ index.html
git commit -m "Update usage data $(date '+%Y-%m-%d %H:%M')" || {
    echo "Nothing to commit"
    exit 0
}

# Push to master
echo "Pushing to master..."
git push origin master

# Push to gh-pages (force push the content)
echo "Deploying to gh-pages..."
git push origin master:gh-pages --force

echo "=========================================="
echo "Deploy completed at $(date)"
echo "=========================================="
