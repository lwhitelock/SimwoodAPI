function Get-SimwoodVoiceCDRLatest {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("10","100","1000","10000")]
        [string]$Quantity    
    )
    
    $Hash = Invoke-SimwoodRequest -Method POST -Resource "accounts/$($script:SimwoodAccountID)/reports/voice/cdr/latest/$Quantity" -ResourceFilter $ResourceFilter
    $Result = Invoke-SimwoodHashRequest -Hash $Hash.hash

    Return $Result
}