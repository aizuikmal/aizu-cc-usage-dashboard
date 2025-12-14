# Claude Code Usage Dashboard

A professional dashboard for tracking Claude Code usage metrics, costs, and analytics.

**Live Dashboard:** https://aizuikmal.github.io/aizu-cc-usage-dashboard

## Features

- Real-time usage metrics (tokens, cost, sessions)
- Daily/weekly usage charts
- Model breakdown (Opus, Sonnet, Haiku)
- Cache efficiency analytics
- 30-day activity heatmap
- Dark/light mode toggle (dark by default)
- Privacy-focused: project names are masked with initials (e.g., "Project APD")

## Project Structure

```
├── index.html        # Main dashboard (single-page app)
├── data/
│   ├── daily.json    # Daily usage data
│   ├── monthly.json  # Monthly aggregates
│   └── sessions.json # Per-project session data
├── deploy.sh         # Automated deployment script
├── fetch-usage.sh    # Fetches data from ccusage CLI
├── logs/
│   └── cron.log      # Deployment logs
├── CLAUDE.md         # Claude Code instructions
└── README.md         # This file
```

## Data Source

Uses [ccusage](https://github.com/ryoppippi/ccusage) CLI to fetch Claude Code usage data:

```bash
ccusage monthly --json > data/monthly.json
ccusage daily --json > data/daily.json
ccusage sessions --json > data/sessions.json
```

## Automated Updates

Cron jobs run twice daily at 7am and 7pm MYT (Malaysia Time):

```cron
0 23 * * * cd /root/projects/aizu-cc-usage-dashboard && ./deploy.sh >> logs/cron.log 2>&1
0 11 * * * cd /root/projects/aizu-cc-usage-dashboard && ./deploy.sh >> logs/cron.log 2>&1
```

The `deploy.sh` script:
1. Fetches latest usage data via `fetch-usage.sh`
2. Commits changes to `master` (if any)
3. Pushes to `master`
4. Force pushes to `gh-pages` for deployment

## Manual Deployment

```bash
# Fetch latest data
./fetch-usage.sh

# Commit and push
git add . && git commit -m "Update" && git push

# Deploy to GitHub Pages
git push origin master:gh-pages --force
```

## Tech Stack

- **Frontend:** Vanilla HTML/CSS/JavaScript
- **Charts:** Chart.js
- **Icons:** Feather Icons
- **Font:** Inter
- **Hosting:** GitHub Pages

## Privacy

Project/session names are automatically masked using initials to protect work data:
- `my-secret-project` → `Project MSP`
- `another-project` → `Project AP`
- Duplicates get numbered: `Project AP #1`, `Project AP #2`

## Theme

- Dark mode is the default
- Toggle available in the footer
- Preference saved to localStorage

## Development

Just edit `index.html` - it's a single-file dashboard with embedded CSS and JavaScript.

To test locally:
```bash
python -m http.server 8000
# Open http://localhost:8000
```
