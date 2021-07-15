function Get-SimwoodBalance {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/prepay/balance"
    Return $Result
}