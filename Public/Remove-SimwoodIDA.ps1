function Remove-SimwoodIDA {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CLI
    )
       
    $uri = "voice/$($script:SimwoodAccountID)/ida/$CLI"

    $Trunk = Invoke-SimwoodRequest -Method Delete -Resource $uri
    Return $Trunk

}