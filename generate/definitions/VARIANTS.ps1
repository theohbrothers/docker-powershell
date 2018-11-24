# Docker image variants' definitions
$VARIANTS_VERSION = "1.0.0"
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
    version = $VARIANTS_VERSION
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