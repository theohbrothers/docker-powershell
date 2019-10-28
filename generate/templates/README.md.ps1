@"
# docker-powershell

[![pipeline status](https://gitlab.com/leojonathanoh/docker-powershell/badges/dev/pipeline.svg)](https://gitlab.com/leojonathanoh/docker-powershell/commits/dev)
[![docker-image-size](https://img.shields.io/microbadger/image-size/leojonathanoh/docker-powershell/latest)](https://hub.docker.com/r/leojonathanoh/docker-powershell)
[![docker-image-layers](https://img.shields.io/microbadger/layers/leojonathanoh/docker-powershell/latest)](https://hub.docker.com/r/leojonathanoh/docker-powershell)

Docker image based on [mcr.microsoft.com/powershell](https://hub.docker.com/r/microsoft/powershell/)

| Tags |
|:-------:| $( $VARIANTS | % {
"`n| ``:$( $_['tag'] )`` |"
})

"@
