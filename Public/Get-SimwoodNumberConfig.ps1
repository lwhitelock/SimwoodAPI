function Get-SimwoodNumberConfig {
    [CmdletBinding()]
    Param(
        [string]$Number
    )

    if ($Number){
        $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/config"
    } else {
        $uri = "numbers/$($script:SimwoodAccountID)/default/config"       
    }

    $Result = Invoke-SimwoodRequest -Method get -Resource $uri
    Return $Result
}