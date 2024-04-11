# Overview

This is a demo project to demonstrate how to use Google Cloud Run with Haskell to build a backend API.

The API fetches a random quote from a SQLite database and returns it as JSON.

It also serves static webpages to display the quote as a demonstration of how to use the API.

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

# Limitations

The setup lacks many essential features necessary for production ready service - like rate limiting, authentication mechanisms, and DDoS protection.
Also, I have opted for simplest libraries I could work with for web framework and database.
In practice, there are other libraries which may be more suited for specific project.
These are critical for production-grade services to ensure security and manageability.
This project serves as a demonstration on how easy it is to get started.

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

