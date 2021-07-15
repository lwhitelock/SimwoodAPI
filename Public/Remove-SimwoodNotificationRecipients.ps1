function Get-SimwoodNotificationRecipients {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Type
    )
    $Result = Invoke-SimwoodRequest -Method DELETE -Resource "accounts/$($script:SimwoodAccountID)/notifications/$Type"
    Return $Result
}