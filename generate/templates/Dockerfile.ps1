@"
$(
$VARIANT['_metadata']['components'] | ? { $_ } | % {
    if ( $VARIANT['_metadata']['base_image_tag'] -match '\balpine\b' ) {
        @"
RUN apk add --no-cache $_
"@
    }elseif ( $VARIANT['_metadata']['base_image_tag'] -match '\bubuntu\b' ) {
        @"
RUN apt-get update \
    && apt-get install -y $_ \
    && rm -rf /var/lib/apt/lists/*
"@
    }else {
        throw "Only alpine and ubuntu base image tags supported"
    }
}
)
"@
