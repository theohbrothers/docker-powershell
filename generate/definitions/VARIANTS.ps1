# Docker image variants' definitions
$local:VARIANTS_BASE_IMAGE_TAGS = @(
    '7.2.0-preview.9-alpine-3.11-20210819'
    '7.1.5-alpine-3.11-20211021'
    '7.0.3-alpine-3.9-20200928'
    '6.2.4-alpine-3.8'
    '6.1.3-alpine-3.8'

    '7.2.0-preview.9-ubuntu-18.04-20210819'
    '7.1.5-ubuntu-18.04-20211021'
    '7.0.3-ubuntu-18.04-20201027'
    '6.2.4-ubuntu-18.04'
    '6.1.3-ubuntu-18.04'
    '6.0.2-ubuntu-16.04'
)
$local:VARIANTS_BASE_IMAGE_TAG_LATEST_STABLE = $VARIANTS_BASE_IMAGE_TAGS | Sort-Object -Descending -Property @{ Expression={ if ($_ -match '^(v?\d+\.\d+\.\d+)') { [version]$matches[1] } } } | ? { $_ -notmatch 'preview' -and $_ -match 'ubuntu\-18.04' } | Select-Object -First 1
$local:VARIANTS_MATRIX = @(
    $local:VARIANTS_BASE_IMAGE_TAGS | % {
        @{
            base_image_tag = $_
            subvariants = @(
                @{ components = $null }
                @{ components = @( 'git', 'sops' ); tag_as_latest = if ($_ -eq $local:VARIANTS_BASE_IMAGE_TAG_LATEST_STABLE ) { $true } else { $false } }
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
                includeHeader = $false
                includeFooter = $false
                passes = @(
                    @{
                        variables = @{}
                    }
                )
            }
        }
    }
}
