function Get-SimwoodTrunks {
    [CmdletBinding()]
    Param(
        [string]$Name
    ) 

    if ($Name) {
        $uri = "voice/$($script:SimwoodAccountID)/outbound/$Name"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/outbound"
    }

    $OutboundTrunks = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $OutboundTrunks

}