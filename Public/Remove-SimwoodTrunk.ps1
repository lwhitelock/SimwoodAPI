function Remove-SimwoodTrunk {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )
       
    $uri = "voice/$($script:SimwoodAccountID)/outbound/$Name"

    $Trunk = Invoke-SimwoodRequest -Method Delete -Resource $uri
    Return $Trunk

}