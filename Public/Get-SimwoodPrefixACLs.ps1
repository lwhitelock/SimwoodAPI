function Get-SimwoodPrefixACLs {
    [CmdletBinding()]
    Param(
        [string]$TrunkName
    ) 

    if ($TrunkName) {
        $uri = "voice/$($script:SimwoodAccountID)/outbound/$TrunkName/destinationacl"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/outbound/destinationacl"
    }

    $Result = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $Result

}