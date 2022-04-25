function Set-SimwoodTrunk {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [HashTable]$Properties
    )
    
    $Body = $Properties | ConvertTo-Json -Depth 100
    
    
    $uri = "voice/$($script:SimwoodAccountID)/outbound/$Name"
    $Result = Invoke-SimwoodRequest -Method PUT -Resource $uri -body $Body
    Return $Result
}