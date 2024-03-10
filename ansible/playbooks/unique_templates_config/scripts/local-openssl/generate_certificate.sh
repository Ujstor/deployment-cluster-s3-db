#!/bin/sh

# Set the correct hostname
HOSTNAME="minio.ujstor.com"

openssl ecparam -name prime256v1 -genkey -noout -out "${HOSTNAME}.key"

openssl req -new -key "${HOSTNAME}.key" -out "${HOSTNAME}.csr" -subj "/CN=${HOSTNAME}"

openssl x509 -req -days 365 -in "${HOSTNAME}.csr" -signkey "${HOSTNAME}.key" -out "${HOSTNAME}.crt"

chmod 644 ${HOSTNAME}.key
chmod 644 ${HOSTNAME}.crt

echo "SSL certificate for ${HOSTNAME} generated successfully!"

chmod 644 minio.ujstor.com.key
chmod 644 minio.ujstor.com.crt