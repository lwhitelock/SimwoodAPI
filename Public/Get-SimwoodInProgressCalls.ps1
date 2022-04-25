function Get-SimwoodInprogressCalls {
    [CmdletBinding()]
    Param(
        [string]$Name,
        [string]$ID
    )
       

    if ($ID) {
        $uri = "voice/$($script:SimwoodAccountID)/inprogress/$ID"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/inprogress/current"
    }

    $CallDetails = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $CallDetails

}