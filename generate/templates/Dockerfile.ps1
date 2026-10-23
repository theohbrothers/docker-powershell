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
RUN pwsh -c 'Install-Module Pester -Scope AllUsers -MinimumVersion 4.0.0 -MaximumVersion 4.10.1 -Force -ErrorAction Stop -Verbose'


"@

if ( $VARIANT['_metadata']['base_image_tag'] -match '\bubuntu\b' ) {
    @"
# Add basic provisioning tools
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y wget; \
    rm -rf /var/lib/apt/lists/*


"@
}

foreach ($c in $VARIANT['_metadata']['components']) {
    if ( $VARIANT['_metadata']['base_image_tag'] -match '\balpine\b' ) {
        switch ($c) {
            'git' {
@"
RUN apk add --no-cache git


"@
            }

            'sops' {
                $SOPS_VERSION = "3.13.3"
                Generate-DownloadBinary @{
                    binary = 'sops'
                    version = $SOPS_VERSION
                    checksumsUrl = "https://github.com/getsops/sops/releases/download/v$SOPS_VERSION/sops-v$SOPS_VERSION.checksums.txt"
                    platformFallback = 'linux/amd64'
                    destination = '/usr/local/bin/sops'
                    testCommand = 'sops --version --disable-version-check'
                }

                @"
RUN apk add --no-cache gnupg


"@
            }

            default {
                throw "No such component: $component"
            }
        }

    }elseif ( $VARIANT['_metadata']['base_image_tag'] -match '\bubuntu\b' ) {
        switch ($c) {
            'git' {
@"
RUN set -eux; \
    apt-get update; \
    apt-get install -y git; \
    rm -rf /var/lib/apt/lists/*


"@
            }

            'sops' {
                $SOPS_VERSION = "3.13.3"
                Generate-DownloadBinary @{
                    binary = 'sops'
                    version = $SOPS_VERSION
                    checksumsUrl = "https://github.com/getsops/sops/releases/download/v$SOPS_VERSION/sops-v$SOPS_VERSION.checksums.txt"
                    platformFallback = 'linux/amd64'
                    destination = '/usr/local/bin/sops'
                    testCommand = 'sops --version --disable-version-check'
                }

                @"
# Install gnupg for sops
RUN set -eux; \
    apt-get update; \
    apt-get install --no-install-recommends -y gnupg2; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*


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

@"
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "pwsh" ]

"@
