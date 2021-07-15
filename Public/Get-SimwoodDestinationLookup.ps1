function Get-SimwoodDestinationLookup {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Number
    )
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/rate/$Number"

    $Rates = $(
        if ($Result.Rates.'1') {
            [PSCustomObject]@{Platinum = @{
                    Peak       = $Result.Rates.'1'.p
                    Offpeak    = $Result.Rates.'1'.o
                    Weekend    = $Result.Rates.'1'.w
                    Connection = $Result.Rates.'1'.c
                }
            }
        }
        if ($Result.Rates.'2') {
            [PSCustomObject]@{Gold = @{
                    Peak       = $Result.Rates.'2'.p
                    Offpeak    = $Result.Rates.'2'.o
                    Weekend    = $Result.Rates.'2'.w
                    Connection = $Result.Rates.'2'.c
                }
            }
        }
        if ($Result.Rates.'3') {
            [PSCustomObject]@{Silver = @{
                    Peak       = $Result.Rates.'3'.p
                    Offpeak    = $Result.Rates.'3'.o
                    Weekend    = $Result.Rates.'3'.w
                    Connection = $Result.Rates.'3'.c
                }
            }
        }
    )


    $FormattedObject = [PSCustomObject]@{
        Description = $Result.desc
        AccountType = $Result.account_type
        Currency    = $Result.currency
        Rates       = $Rates
    }


    Return $FormattedObject
}