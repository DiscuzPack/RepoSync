# Container image that runs your code
FROM alpine:latest

# Update Container to latest version
RUN apk --update-cache upgrade

RUN apk add git

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Add Permission
RUN chmod 777 /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]