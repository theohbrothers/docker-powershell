@"
# docker-powershell

[![github-actions](https://github.com/theohbrothers/docker-powershell/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-powershell/actions)
[![github-tag](https://img.shields.io/github/tag/theohbrothers/docker-powershell)](https://github.com/theohbrothers/docker-powershell/releases/)
[![docker-image-size](https://img.shields.io/docker/image-size/theohbrothers/docker-powershell/latest)](https://hub.docker.com/r/theohbrothers/docker-powershell)

Dockerized ``powershell``, based on [mcr.microsoft.com/powershell](https://hub.docker.com/r/microsoft/powershell/), with useful tools.

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
$(
($VARIANTS | % {
    if ( $_['tag_as_latest'] ) {
@"
| ``:$( $_['tag'] )``, ``:latest`` | [View](variants/$( $_['tag'] ) ) |

"@
    }else {
@"
| ``:$( $_['tag'] )`` | [View](variants/$( $_['tag'] ) ) |

"@
    }
}) -join ''
)
"@
