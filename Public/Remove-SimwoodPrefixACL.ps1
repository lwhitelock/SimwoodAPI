function Remove-SimwoodPrefixACL {
    [CmdletBinding()]
    param(
        [string]$TrunkName
    )

    if ($TrunkName){
        $uri = "voice/$($script:SimwoodAccountID)/outbound/$TrunkName/destinationacl"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/outbound/destinationacl"
    }
    
    $Result = Invoke-SimwoodRequest -Method delete -Resource $uri
    Return $Result
}