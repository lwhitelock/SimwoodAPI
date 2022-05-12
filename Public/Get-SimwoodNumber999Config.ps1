function Get-SimwoodNumber999Config {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number
    )

    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/999"

    $Result = Invoke-SimwoodRequest -Method get -Resource $uri
    Return $Result
}