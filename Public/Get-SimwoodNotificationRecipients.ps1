function Get-SimwoodNotificationRecipients {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Type
    )
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/notifications/$Type"
    Return $Result
}