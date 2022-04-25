function Set-SimwoodTrunkBalance {
    [CmdletBinding()]
    param(
        [Parameter( ParameterSetName = 'Balance', Mandatory = $True)]
        [Parameter( ParameterSetName = 'Adjust', Mandatory = $True)]
        [string]$Name,
        [Parameter( ParameterSetName = 'Balance', Mandatory = $True)]
        [string]$Balance,
        [Parameter( ParameterSetName = 'Adjust', Mandatory = $True)]
        [string]$Adjust
    )

    if ($Balance){
       $Body = @{
            "balance" = $Balance
        } | convertto-json -depth 100
    }

    if ($Adjust){
        $Body = @{
            "adjust" = $Adjust
        } | convertto-json -depth 100
    }
    
    $Result = Invoke-SimwoodRequest -Method put -Resource "voice/$($script:SimwoodAccountID)/outbound/$Name/balance" -body $Body
    Return $Result
}