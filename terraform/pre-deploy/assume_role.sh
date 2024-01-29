OUT=$(aws sts assume-role --role-arn arn:aws:iam::156062818068:role/eks-role --role-session-name AWSCLI-Session) \
&& export AWS_ACCESS_KEY_ID=$(echo $OUT | jq -r .Credentials.AccessKeyId) \
&& export AWS_SECRET_ACCESS_KEY=$(echo $OUT | jq -r .Credentials.SecretAccessKey) \
&& export AWS_SESSION_TOKEN=$(echo $OUT | jq -r .Credentials.SessionToken) \
&& export AWS_DEFAULT_REGION="us-east-1" \
&& aws sts get-caller-identity
