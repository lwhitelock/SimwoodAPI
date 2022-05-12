function New-SimwoodSMS {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$To,
        [Parameter(Mandatory = $true)]
        [string]$From,
        [Parameter(Mandatory = $true)]
        [string]$Message,
        [ValidateSet(0, 1)]
        [int]$Flash = 0,
        [ValidateSet(0, 1)]
        [int]$Replace = 0,
        [int]$Concat = 1,
        [String]$Report,
        [ValidateSet(0, 1)]
        [int]$Extended = 0
    )

    $Body = @{
        'to'       = $To
        'from'     = $From
        'message'  = $Message
        'flash'    = $Flash
        'replace'  = $Replace
        'concat'   = $Concat
        'report'   = $Report
        'extended' = $Extended
    } | convertto-json -depth 100
    
    $uri = "messaging/$($script:SimwoodAccountID)/sms"
    $Result = Invoke-SimwoodRequest -Method POST -Resource $uri -body $Body
    Return $Result
}