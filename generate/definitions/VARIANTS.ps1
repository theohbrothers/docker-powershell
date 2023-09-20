# Docker image variants' definitions
$local:BASE_IMAGE_TAGS = @(
    '7.3-alpine-3.17'
    'lts-7.2-alpine-3.17'
    '7.1.5-alpine-3.13-20211021'
    '7.0.3-alpine-3.9-20200928'
    '6.2.4-alpine-3.8'
    '6.1.3-alpine-3.8'

    '7.3-ubuntu-22.04'
    'lts-7.2-ubuntu-22.04'
    '7.1.5-ubuntu-20.04-20211021'
    '7.0.3-ubuntu-18.04-20201027'
    '6.2.4-ubuntu-18.04'
    '6.1.3-ubuntu-18.04'
    '6.0.4-ubuntu-16.04'
)
$local:BASE_IMAGE_TAG_LATEST_STABLE = $local:BASE_IMAGE_TAGS | ? { $_ -match 'ubuntu' } | Select-Object -First 1
$local:VARIANTS_MATRIX = @(
    $local:BASE_IMAGE_TAGS | % {
        @{
            base_image_tag = $_
            subvariants = @(
                @{ components = @() }
                @{ components = @( 'git', 'sops' ) }
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
                    platforms =  'linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64,linux/s390x'
                    components = $subVariant['components']
                }
                # Docker image tag. E.g. '7.1.5-alpine-3.13'
                tag = @(
                    $variant['base_image_tag'] -replace '^lts-', '' -replace '-\d{8}$', '' # Replace 'lts-' prefix and 8-digit calver suffix
                    $subVariant['components'] | ? { $_ }
                ) -join '-'
                tag_as_latest = if ($variant['base_image_tag'] -eq $local:BASE_IMAGE_TAG_LATEST_STABLE -and $subVariant['components'].Count -eq 0) { $true } else { $false }
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
                includeHeader = $false
                includeFooter = $false
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
            'docker-entrypoint.sh' = @{
                common = $true
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}
