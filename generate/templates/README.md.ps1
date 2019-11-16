@"
# docker-powershell

[![github-actions](https://github.com/theohbrothers/docker-powershell/workflows/build/badge.svg)](https://github.com/theohbrothers/docker-powershell/actions)
[![github-tag](https://img.shields.io/github/tag/theohbrothers/docker-powershell)](https://github.com/theohbrothers/docker-powershell/releases/)
[![docker-image-size](https://img.shields.io/microbadger/image-size/theohbrothers/docker-powershell/latest)](https://hub.docker.com/r/theohbrothers/docker-powershell)
[![docker-image-layers](https://img.shields.io/microbadger/layers/theohbrothers/docker-powershell/latest)](https://hub.docker.com/r/theohbrothers/docker-powershell)

Docker image based on [mcr.microsoft.com/powershell](https://hub.docker.com/r/microsoft/powershell/)

| Tags |
|:-------:| $( $VARIANTS | % {
"`n| ``:$( $_['tag'] )`` |"
})

"@
