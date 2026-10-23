FROM mcr.microsoft.com/powershell:lts-7.2-ubuntu-22.04

# Disable telemetry for powershell 7.0.0 and above and .NET core: https://github.com/PowerShell/PowerShell/issues/16234#issuecomment-942139350
ENV POWERSHELL_CLI_TELEMETRY_OPTOUT=1
ENV POWERSHELL_TELEMETRY_OPTOUT=1
ENV POWERSHELL_UPDATECHECK=Off
ENV POWERSHELL_UPDATECHECK_OPTOUT=1
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
ENV DOTNET_TELEMETRY_OPTOUT=1
ENV COMPlus_EnableDiagnostics=0

# Install Pester
RUN pwsh -c ' \
    Install-Module Pester -Scope AllUsers -RequiredVersion 4.10.1 -Force -ErrorAction Stop -Verbose; \
    Install-Module Pester -Scope AllUsers -RequiredVersion 5.9.1 -Force -ErrorAction Stop -Verbose; \
    Get-Module -ListAvailable; \
    '

# Add basic provisioning tools
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y wget; \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "pwsh" ]
