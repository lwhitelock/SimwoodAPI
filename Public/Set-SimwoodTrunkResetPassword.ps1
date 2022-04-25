function Set-SimwoodTrunkResetPassword {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $True )]
        [string]$Name
    )

    $Result = Invoke-SimwoodRequest -Method post -Resource "voice/$($script:SimwoodAccountID)/outbound/$Name/password_reset"
    Return $Result
}