# Download base image ubuntu 22.04
FROM ubuntu:22.04

# LABEL about the custom image
LABEL maintainer="sasa@karanovic.ca"
LABEL version="0.1"
LABEL description="OpenFan Controller Web GUI and Server docker image"
LABEL org.opencontainers.image.source=https://github.com/sasakaranovic/openfancontroller

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

ENV PATH="$PATH:/root/.local/bin"

# Update APT repos, install dependencies
RUN apt update \
 && apt install -y python3 python3-pip curl \
 && curl -sSL https://install.python-poetry.org | python3 - \
 && rm -rf /var/lib/apt/lists/* \
 && apt clean \
 && :

# Copy all source files
ADD Software/Python /mnt/OpenFan
ADD Software/start.sh /mnt/OpenFan

# Install python modules
RUN cd /mnt/OpenFan/ \
 && poetry install \
 && :

RUN ["chmod", "+x", "/mnt/OpenFan/start.sh"]


# Expose Port for the Application
EXPOSE 3000

# Run entrypoint
ENTRYPOINT ["/mnt/OpenFan/start.sh"]
