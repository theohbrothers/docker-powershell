# Docker image variants' definitions
$local:VARIANTS_MATRIX = @(
    # alpine
    @{
        base_image_tag = '6.1.3-alpine-3.8'
        subvariants = @(
            @{ components = $null }
            @{ components = @( 'git' ) }
        )
    }
    @{
        base_image_tag = '6.2.4-alpine-3.8'
        subvariants = @(
            @{ components = $null }
            @{ components = @( 'git' ) }
        )
    }
    @{
        base_image_tag = '7.0.3-alpine-3.9'
        subvariants = @(
            @{ components = $null }
            @{ components = @( 'git' ) }
        )
    }
    @{
        base_image_tag = '7.1.1-alpine-3.11-20210125'
        subvariants = @(
            @{ components = $null }
            @{ components = @( 'git' ) }
        )
    }

    # ubuntu
    @{
        base_image_tag = '6.0.2-ubuntu-16.04'
        subvariants = @(
            @{ components = $null }
            @{ components = @( 'git' ) }
        )
    }
    @{
        base_image_tag = '6.1.3-ubuntu-18.04'
        subvariants = @(
            @{ components = $null }
            @{ components = @( 'git' ) }
        )
    }
    @{
        base_image_tag = '6.2.4-ubuntu-18.04'
        subvariants = @(
            @{ components = $null }
            @{ components = @( 'git' ) }
        )
    }
    @{
        base_image_tag = '7.0.3-ubuntu-18.04'
        subvariants = @(
            @{ components = $null }
            @{ components = @( 'git' ); tag_as_latest = $true }
        )

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
