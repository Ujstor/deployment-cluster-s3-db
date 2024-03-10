FROM alpine:latest

RUN apk --no-cache add openssl

WORKDIR /app

COPY generate_certificate.sh .

RUN chmod +x generate_certificate.sh

CMD ["sh", "generate_certificate.sh"]

# docker build -t ujstor-dev-ssl .
# docker run -v $(pwd):/app ujstor-dev-ssl

#chmod 644 ujstor.com.key
#chmod 644 ujstor.com.crt