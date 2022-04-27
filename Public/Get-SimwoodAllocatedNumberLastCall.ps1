function Get-SimwoodAllocatedNumberLastCall {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Number
    )

    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/lastcall"
    $Result = Invoke-SimwoodRequest -Method get -Resource $uri
    return $Result
}