function Get-SimwoodNumberRanges {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "numbers/$($script:SimwoodAccountID)/ranges"
    Return $Result
}