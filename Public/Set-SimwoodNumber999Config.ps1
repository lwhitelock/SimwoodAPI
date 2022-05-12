function Set-SimwoodNumber999Config {
    [CmdletBinding()]
    Param(
        [Parameter( ParameterSetName = 'Individual', Mandatory = $True)]
        [Parameter( ParameterSetName = 'Business', Mandatory = $True)]
        [string]$Number,
        [Parameter( ParameterSetName = 'Individual', Mandatory = $True)]
        [String]$Title,
        [Parameter( ParameterSetName = 'Individual', Mandatory = $True)]
        [String]$Forename,
        [Parameter( ParameterSetName = 'Individual', Mandatory = $True)]
        [Parameter( ParameterSetName = 'Business', Mandatory = $True)]
        [String]$Name,
        [Parameter( ParameterSetName = 'Business', Mandatory = $True)]
        [String]$BusSuffix,
        [Parameter( ParameterSetName = 'Individual', Mandatory = $True)]
        [Parameter( ParameterSetName = 'Business', Mandatory = $True)]
        [String]$Premises,
        [Parameter( ParameterSetName = 'Individual', Mandatory = $True)]
        [Parameter( ParameterSetName = 'Business', Mandatory = $True)]
        [String]$Thoroughfare,
        [Parameter( ParameterSetName = 'Individual', Mandatory = $True)]
        [Parameter( ParameterSetName = 'Business', Mandatory = $True)]
        [String]$Locality,
        [Parameter( ParameterSetName = 'Individual', Mandatory = $True)]
        [Parameter( ParameterSetName = 'Business', Mandatory = $True)]
        [String]$Postcode
    )
    
    $Body = @{
        title = $title
        forename = $Forename
        name = $Name
        bussuffix = $BusSuffix
        premises = $Premises
        thoroughfare = $Thoroughfare
        locality = $Locality
        postcode = $Postcode
    } | convertto-json -depth 100
    
    $uri = "numbers/$($script:SimwoodAccountID)/allocated/$Number/999"   
    
    $Result = Invoke-SimwoodRequest -Method PUT -Resource $uri -body $Body
    
    Return $Result
}