# syntax=docker/dockerfile:1

# Using docker multistage build.
FROM haskell:9.8.2-slim-buster AS build

# Copy local code to the container image.
WORKDIR /app

RUN cabal update

# Docker will cache this command as a layer, freeing us up to
# Add just the .cabal file to capture dependencies
COPY ./CloudRunDemo.cabal /app/CloudRunDemo.cabal

# modify source code without re-installing dependencies
# (unless the .cabal file changes!)
RUN cabal build --only-dependencies -j4

COPY . .

# Add and Install Application Code
RUN cabal install

# Build final image by copying the executable, db, and static files.
FROM debian:buster-slim

WORKDIR /app

COPY . .

COPY --from=build /root/.local/bin/CloudRunDemo /usr/local/bin

# Service must listen to $PORT environment variable.
# This default value facilitates local development.
ENV PORT 8080

# The sqlite database file must be copied to the container.
ENV DB_PATH /app/db/quotes.db

# Run the web service on container startup.
CMD ["CloudRunDemo"]
