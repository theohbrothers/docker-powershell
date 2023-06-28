FROM mcr.microsoft.com/powershell:7.2.2-ubuntu-20.04-20220318

# Disable telemetry for powershell 7.0.0 and above and .NET core: https://github.com/PowerShell/PowerShell/issues/16234#issuecomment-942139350
ENV POWERSHELL_CLI_TELEMETRY_OPTOUT=1
ENV POWERSHELL_TELEMETRY_OPTOUT=1
ENV POWERSHELL_UPDATECHECK=Off
ENV POWERSHELL_UPDATECHECK_OPTOUT=1
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1
ENV DOTNET_TELEMETRY_OPTOUT=1
ENV COMPlus_EnableDiagnostics=0

# Install Pester
RUN pwsh -c 'Install-Module Pester -Scope AllUsers -MinimumVersion 4.0.0 -MaximumVersion 4.10.1 -Force -ErrorAction Stop -Verbose'
RUN pwsh -c 'Install-Module Pester -Scope AllUsers -MinimumVersion 5.0.0 -Force -ErrorAction Stop -Verbose'

