function Remove-SimwoodRateACL {
    [CmdletBinding()]
    param(
        [string]$TrunkName
    )

    if ($TrunkName){
        $uri = "voice/$($script:SimwoodAccountID)/outbound/$TrunkName/rateacl"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/outbound/rateacl"
    }
    
    $Result = Invoke-SimwoodRequest -Method delete -Resource $uri
    Return $Result
}