---
deployment:
  name: flask-app
  image: "${account_id}.dkr.ecr.us-east-1.amazonaws.com/flask"
  tag: latest
  replicas: 2
  port: 5000
  env: prod
  domain: ev4o.com
  region: ${region}

service:
  port: 80
  targetport: 5000
