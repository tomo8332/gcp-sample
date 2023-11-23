#! /bin/bash

GOOGLE_PROJECT_ID=# YOUR GCP PROJECT ID GOES HERE
REPOSITORY_NAME=# YOUR ARTIFACT REPOSITORY NAME GOES HERE
LOCATION_NAME=# YOUR GOOGLE CLOUD LOCATION GOES HERE
CONNECTION_NAME=# YOUR CONNECTION NAME GOES HERE

gcloud builds submit --tag $LOCATION_NAME-docker.pkg.dev/$GOOGLE_PROJECT_ID/$REPOSITORY_NAME/tab-or-space-python \
  --project=$GOOGLE_PROJECT_ID

gcloud run deploy tab-or-space \
  --image $LOCATION_NAME-docker.pkg.dev/$GOOGLE_PROJECT_ID/$REPOSITORY_NAME/tab-or-space-python \
  --platform managed \
  --region=$LOCATION_NAME \
  --allow-unauthenticated \
  --add-cloudsql-instances=$CONNECTION_NAME \
  --project=$GOOGLE_PROJECT_ID
