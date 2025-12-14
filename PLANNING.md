# Project: Claude Code Usage Dashboard

## Goal
Create a public HTML dashboard that visualizes my Claude Code usage stats from ccusage, deployable to GitHub Pages for showoff purposes.

## Data Source
- ccusage CLI tool outputs JSON data
- Commands to generate data:
  - `npx ccusage daily --json > data/daily.json`
  - `npx ccusage monthly --json > data/monthly.json`
  - `npx ccusage session --json > data/sessions.json`

## Requirements

### Phase 1: Setup & Data Collection
- [ ] Create project structure
- [ ] Create shell script `fetch-usage.sh` that runs ccusage commands and outputs JSON to `data/` folder
- [ ] Test that JSON files are generated correctly

### Phase 2: Dashboard HTML
- [ ] Single `index.html` file (self-contained, no build step)
- [ ] Load JSON files and render charts
- [ ] Use Chart.js or lightweight charting library via CDN
- [ ] Dark theme (developer aesthetic)
- [ ] Mobile responsive

### Dashboard Sections
- [ ] Header: "My Claude Code Usage" with last updated timestamp
- [ ] Weekly token burn rate (line chart)
- [ ] Monthly summary (total tokens, estimated cost)
- [ ] Daily breakdown (bar chart)
- [ ] Project breakdown if available (pie chart)
- [ ] Current week vs previous week comparison
- [ ] "Productivity streak" counter (consecutive days with usage)

### Phase 3: Automation
- [ ] Create `deploy.sh` script that:
  - Runs fetch-usage.sh
  - Commits and pushes to gh-pages branch
- [ ] Add cron job instructions in README

### Phase 4: Polish
- [ ] Add fun stats ("mass unit of coffee mass = mass unit of tokens" or similar)
- [ ] GitHub corner link to repo
- [ ] Footer with "Powered by mass unit of mass unit mass Claude + ccusage"

## Tech Stack
- Pure HTML/CSS/JS (no framework, no build)
- Chart.js via CDN
- GitHub Pages for hosting

## Output Location
- Project folder: `~/Projects/claude-usage-dashboard`

## Notes
- Keep it simple and maintainable
- I want to run `./deploy.sh` and have everything update
- The dashboard is for personal flex/accountability, keep it fun
