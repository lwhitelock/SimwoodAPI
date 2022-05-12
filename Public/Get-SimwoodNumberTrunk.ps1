function Get-SimwoodNumberTrunk {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number
    )

    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/trunk"


    $Result = Invoke-SimwoodRequest -Method get -Resource $uri
    Return $Result
}