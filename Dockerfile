# for a docker image with:
# CUDA 9.0 + cuDNN 7.x
# Anaconda 5.2 (python 3.6)
# .NET Core 2.x SDK for linux
# Azure function dev core tools

FROM tftwdockerhub/cuda_cudnn_ana_base:latest

# the maintainer information
LABEL maintainer "TeleWare Data Scientist <teng.fu@teleware.com>"

# apt-get update && keys ready
# Install .NET CLI dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
        curl \
    && rm -rf /var/lib/apt/lists/*

# Register Microsoft Key and Feed
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

# install the .NET SDK
RUN apt-get install -y --no-install-recommends apt-transport-https  \
    && apt-get update \
    && apt-get install -y --no-install-recommends dotnet-sdk-2.2

# Register Microsoft Product Key as Trusted
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# verify current Ubuntu server
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'

# update and install Azure function Core tool
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    azure-functions-core-tools

# setup the work dir
# the Azure function project directory is also in this directory
WORKDIR /app
