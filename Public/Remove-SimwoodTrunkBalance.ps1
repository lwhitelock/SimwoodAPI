function Remove-SimwoodTrunkBalance {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )
       
    $uri = "voice/$($script:SimwoodAccountID)/outbound/$Name/balance"

    $TrunkBalance = Invoke-SimwoodRequest -Method Delete -Resource $uri
    Return $TrunkBalance

}