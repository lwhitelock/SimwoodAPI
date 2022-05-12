function Get-SimwoodPorts {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateSet("gnp","mnp")]
        [String]$Type,
        [string]$ID
    )
        if ($ID){
            $uri = "porting/$($script:SimwoodAccountID)/$Type/$ID"
        } else {
            $uri = "porting/$($script:SimwoodAccountID)/$Type"
        }
        

    $Result = Invoke-SimwoodRequest -Method get -Resource $uri

    Return $Result
}