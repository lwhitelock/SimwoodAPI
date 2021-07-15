function Remove-SimwoodLockedBalance {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method delete -Resource "accounts/$($script:SimwoodAccountID)/prepay/balance/locked"
    Return $Result
}