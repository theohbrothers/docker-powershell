# docker-powershell

[![github-actions](https://github.com/theohbrothers/docker-powershell/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-powershell/actions)
[![github-release](https://img.shields.io/github/v/release/theohbrothers/docker-powershell?style=flat-square)](https://github.com/theohbrothers/docker-powershell/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-powershell/latest)](https://hub.docker.com/r/theohbrothers/docker-powershell)

Dockerized `powershell`, based on [mcr.microsoft.com/powershell](https://hub.docker.com/r/microsoft/powershell/), with [Pester](https://github.com/Pester/Pester) 4 and 5, and useful tools.

## Tags

Variants without a distro are based on `alpine`.

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:7.3` | [View](variants/7.3) |
| `:7.3-git` | [View](variants/7.3-git) |
| `:7.3-git-sops` | [View](variants/7.3-git-sops) |
| `:7.2` | [View](variants/7.2) |
| `:7.2-git` | [View](variants/7.2-git) |
| `:7.2-git-sops` | [View](variants/7.2-git-sops) |
| `:7.1.5` | [View](variants/7.1.5) |
| `:7.1.5-git` | [View](variants/7.1.5-git) |
| `:7.1.5-git-sops` | [View](variants/7.1.5-git-sops) |
| `:7.0.3` | [View](variants/7.0.3) |
| `:7.0.3-git` | [View](variants/7.0.3-git) |
| `:7.0.3-git-sops` | [View](variants/7.0.3-git-sops) |
| `:6.2.4` | [View](variants/6.2.4) |
| `:6.2.4-git` | [View](variants/6.2.4-git) |
| `:6.2.4-git-sops` | [View](variants/6.2.4-git-sops) |
| `:6.1.3` | [View](variants/6.1.3) |
| `:6.1.3-git` | [View](variants/6.1.3-git) |
| `:6.1.3-git-sops` | [View](variants/6.1.3-git-sops) |
| `:7.3-ubuntu-22.04`, `:latest` | [View](variants/7.3-ubuntu-22.04) |
| `:7.3-ubuntu-22.04-git` | [View](variants/7.3-ubuntu-22.04-git) |
| `:7.3-ubuntu-22.04-git-sops` | [View](variants/7.3-ubuntu-22.04-git-sops) |
| `:7.2-ubuntu-22.04` | [View](variants/7.2-ubuntu-22.04) |
| `:7.2-ubuntu-22.04-git` | [View](variants/7.2-ubuntu-22.04-git) |
| `:7.2-ubuntu-22.04-git-sops` | [View](variants/7.2-ubuntu-22.04-git-sops) |
| `:7.1.5-ubuntu-20.04` | [View](variants/7.1.5-ubuntu-20.04) |
| `:7.1.5-ubuntu-20.04-git` | [View](variants/7.1.5-ubuntu-20.04-git) |
| `:7.1.5-ubuntu-20.04-git-sops` | [View](variants/7.1.5-ubuntu-20.04-git-sops) |
| `:7.0.3-ubuntu-18.04` | [View](variants/7.0.3-ubuntu-18.04) |
| `:7.0.3-ubuntu-18.04-git` | [View](variants/7.0.3-ubuntu-18.04-git) |
| `:7.0.3-ubuntu-18.04-git-sops` | [View](variants/7.0.3-ubuntu-18.04-git-sops) |
| `:6.2.4-ubuntu-18.04` | [View](variants/6.2.4-ubuntu-18.04) |
| `:6.2.4-ubuntu-18.04-git` | [View](variants/6.2.4-ubuntu-18.04-git) |
| `:6.2.4-ubuntu-18.04-git-sops` | [View](variants/6.2.4-ubuntu-18.04-git-sops) |
| `:6.1.3-ubuntu-18.04` | [View](variants/6.1.3-ubuntu-18.04) |
| `:6.1.3-ubuntu-18.04-git` | [View](variants/6.1.3-ubuntu-18.04-git) |
| `:6.1.3-ubuntu-18.04-git-sops` | [View](variants/6.1.3-ubuntu-18.04-git-sops) |
| `:6.0.4-ubuntu-16.04` | [View](variants/6.0.4-ubuntu-16.04) |
| `:6.0.4-ubuntu-16.04-git` | [View](variants/6.0.4-ubuntu-16.04-git) |
| `:6.0.4-ubuntu-16.04-git-sops` | [View](variants/6.0.4-ubuntu-16.04-git-sops) |

## Development

Requires Windows `powershell` or [`pwsh`](https://github.com/PowerShell/PowerShell).

```powershell
# Install Generate-DockerImageVariants module: https://github.com/theohbrothers/Generate-DockerImageVariants
Install-Module -Name Generate-DockerImageVariants -Repository PSGallery -Scope CurrentUser -Force -Verbose

# Edit ./generate templates

# Generate the variants
Generate-DockerImageVariants .
```

### Variant versions

[versions.json](generate/definitions/versions.json) contains a list of [Semver](https://semver.org/) versions, one per line.

To update versions in `versions.json`:

```powershell
./Update-Versions.ps1
```

To update versions in `versions.json`, and open a PR for each changed version, and merge successful PRs one after another (to prevent merge conflicts), and finally create a tagged release and close milestone:

```powershell
$env:GITHUB_TOKEN = 'xxx'
./Update-Versions.ps1 -PR -AutoMergeQueue -AutoRelease
```

To perform a dry run, use `-WhatIf`.
