function Get-SimwoodPrepayments {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("all","latest1","latest10")]
        [string]$Quantity
    )

    switch($Quantity){
        "all" {$URI = "all"}
        "latest1" {$URI = "latest/1"}
        "latest10" {$URI = "latest/10"}
    }

    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/prepay/prepayments/$URI" -ResourceFilter $ResourceFilter
    Return $Result
}