function New-SimwoodNotificationRecipient {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Type,
        [Parameter(Mandatory = $true)]
        [ValidateSet("sms", "email")]
        [string]$Method,
        [string]$Destination
    )
    
    $Body = @{
        'destination' = $Destination
    } | convertto-json -depth 100
    
    
    $uri = "accounts/$($script:SimwoodAccountID)/notifications/$Type/$Method"
    $Result = Invoke-SimwoodRequest -Method POST -Resource $uri -body $Body
    Return $Result
}