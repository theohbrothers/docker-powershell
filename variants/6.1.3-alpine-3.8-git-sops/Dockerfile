FROM mcr.microsoft.com/powershell:6.1.3-alpine-3.8

# Disable telemetry for powershell 7.0.0 and above and .NET core: https://github.com/PowerShell/PowerShell/issues/16234#issuecomment-942139350
ENV POWERSHELL_CLI_TELEMETRY_OPTOUT=1
ENV POWERSHELL_TELEMETRY_OPTOUT=1
ENV POWERSHELL_UPDATECHECK=Off
ENV POWERSHELL_UPDATECHECK_OPTOUT=1
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
ENV DOTNET_TELEMETRY_OPTOUT=1
ENV COMPlus_EnableDiagnostics=0

# Install Pester
RUN pwsh -c 'Install-Module Pester -Scope AllUsers -MinimumVersion 4.10.1 -MaximumVersion 4.10.1 -Force -ErrorAction Stop -Verbose'

RUN apk add --no-cache git

# Install sops
RUN set -eux; \
    SOPS_VERSION=3.13.3; \
    case "$( uname -m )" in \
        'x86_64') \
            URL="https://github.com/getsops/sops/releases/download/v3.13.3/sops-v3.13.3.linux.amd64"; \
            SHA256=e5bec3346a873ae91d871550f3e698c1aad962aff462a080e40f25fde17fef6b; \
            ;; \
        'aarch64') \
            URL="https://github.com/getsops/sops/releases/download/v3.13.3/sops-v3.13.3.linux.arm64"; \
            SHA256=53b0abacd38ef1b12a66d6c100956691b9cefce018d91f81e73ddf7438b94d77; \
            ;; \
        *) \
            URL="https://github.com/getsops/sops/releases/download/v3.13.3/sops-v3.13.3.linux.amd64"; \
            SHA256=e5bec3346a873ae91d871550f3e698c1aad962aff462a080e40f25fde17fef6b; \
            ;; \
    esac; \
    FILE=sops; \
    wget -q "$URL" -O "$FILE"; \
    echo "$SHA256  $FILE" | sha256sum -c -; \
    BIN=sops; \
    mkdir -pv /usr/local/bin; \
    mv -v "$BIN" /usr/local/bin/sops; \
    chmod +x /usr/local/bin/sops; \
    sops --version --disable-version-check; \
    :

# Install gnupg for sops
RUN apk add --no-cache gnupg

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "pwsh" ]
