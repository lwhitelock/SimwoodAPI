function Set-SimwoodIDA {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CLI,
        [Parameter(Mandatory = $true)]
        [HashTable]$Properties
    )
    
    $Body = $Properties | ConvertTo-Json -Depth 100
    
    
    $uri = "voice/$($script:SimwoodAccountID)/ida/$CLI"
    $Result = Invoke-SimwoodRequest -Method PUT -Resource $uri -body $Body
    Return $Result
}