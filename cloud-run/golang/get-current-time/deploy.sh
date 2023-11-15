GOOGLE_PROJECT_ID=# YOUR GCP PROJECT ID GOES HERE
REPOSITORY_NAME=# YOUR ARTIFACT REPOSITORY NAME GOES HERE
LOCATION_NAME=# YOUR GOOGLE CLOUD LOCATION GOES HERE

gcloud builds submit --tag $LOCATION_NAME-docker.pkg.dev/$GOOGLE_PROJECT_ID/$REPOSITORY_NAME/get-current-time \
  --project=$GOOGLE_PROJECT_ID

gcloud run deploy get-current-time \
  --image $LOCATION_NAME-docker.pkg.dev/$GOOGLE_PROJECT_ID/$REPOSITORY_NAME/get-current-time \
  --platform managed \
  --region=$LOCATION_NAME \
  --project=$GOOGLE_PROJECT_ID