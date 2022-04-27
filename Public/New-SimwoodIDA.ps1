function New-SimwoodIDA {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CLI
    )
       
    $uri = "voice/$($script:SimwoodAccountID)/ida/$CLI"
    $Result = Invoke-SimwoodRequest -Method PUT -Resource $uri
    Return $Result
}