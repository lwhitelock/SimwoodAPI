function Get-SimwoodNumberSMSConfig {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number
    )

    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/sms"

    $Result = Invoke-SimwoodRequest -Method get -Resource $uri
    Return $Result
}