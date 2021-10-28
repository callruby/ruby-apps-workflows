#!/bin/bash
set +e  
if [[ -z "$CONSUL_HTTP_TOKEN" ]]; then
  export CONSUL_HTTP_TOKEN=$(cat /vault/secrets/consul-creds | grep token: | sed 's,token: ,,g')
fi
/usr/local/bin/confd -onetime -backend consul -node ${CONSUL_HTTP_ADDR:-http://127.0.0.1:8500} -prefix "appsettings/${RUBY_ENVIRONMENT}" -log-level debug
cd /app
CONSUL_HTTP_ADDR=$(echo $CONSUL_HTTP_ADDR | sed 's,http://,,g' | sed 's,https://,,g')

echo "====================================="
echo "Consul Token: $CONSUL_HTTP_TOKEN"
echo "Consul Address: $CONSUL_HTTP_ADDR"
echo "Prefix: appsettings/${RUBY_ENVIRONMENT}"
echo "Environment: $RUBY_ENVIRONMENT"
echo "Datacenter: ${RUBY_DATACENTER}"
echo "====================================="
echo ""
echo "Executing: Prlv2 Web API Gateway..."
exec dotnet Prlv2.WebAPI.dll
