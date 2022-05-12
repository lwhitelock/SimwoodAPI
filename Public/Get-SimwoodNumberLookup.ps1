function Get-SimwoodNumberLookup {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number
    )

    $uri = "numbers/$($script:SimwoodAccountID)/lookup/$Number"

    $Result = Invoke-SimwoodRequest -Method get -Resource $uri
    Return $Result
}