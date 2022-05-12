function Get-SimwoodNumberValidate {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Number
    )

    $uri = "numbers/$($script:SimwoodAccountID)/validate/$Number"

    $Result = Invoke-SimwoodRequest -Method get -Resource $uri
    Return $Result
}