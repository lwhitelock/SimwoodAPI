function Get-SimwoodPrepaySummary {
    [CmdletBinding()]
    Param(
        [datetime]$FromDate,
        [datetime]$ToDate

    )

    $ResourceFilter = $null

    if ($FromDate){
        $ResourceFilter = "?from_date=$($FromDate.ToString("yyyy-MM-dd"))"
    }

    if ($ToDate){
        if ($null -eq $ResourceFilter){
            $ResourceFilter = "?to_date=$($ToDate.ToString("yyyy-MM-dd"))"
        } else {
            $ResourceFilter = $ResourceFilter + "&to_date=$($ToDate.ToString("yyyy-MM-dd"))"
        }
    }

    $Hash = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/prepay/summary" -ResourceFilter $ResourceFilter
    $Result = Invoke-SimwoodHashRequest -Hash $Hash.hash

    Return $Result
}