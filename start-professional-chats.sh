#!/bin/bash
set -e  
cat /vault/secrets/* >> ${SECRETS}
echo ${SECRETS}
for s in $(cat /vault/secrets/professional-chat | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
    export $s
done
npm run awsstart
