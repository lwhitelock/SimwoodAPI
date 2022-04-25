function New-SimwoodTrunkIPACL {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $True )]
        [string]$Name,
        [Parameter( Mandatory = $True )]
        [string]$IP
    )

    $Result = Invoke-SimwoodRequest -Method put -Resource "voice/$($script:SimwoodAccountID)/outbound/$Name/acl/$IP"
    Return $Result
}