# Docker image variants' definitions
$VARIANTS = @(
    @{
        tag = 'curl-ubuntu18.04'
        distro = 'ubuntu18.04'
    }
    @{
        tag = 'curl-git-ubuntu18.04'
        distro = 'ubuntu18.04'
    }
    @{
        tag = 'git-ubuntu18.04'
        distro = 'ubuntu18.04'
    }
    @{
        tag = 'curl-alpine'
        distro = 'alpine'
    }
    @{
        tag = 'curl-git-alpine'
        distro = 'alpine'
    }
    @{
        tag = 'git-alpine'
        distro = 'alpine'
    }
)

# Docker image variants' definitions (shared)
$VARIANTS_SHARED = @{
    buildContextFiles = @{
        templates = @{
            'Dockerfile' = @{
                common = $false
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
