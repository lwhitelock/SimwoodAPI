function Get-SimwoodAllocatedNumbers {
    [CmdletBinding()]
    Param(
        [String]$Pattern,
        [ValidateSet(10,100,1000,10000)]
        [Int]$Limit,
        [string]$Key,
        [string]$Number
    )

    if ($Number){

        $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number"
        $Result = Invoke-SimwoodRequest -Method get -Resource $uri
        return $Result

    } else {

        $Query = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)
        if ($Pattern){
            $Query.Add('pattern', $Pattern)
        }

        if ($Key){
            $Query.Add('key', $Key)
        }
    
        $QueryString = $Query.ToString()
        if ($QueryString -ne ""){
            $QueryString = "?" + $QueryString
        }

        if ($Limit){      
            $uri = "numbers/$($script:SimwoodAccountID)/allocated/$($Limit)$($QueryString)"
        } else {
            $uri = "numbers/$($script:SimwoodAccountID)/allocated/all$($QueryString)"
        }

        $Hash = Invoke-SimwoodRequest -Method get -Resource $uri
        $Result = Invoke-SimwoodHashRequest -Hash $Hash.hash

        Return $Result
        
    }
}