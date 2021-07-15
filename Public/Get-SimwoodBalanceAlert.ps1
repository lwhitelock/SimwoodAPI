function Get-SimwoodBalanceAlert {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/prepay/balance/alert"
    Return $Result
}