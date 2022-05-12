function Set-SimwoodNumberConfig {
    [CmdletBinding()]
    Param(
        [string]$Number,
        [Parameter(Mandatory = $true)]
        [HashTable]$Properties
    )
    
    $Body = $Properties | ConvertTo-Json -Depth 100
    
    if($Number) {
        $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/config"
    } else {
        $uri = "numbers/$($script:SimwoodAccountID)/allocated/default/config"
    }
    
    
    $Result = Invoke-SimwoodRequest -Method PUT -Resource $uri -body $Body
    Return $Result
}