function Get-SimwoodTrunkIPACL {
    [CmdletBinding()]
    Param(
        [Parameter( Mandatory = $True )]
        [string]$Name
    ) 

    $uri = "voice/$($script:SimwoodAccountID)/outbound/$Name/acl"

    $TrunkIPACL = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $TrunkIPACL
}