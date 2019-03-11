@"
# docker-powershell

[![pipeline status](https://gitlab.com/leojonathanoh/docker-powershell/badges/dev/pipeline.svg)](https://gitlab.com/leojonathanoh/docker-powershell/commits/dev)

Docker image based on [mcr.microsoft.com/powershell](https://hub.docker.com/r/microsoft/powershell/)

| Tags |
|:-------:| $( $VARIANTS | % {
"`n| ``:$( $_['tag'] )`` |"
})

"@