function Remove-SimwoodTrunkConfig {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )
       
    $uri = "voice/$($script:SimwoodAccountID)/trunks/$Name/config"

    $Result = Invoke-SimwoodRequest -Method Delete -Resource $uri
    Return $Result

}