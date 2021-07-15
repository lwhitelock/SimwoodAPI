function Get-SimwoodTariffs {
    [CmdletBinding()]
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/rates/tariffs"
    Return $Result.data
}