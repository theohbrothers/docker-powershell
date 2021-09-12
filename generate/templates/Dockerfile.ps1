@"
FROM mcr.microsoft.com/powershell:$( $VARIANT['_metadata']['base_image_tag'] )


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
