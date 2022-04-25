function Set-SimwoodPrefixACL {
    [CmdletBinding()]
    param(
        [string]$TrunkName,
        $Allow,
        $Deny
    )

    $Body = @{
        'allow' = $Allow
        'deny' = $Deny
    } | convertto-json -depth 100

    if ($TrunkName){
        $uri = "voice/$($script:SimwoodAccountID)/outbound/$TrunkName/destinationacl"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/outbound/destinationacl"
    }
    
    $Result = Invoke-SimwoodRequest -Method put -Resource $uri -body $Body
    Return $Result
}