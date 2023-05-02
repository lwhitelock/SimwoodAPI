function Get-SimwoodTrunkConfig{
    [CmdletBinding()]
    Param(
        [Parameter( Mandatory = $True )]
        [string]$Name
    ) 

    $uri = "voice/$($script:SimwoodAccountID)/trunks/$Name/config"

    $TrunkConfig = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $TrunkConfig
}