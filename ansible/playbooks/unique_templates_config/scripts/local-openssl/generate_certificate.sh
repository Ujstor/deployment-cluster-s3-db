#!/bin/sh

openssl genrsa -out ujstor.com.key 2048

openssl req -new -key ujstor.com.key -out ujstor.com.csr -subj "/CN=ujstor.com"

openssl x509 -req -days 365 -in ujstor.com.csr -signkey ujstor.com.key -out ujstor.com.crt

cp ujstor.com.crt /app/ujstor.com.crt
cp ujstor.com.key /app/ujstor.com.key

echo "SSL certificate for ujstor.com generated successfully!"