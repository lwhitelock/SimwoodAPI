function Get-SimwoodVoiceCDR {
    [CmdletBinding()]
    Param(
        [Parameter( ParameterSetName = 'DateInline', Mandatory = $True)]
        [Parameter( ParameterSetName = 'Report')]
        [datetime]$Date,
        [Parameter( ParameterSetName = 'DateInline', Mandatory = $True)]
        [Parameter( ParameterSetName = 'Inline', Mandatory = $True)]
        [switch]$Inline,
        [Parameter( ParameterSetName = 'Inline')]
        [datetime]$DateStart,
        [Parameter( ParameterSetName = 'Inline')]
        [datetime]$DateEnd,
        [Parameter( ParameterSetName = 'DateInline')]
        [Parameter( ParameterSetName = 'Inline')]
        [int]$Limit = 9999,
        [Parameter( ParameterSetName = 'DateInline')]
        [Parameter( ParameterSetName = 'Inline')]
        [string]$Start,
        [Parameter( ParameterSetName = 'DateInline')]
        [Parameter( ParameterSetName = 'Inline')]
        [hashtable]$Filter
        
    )

    if (!$Inline){

    $DateUri = ""

    if ($Date) {
        $DateStr = $Date.ToString("yyyy-MM-dd")
        $DateUri = "?date=$DateStr"
    }
   
    $Hash = Invoke-SimwoodRequest -Method POST -Resource "accounts/$($script:SimwoodAccountID)/reports/voice/cdr/day$DateUri" -ResourceFilter $ResourceFilter
    $Result = Invoke-SimwoodHashRequest -Hash $Hash.hash

    Return $Result

} else {

    if ($Date) {
        $DateStr = $Date.ToString("yyyy-MM-dd ")
        $Uri = "voice/$($script:SimwoodAccountID)/cdr/$DateStr"
    } else {
        $Uri = "voice/$($script:SimwoodAccountID)/cdr" 
    }

    $Body = @{
        'date_start' = $(if ($DateStart){$DateStart.ToString("yyyy-MM-dd HH:mm:ss")}else{$null})
        'date_end' = $(if ($DateEnd){$DateEnd.ToString("yyyy-MM-dd HH:mm:ss")}else{$null})
        'limit' = $Limit
        'start' = $Start
        'filter' = $Filter
    } | ConvertTo-Json -Depth 100

    $CDRResults = Invoke-SimwoodRequest -Method POST -Resource $uri -Body $Body
    Return $CDRResults

}

}


