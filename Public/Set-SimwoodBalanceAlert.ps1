function Set-SimwoodBalanceAlert {
    [CmdletBinding()]
    param(
        [int]$AlertBalance,
        [int]$AlertAvailable
    )

    $Body = [ordered]@{
        alert_balance = $AlertBalance
        alert_available = $AlertAvailable
    } | ConvertTo-Json -depth 100

    $Result = Invoke-SimwoodRequest -Method put -Resource "accounts/$($script:SimwoodAccountID)/prepay/balance/alert" -body $Body
    Return $Result
}