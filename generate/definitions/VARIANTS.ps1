# Docker image variants' definitions
$local:VARIANTS_BASE_IMAGE_TAGS = @(
    '6.1.3-alpine-3.8'
    '6.2.4-alpine-3.8'
    '7.0.3-alpine-3.9-20200928'
    '7.1.1-alpine-3.11-20210125'
    '7.2.0-preview.2-alpine-3.11-20210125'
    '6.0.2-ubuntu-16.04'
    '6.1.3-ubuntu-18.04'
    '6.2.4-ubuntu-18.04'
    '7.0.3-ubuntu-18.04-20201027'
    '7.1.1-ubuntu-18.04-20210125'
    '7.2.0-preview.2-ubuntu-18.04-20210125'
)
$local:VARIANTS_MATRIX = @(
    $local:VARIANTS_BASE_IMAGE_TAGS | % {
        @{
            base_image_tag = $_
            subvariants = @(
                @{ components = $null }
                @{ components = @( 'git' ); tag_as_latest = if ($_ -eq $local:VARIANTS_BASE_IMAGE_TAGS[$local:VARIANTS_BASE_IMAGE_TAGS.Count - 1]) { $true } else { $false } }
            )
        }
    }
)
$VARIANTS = @(
    foreach ($variant in $VARIANTS_MATRIX){
        foreach ($subVariant in $variant['subvariants']) {
            @{
                # Metadata object
                _metadata = @{
                    base_image_tag = $variant['base_image_tag']
                    components = $subVariant['components']
                }
                # Docker image tag. E.g. '6.1.0-alpine-3.8', '6.1.0-alpine-3.8-git',
                tag = @(
                    $variant['base_image_tag']
                    $subVariant['components'] | ? { $_ }
                ) -join '-'
                tag_as_latest = if ( $subVariant.Contains('tag_as_latest') ) {
                                    $subVariant['tag_as_latest']
                                } else {
                                    $false
                                }
            }
        }
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
    buildContextFiles = @{
        templates = @{
            'Dockerfile' = @{
                common = $true
                includeHeader = $true
                includeFooter = $true
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}

# Send definitions down the pipeline
$VARIANTS
