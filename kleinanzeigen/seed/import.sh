#!/usr/bin/env bash
set -euo pipefail

MONGO_URI="${MONGO_URI:-mongodb://mongodb.kleinanzeigen.svc.cluster.local:27017/kleinanzeigen}"

for _ in $(seq 1 60); do
  if mongosh "$MONGO_URI" --quiet --eval 'db.adminCommand({ ping: 1 }).ok' >/dev/null 2>&1; then
    break
  fi
  sleep 2
done

mongoimport --uri "$MONGO_URI" --collection geocodingLocations --drop --file /seed/geocodingLocations.json
mongoimport --uri "$MONGO_URI" --collection articles --drop --file /seed/articles.json
mongoimport --uri "$MONGO_URI" --collection searchProfiles --drop --file /seed/searchProfiles.json
mongoimport --uri "$MONGO_URI" --collection searchRequests --drop --file /seed/searchRequests.json
