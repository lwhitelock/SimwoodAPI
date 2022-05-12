function Remove-SimwoodNumberConfig {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number
    )
       
    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/config"

    $Result = Invoke-SimwoodRequest -Method Delete -Resource $uri
    Return $Result

}