function Remove-SimwoodInprogressCall {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$ID
    )
       
    $uri = "voice/$($script:SimwoodAccountID)/inprogress/$ID"

    $CallDetails = Invoke-SimwoodRequest -Method Delete -Resource $uri
    Return $CallDetails

}