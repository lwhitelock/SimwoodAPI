function Get-SimwoodRejectedCalls {
    [CmdletBinding()]
    Param(
        [string]$Reason
    ) 

    if ($Reason) {
        $uri = "voice/$($script:SimwoodAccountID)/rejected/$Reason"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/rejected"
    }

    $RejectedDetails = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $RejectedDetails

}