function Get-SimwoodTime {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "tools/time"
    Return $Result
}