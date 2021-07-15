function Get-SimwoodVoiceCDR {
    [CmdletBinding()]
    Param(
        [datetime]$Date
        
    )

    $DateUri = ""

    if ($Date) {
        $DateStr = $Date.ToString("yyyy-MM-dd")
        $DateUri = "?date=$DateStr"
    }
   
    $Hash = Invoke-SimwoodRequest -Method POST -Resource "accounts/$($script:SimwoodAccountID)/reports/voice/cdr/day$DateUri" -ResourceFilter $ResourceFilter
    $Result = Invoke-SimwoodHashRequest -Hash $Hash.hash

    Return $Result
}