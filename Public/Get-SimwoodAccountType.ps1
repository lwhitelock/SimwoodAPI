function Get-SimwoodAccountType {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/type"
    Return $Result.data
}