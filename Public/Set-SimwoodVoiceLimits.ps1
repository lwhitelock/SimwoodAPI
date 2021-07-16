function Set-SimwoodVoiceLimits {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [int]$in,
        [Parameter(Mandatory = $true)]
        [int]$out
    )

    $Body = @{
        'limit_concurrent_in' = $in
        'limit_concurrent_out' = $out
    } | ConvertTo-Json -Depth 100

    $Result = Invoke-SimwoodRequest -Method PUT -Resource "voice/$($script:SimwoodAccountID)/limits" -Body $Body
    Return $Result
}