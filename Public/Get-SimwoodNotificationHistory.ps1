function Get-SimwoodNotificationHistory {
    [CmdletBinding()]
    Param(
        [string]$class,
        [datetime]$DateStart,
        [datetime]$DateEnd
    )

    $Query = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)

    if ($DateStart){
        $Query.Add('date_start', $DateStart.ToString("yyyy-MM-dd HH:mm:ss"))
    }
    if ($DateEnd){
        $Query.Add('date_end', $DateEnd.ToString("yyyy-MM-dd HH:mm:ss"))
    }
    if ($Class){
        $Query.Add('class', $Class)
    }
    
    $QueryString = $Query.ToString()
    if ($QueryString -ne ""){
        $QueryString = "?" + $QueryString
    }

    $uri = "accounts/$($script:SimwoodAccountID)/notifications/history$($QueryString)"
  

    $Result = Invoke-SimwoodRequest -Method GET -Resource $uri
    Return $Result
}