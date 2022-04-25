function Get-SimwoodTrunkInProgressCalls {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )
     
        $uri = "voice/$($script:SimwoodAccountID)/outbound/$name/inprogress"

    $CallDetails = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $CallDetails

}