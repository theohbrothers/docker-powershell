FROM mcr.microsoft.com/powershell:7.0.3-alpine-3.9-20200928

RUN apk add --no-cache git

# Note: sops does not provide binaries for other arch other than linux/i386 and linux/amd64. So sops might not work on other architectures.
RUN wget -qO- https://github.com/mozilla/sops/releases/download/v3.7.1/sops-v3.7.1.linux > /usr/local/bin/sops && chmod +x /usr/local/bin/sops

RUN apk add --no-cache gnupg

