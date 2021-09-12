FROM mcr.microsoft.com/powershell:6.1.3-ubuntu-18.04

RUN apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Note: sops does not provide binaries for other arch other than linux/i386 and linux/amd64. So sops might not work on other architectures.
RUN apt-get update \
    && apt-get install -y wget \
    && wget -qO- https://github.com/mozilla/sops/releases/download/v3.7.1/sops-v3.7.1.linux > /usr/local/bin/sops && chmod +x /usr/local/bin/sops \
    && rm -rf /var/lib/apt/lists/*


RUN apt-get update \
    && (apt-get install -y gpg || apt-get install -y gpgv2) \
    && rm -rf /var/lib/apt/lists/*

