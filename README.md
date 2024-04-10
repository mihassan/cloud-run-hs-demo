# Overview

This is a demo project to demonstrate how to use Google Cloud Run with Haskell to build a backend API.

The API fetches a random quote from a SQLite database and returns it as JSON.

# Run Locally

```bash
$ cabal build && caba run
```

# Deploy to Google Cloud Run

1. Create a new project in Google Cloud Console if you don't have one already.
1. Enable Billing for the project.
1. Enable Identity and Access Management (IAM) API.
1. Follow the instructions [here](https://cloud.google.com/run/docs/continuous-deployment-with-cloud-build) to setup continuous deployment directly from GitHub.
1. Allow unauthenticated invocations for testing and demo purposes. Note that, this will make your service vulnerable to abuse.
  a. Alternatively, follow instructions [here](https://cloud.google.com/run/docs/authenticating/developers) for testing while development.
1. Adjust memory, vCPU, and instance scaling settings as needed to avoid over-provisioning and reduce costs.

# Notable Dependencies

- `scotty` for web framework
- `wai` for web application interface
- `sqlite-simple` for database
- Alpinejs for reactive frontend
- PicoCSS for minimal CSS

# Future Work
- Add tests
- Add logging
- Add error handling
- Add authentication
- Add API to save quotes

