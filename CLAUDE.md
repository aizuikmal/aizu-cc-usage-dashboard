# Project Instructions

## Deployment

After every commit and push to `master`, also merge to `gh-pages`:

```bash
git checkout gh-pages && git merge master && git push && git checkout master
```

This ensures GitHub Pages deployment stays in sync with master.
