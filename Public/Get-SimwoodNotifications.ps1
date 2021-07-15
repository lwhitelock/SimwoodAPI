function Get-SimwoodNotifications {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/notifications"
    Return $Result
}