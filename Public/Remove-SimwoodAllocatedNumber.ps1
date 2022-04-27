function Remove-SimwoodAllocatedNumber {
    [CmdletBinding()]
    param(
        [Parameter( Mandatory = $True )]
        [string]$Number
    )

    $Result = Invoke-SimwoodRequest -Method delete -Resource "numbers/$($script:SimwoodAccountID)/allocated/$Number"
    Return $Result

}