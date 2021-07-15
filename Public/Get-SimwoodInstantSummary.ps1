function Get-SimwoodInstantSummary {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("destid","iso","codec","tag","trunk")]
        [string]$Key,
        [ValidateSet("in","out")]
        [string]$Direction,
        [datetime]$DateStart,
        [datetime]$DateEnd,
        [int]$Limit = 9999,
        [string]$Sort,
        [hashtable]$Filter
    )

    $Body = @{
        'date_start' = $(if ($DateStart){$DateStart.ToString("yyyy-MM-dd")}else{$null})
        'date_end' = $(if ($DateEnd){$DateEnd.ToString("yyyy-MM-dd")}else{$null})
        'limit' = $Limit
        'sort' = $Sort
        'filter' = $Filter
    } | ConvertTo-Json -Depth 100

   
    if ($Direction){
        $uri = "accounts/$($script:SimwoodAccountID)/summary/$Direction/$($key)$($QueryString)"
    } else {
        $uri = "accounts/$($script:SimwoodAccountID)/summary/$($key)$($QueryString)"
    }

    $CallSummary = Invoke-SimwoodRequest -Method POST -Resource $uri -Body $Body
    Return $CallSummary
}