function Get-SimwoodVoiceLimits {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "voice/$($script:SimwoodAccountID)/limits"
    Return $Result
}