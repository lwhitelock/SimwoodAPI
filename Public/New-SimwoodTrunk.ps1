function New-SimwoodTrunk {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [ValidateSet("ip", "auth")]
        [string]$Type
    )
    
    $Body = @{}
    
    if ($Type){
        $Body = @{
            'type' = $Type
        } | convertto-json -depth 100
    }
    
    
    $uri = "voice/$($script:SimwoodAccountID)/outbound/$Name"
    $Result = Invoke-SimwoodRequest -Method PUT -Resource $uri -body $Body
    Return $Result
}