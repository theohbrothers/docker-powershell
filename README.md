# docker-powershell

[![github-actions](https://github.com/theohbrothers/docker-powershell/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-powershell/actions)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-powershell?style=flat-square)](https://github.com/theohbrothers/docker-powershell/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-powershell/latest)](https://hub.docker.com/r/theohbrothers/docker-powershell)

Dockerized `powershell`, based on [mcr.microsoft.com/powershell](https://hub.docker.com/r/microsoft/powershell/), with useful tools.

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:7.2.0-alpine-3.14-20211102` | [View](variants/7.2.0-alpine-3.14-20211102) |
| `:7.2.0-alpine-3.14-20211102-git-sops` | [View](variants/7.2.0-alpine-3.14-20211102-git-sops) |
| `:7.1.5-alpine-3.13-20211021` | [View](variants/7.1.5-alpine-3.13-20211021) |
| `:7.1.5-alpine-3.13-20211021-git-sops` | [View](variants/7.1.5-alpine-3.13-20211021-git-sops) |
| `:7.0.3-alpine-3.9-20200928` | [View](variants/7.0.3-alpine-3.9-20200928) |
| `:7.0.3-alpine-3.9-20200928-git-sops` | [View](variants/7.0.3-alpine-3.9-20200928-git-sops) |
| `:6.2.4-alpine-3.8` | [View](variants/6.2.4-alpine-3.8) |
| `:6.2.4-alpine-3.8-git-sops` | [View](variants/6.2.4-alpine-3.8-git-sops) |
| `:6.1.3-alpine-3.8` | [View](variants/6.1.3-alpine-3.8) |
| `:6.1.3-alpine-3.8-git-sops` | [View](variants/6.1.3-alpine-3.8-git-sops) |
| `:7.2.0-ubuntu-20.04-20211102` | [View](variants/7.2.0-ubuntu-20.04-20211102) |
| `:7.2.0-ubuntu-20.04-20211102-git-sops`, `:latest` | [View](variants/7.2.0-ubuntu-20.04-20211102-git-sops) |
| `:7.1.5-ubuntu-20.04-20211021` | [View](variants/7.1.5-ubuntu-20.04-20211021) |
| `:7.1.5-ubuntu-20.04-20211021-git-sops` | [View](variants/7.1.5-ubuntu-20.04-20211021-git-sops) |
| `:7.0.3-ubuntu-18.04-20201027` | [View](variants/7.0.3-ubuntu-18.04-20201027) |
| `:7.0.3-ubuntu-18.04-20201027-git-sops` | [View](variants/7.0.3-ubuntu-18.04-20201027-git-sops) |
| `:6.2.4-ubuntu-18.04` | [View](variants/6.2.4-ubuntu-18.04) |
| `:6.2.4-ubuntu-18.04-git-sops` | [View](variants/6.2.4-ubuntu-18.04-git-sops) |
| `:6.1.3-ubuntu-18.04` | [View](variants/6.1.3-ubuntu-18.04) |
| `:6.1.3-ubuntu-18.04-git-sops` | [View](variants/6.1.3-ubuntu-18.04-git-sops) |
| `:6.0.2-ubuntu-16.04` | [View](variants/6.0.2-ubuntu-16.04) |
| `:6.0.2-ubuntu-16.04-git-sops` | [View](variants/6.0.2-ubuntu-16.04-git-sops) |

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```
