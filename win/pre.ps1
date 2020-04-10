#Requires -Version 5

<#PSScriptInfo
    .VERSION 1.0
    .AUTHOR psadmin.io
    .SYNOPSIS
        Cloud Manager pre-provisioning script for Windows
    .DESCRIPTION
        Installs utities for Windows PeopleSoft instances
    # .PARAMETER PATCH_ID
    #     Patch ID for the PUM image
    .EXAMPLE
        pre.ps1

#>

#-----------------------------------------------------------[Parameters]----------------------------------------------------------

[CmdletBinding()]
Param(
)


#---------------------------------------------------------[Initialization]--------------------------------------------------------

# Valid values: "Stop", "Inquire", "Continue", "Suspend", "SilentlyContinue"
$ErrorActionPreference = "Stop"
$DebugPreference = "SilentlyContinue"
$VerbosePreference = "SilentlyContinue"
[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

#------------------------------------------------------------[Variables]----------------------------------------------------------



#-----------------------------------------------------------[Functions]-----------------------------------------------------------

function install_choco() {
  Set-ExecutionPolicy Bypass -Scope Process -Force; 
  iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function install_utilities() {
  choco install vscode -y
  choco install firefox -y
  choco install grep -y
  choco install git -y
}

#-----------------------------------------------------------[Execution]-----------------------------------------------------------

##########
#  Main  #
##########

. install_choco
. install_utilities