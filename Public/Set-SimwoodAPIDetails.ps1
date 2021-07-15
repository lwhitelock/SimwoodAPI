function Set-SimwoodAPIDetails {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$APIUser,
        [Parameter(Mandatory=$true)]
        [String]$APIKey
    )
    [pscredential]$script:SimwoodCred = New-Object System.Management.Automation.PSCredential ($APIUser, $(ConvertTo-SecureString $APIKey -AsPlainText -Force))
}

