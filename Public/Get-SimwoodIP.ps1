function Get-SimwoodIP {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "tools/myip"
    Return $Result.ip
}