function Set-SimwoodLockedBalance {
    [CmdletBinding()]
    param(
        [float]$ProtectedBalance
    )

    $Body = [ordered]@{
        balance = $ProtectedBalance
    } | ConvertTo-Json -depth 100

    $Result = Invoke-SimwoodRequest -Method put -Resource "accounts/$($script:SimwoodAccountID)/prepay/balance/locked" -body $Body
    Return $Result
}