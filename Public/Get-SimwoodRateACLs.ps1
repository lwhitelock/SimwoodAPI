function Get-SimwoodRateACLs {
    [CmdletBinding()]
    Param(
        [string]$TrunkName
    ) 

    if ($TrunkName) {
        $uri = "voice/$($script:SimwoodAccountID)/outbound/$TrunkName/rateacl"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/outbound/rateacl"
    }

    $Result = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $Result

}