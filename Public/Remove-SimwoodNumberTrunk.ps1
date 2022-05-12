function Remove-SimwoodNumberTrunk {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number
    )
       
    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/trunk"

    $Trunk = Invoke-SimwoodRequest -Method Delete -Resource $uri
    Return $Trunk

}