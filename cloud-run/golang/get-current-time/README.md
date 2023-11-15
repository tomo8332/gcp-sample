# Description  
日本の現在時刻を取得する。  

# What service do you use?  
Cloud Run  
言語：Go  

# Initialization  
1. Artifact Registry用のDockerリポジトリを作成する。  

```
REPOSITORY_NAME＝# YOUR ARTIFACT REPOSITORY NAME GOES HERE
LOCATION_NAME=# YOUR GOOGLE CLOUD LOCATION GOES HERE
GOOGLE_PROJECT_ID=# YOUR GCP PROJECT ID GOES HERE

gcloud artifacts repositories create $REPOSITORY_NAME \
    --repository-format=docker \
    --location=$LOCATION_NAME \
    --description="Docker repository" \
    --project=$GOOGLE_PROJECT_ID
```

2. vimコマンドを使って、`deploy.sh` を修正  
下記の環境変数を修正してください。  

```
GOOGLE_PROJECT_ID=# YOUR GCP PROJECT ID GOES HERE
REPOSITORY_NAME=# YOUR ARTIFACT REPOSITORY NAME GOES HERE
LOCATION_NAME=# YOUR GOOGLE CLOUD LOCATION GOES HERE
```

3. `deploy.sh` スクリプトに実行権限がない場合、  
コマンドを実行して、ファイルに実行権限を与える。  

```
chmod +x ./deploy.sh
```

# Deploy  
`deploy.sh` スクリプトを実行して、`Artifact Registory` に対して、  
イメージのビルドとプッシュを行い、Cloud RunのServiceをデプロイする。  

```
./deploy.sh
```