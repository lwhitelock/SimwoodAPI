function Set-SimwoodTrunkConfig {
    [CmdletBinding()]
    Param(
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [HashTable]$Properties
    )
    
    $Body = $Properties | ConvertTo-Json -Depth 100
    
    $uri = "voice/$($script:SimwoodAccountID)/trunks/$Name/config"
    
    $Result = Invoke-SimwoodRequest -Method PUT -Resource $uri -body $Body
    Return $Result
}