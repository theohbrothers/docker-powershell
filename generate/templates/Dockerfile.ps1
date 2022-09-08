@"
FROM mcr.microsoft.com/powershell:$( $VARIANT['_metadata']['base_image_tag'] )

# Disable telemetry for powershell 7.0.0 and above and .NET core: https://github.com/PowerShell/PowerShell/issues/16234#issuecomment-942139350
ENV POWERSHELL_CLI_TELEMETRY_OPTOUT=1
ENV POWERSHELL_TELEMETRY_OPTOUT=1
ENV POWERSHELL_UPDATECHECK=Off
ENV POWERSHELL_UPDATECHECK_OPTOUT=1
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
ENV DOTNET_TELEMETRY_OPTOUT=1
ENV COMPlus_EnableDiagnostics=0

# Install Pester
RUN pwsh -c 'Install-Module Pester -Force -Scope AllUsers -MinimumVersion 4.0.0 -MaximumVersion 4.10.1 -ErrorAction Stop'


"@

$VARIANT['_metadata']['components'] | ? { $_ } | % {
    $component = $_
    if ( $VARIANT['_metadata']['base_image_tag'] -match '\balpine\b' ) {
        switch ($component) {
            'git' {
                @"
RUN apk add --no-cache git


"@
            }
            'sops' {

                @"
# Note: `sops` does not provide binaries for other arch other than `linux/i386` and `linux/amd64`. So `sops` might not work on other architectures.
RUN wget -qO- https://github.com/mozilla/sops/releases/download/v3.7.1/sops-v3.7.1.linux > /usr/local/bin/sops && chmod +x /usr/local/bin/sops

RUN apk add --no-cache gnupg


"@
            }
            default {
                throw "No such component: $component"
            }
        }

    }elseif ( $VARIANT['_metadata']['base_image_tag'] -match '\bubuntu\b' ) {
        switch ($component) {
            'git' {
                @"
RUN apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*


"@
            }
            'sops' {
                @"
# Note: `sops` does not provide binaries for other arch other than `linux/i386` and `linux/amd64`. So `sops` might not work on other architectures.
RUN apt-get update \
    && apt-get install -y wget \
    && wget -qO- https://github.com/mozilla/sops/releases/download/v3.7.1/sops-v3.7.1.linux > /usr/local/bin/sops && chmod +x /usr/local/bin/sops \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && (apt-get install -y gpg || apt-get install -y gpgv2) \
    && rm -rf /var/lib/apt/lists/*


"@
            }
            default {
                throw "No such component: $component"
            }
        }
    }else {
        throw "Only alpine and ubuntu base image tags supported"
    }
}
