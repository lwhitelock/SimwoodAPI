function Set-SimwoodAccountID {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$AccountID
    )
    $script:SimwoodAccountID = $AccountID
}

