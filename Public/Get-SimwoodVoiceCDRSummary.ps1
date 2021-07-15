function Get-SimwoodVoiceCDRSummary {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("in","out")]
        [string]$Direction,
        [datetime]$Date
        
    )

    $DateUri = ""

    if ($Date) {
        $DateStr = $Date.ToString("yyyy-MM-dd")
        $DateUri = "?date=$DateStr"
    }
    
    $Hash = Invoke-SimwoodRequest -Method POST -Resource "accounts/$($script:SimwoodAccountID)/reports/voice/summary/day/$($Direction)$($DateUri)" -ResourceFilter $ResourceFilter
    $Result = Invoke-SimwoodHashRequest -Hash $Hash.hash

    Return $Result
}