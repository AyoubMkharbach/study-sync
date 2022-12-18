# study-sync
Create EB env

## Create EB env with a single instance
```
eb create --single
```

## Blue / Green
```
eb clone
eb deploy your-cloned-env
eb swap your-env --destination_name your-cloned-env
```

## Docker
For now, Elastic Beanstalk can only deploy Node.js application. We have to change the configuration to deploy docker images.

Run the following eb command and answer `Y`:
```
eb platform select
```

Build an image from your Dockerfile :
```
docker build --tag study-sync:1.0 .
docker run --env PORT=8080 --publish 8080:8080 study-sync:1.0
```

##ECR
Login to AWS ECR (userid to be changed), tag your image and push it :
```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin {userid}.dkr.ecr.us-east-1.amazonaws.com

docker tag 426e7b9e769f {userid}.dkr.ecr.us-east-1.amazonaws.com/study-sync

docker push {userid}.dkr.ecr.us-east-1.amazonaws.com/study-sync
```