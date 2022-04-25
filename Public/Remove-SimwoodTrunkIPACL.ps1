function Remove-SimwoodTrunkIPACL {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $True )]
        [string]$Name,
        [Parameter( Mandatory = $True )]
        [string]$IP
    )

    $Result = Invoke-SimwoodRequest -Method delete -Resource "voice/$($script:SimwoodAccountID)/outbound/$Name/acl/$IP"
    Return $Result
}