function Set-SimwoodRateACL {
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
        $uri = "voice/$($script:SimwoodAccountID)/outbound/$TrunkName/rateacl"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/outbound/rateacl"
    }
    
    $Result = Invoke-SimwoodRequest -Method put -Resource $uri -body $Body
    Return $Result
}