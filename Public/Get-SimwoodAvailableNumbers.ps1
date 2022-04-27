function Get-SimwoodAvailableNumbers {
    [CmdletBinding()]
    Param(
        [Parameter(ParameterSetName = 'Standard', Mandatory=$true)]
        [ValidateSet("all","gold","standard")]
        [string]$NumberType,
        [Parameter(ParameterSetName = 'Standard', Mandatory=$true)]
        [ValidateSet(1,10,100)]
        [int]$Count,
        [Parameter( ParameterSetName = 'Consecutive', Mandatory=$true)]
        [Parameter( ParameterSetName = 'Standard')]
        [String]$Pattern,
        [Parameter( ParameterSetName = 'Standard')]
        [ValidateSet(1,44)]
        [String]$CountryCode,
        [Parameter( ParameterSetName = 'Consecutive', Mandatory=$true)]
        [ValidateSet(10,20,30,40,50,60,70,80,90,100)]
        [Int]$Consecutive
    )

    $Query = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)
    if ($Pattern){
        $Query.Add('pattern', $Pattern)
    }

    if ($CountryCode){
        $Query.Add('country_code', $CountryCode)
    }
    
    $QueryString = $Query.ToString()
    if ($QueryString -ne ""){
        $QueryString = "?" + $QueryString
    }

    if ($Consecutive){
        
        $uri = "numbers/$($script:SimwoodAccountID)/available/consecutive/$($Consecutive)$($QueryString)"
        $Hash = Invoke-SimwoodRequest -Method get -Resource $uri
        $Result = Invoke-SimwoodHashRequest -Hash $Hash.hash

    } else {
        
        $uri = "numbers/$($script:SimwoodAccountID)/available/$NumberType/$($Count)$($QueryString)"
        $Result = Invoke-SimwoodRequest -Method get -Resource $uri

    }

    Return $Result
}