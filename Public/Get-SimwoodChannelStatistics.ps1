function Get-SimwoodChannelStatistics {
    [CmdletBinding()]
    Param(
        [ValidateSet("1m","5m","1h")]
        [string]$History
    )
       

    if ($History){
        $uri = "voice/$($script:SimwoodAccountID)/channels/history?interval=$History"
    } else {
        $uri = "voice/$($script:SimwoodAccountID)/channels/current"
    }

    $ChannelStats = Invoke-SimwoodRequest -Method Get -Resource $uri
    Return $ChannelStats

}