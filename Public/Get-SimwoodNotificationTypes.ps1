function Get-SimwoodNotificationTypes {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/notifications/available"
    Return $Result
}