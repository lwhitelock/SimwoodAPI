function Get-SimwoodLockedBalance {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/prepay/balance/locked"
    Return $Result
}