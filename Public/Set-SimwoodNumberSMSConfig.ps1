function Set-SimwoodNumberSMSConfig {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number,
        [Parameter(Mandatory = $true)]
        [ValidateSet("http","http_json")]
        [String]$Mode,
        [Parameter(Mandatory = $true)]
        [String]$EndPoint
    )
    
    $Body = @{
        mode = $Mode
        endpoint = $EndPoint
    } | convertto-json -depth 100
    
    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/sms"   
    
    $Result = Invoke-SimwoodRequest -Method PUT -Resource $uri -body $Body
    
    Return $Result
}