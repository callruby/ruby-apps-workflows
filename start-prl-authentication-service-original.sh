#!/bin/bash
set -e  

/usr/local/bin/confd -onetime -backend consul -node ${CONSUL_HTTP_ADDR:-http://127.0.0.1:8500} -prefix "appsettings/${RUBY_ENVIRONMENT}" -log-level debug

echo "Starting Ruby.Microservices.Authentication"
cd /app
exec dotnet Ruby.Microservices.Authentication.dll
