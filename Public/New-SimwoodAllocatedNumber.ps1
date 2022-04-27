function New-SimwoodAllocatedNumber {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $True )]
        [string]$Number
    )

    $Result = Invoke-SimwoodRequest -Method put -Resource "numbers/$($script:SimwoodAccountID)/allocated/$Number"
    Return $Result

}