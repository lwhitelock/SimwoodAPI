function Remove-SimwoodNumberSMSConfig {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number
    )
       
    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/sms"

    $Result = Invoke-SimwoodRequest -Method Delete -Resource $uri
    Return $Result

}