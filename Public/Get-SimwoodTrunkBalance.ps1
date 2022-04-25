function Get-SimwoodTrunkBalance {
    [CmdletBinding()]
    Param(
        [Parameter( Mandatory = $True )]
        [string]$Name
    ) 

    $uri = "voice/$($script:SimwoodAccountID)/outbound/$Name/balance"

    $TrunkBalance = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $TrunkBalance
}