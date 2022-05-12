function Set-SimwoodNumberTrunk {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number,
        [Parameter(Mandatory = $true)]
        [String]$Trunk
    )
    
    $Body = @{
        trunk = $trunk
    } | convertto-json -depth 100
    
    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/trunk"   
    
    $Result = Invoke-SimwoodRequest -Method PUT -Resource $uri -body $Body
    
    Return $Result
}