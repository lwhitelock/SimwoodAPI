function Get-SimwoodIDA {
    [CmdletBinding()]
    Param(
        [string]$CLI
    ) 

    if ($Name) {
        $uri = "voice/$($script:SimwoodAccountID)/ida/$CLI"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/ida"
    }

    $OutboundTrunks = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $OutboundTrunks

}