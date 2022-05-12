# Simwood API
 This Powershell module lets you interact with the Simwood API.
 You should read the API documentation at https://cdn.simwood.com/docs/simwood_apiv3.pdf for detals on how to interact with the API.

## Installation
```
Install-Module SimwoodAPI
Import-Module SimwoodAPI
```

## Examples
### Connect to the API
```
$SimwoodAccountID = "YourSimwoodAccountID"
$SimwoodUser = "YourSimwoodUser"
$SimwoodPass = "YourSimwoodPassword"
$SimwoodInvoiceID = "I123455678"

Set-SimwoodAPIDetails -APIUser $SimwoodUser -APIKey $SimwoodPass
Set-SimwoodAccountID -AccountID $SimwoodAccountID
```

### Basic Helper API calls
```
Get-SimwoodTime
Get-SimwoodIP
Get-SimwoodAccountType
```

### Finding numbers with no 999 details and listing their configured endpoint
```
$SimwoodAccountID = "YourSimwoodAccountID"
$SimwoodUser = "YourSimwoodUser"
$SimwoodPass = "YourSimwoodPassword"

Import-Module SimwoodAPI
Set-SimwoodAPIDetails -APIUser $SimwoodUser -APIKey $SimwoodPass
Set-SimwoodAccountID -AccountID $SimwoodAccountID

$Numbers = Get-SimwoodAllocatedNumbers

$ProcessedNumbers = foreach ($Number in $Numbers) {
    $ParsedNumber = "$($Number.country_code)$($Number.number)"
    $Config = Get-SimwoodNumberConfig -Number $ParsedNumber
    $999 = Get-SimwoodNumber999Config -Number $ParsedNumber

    $Endpoint = $Config.routing.default.endpoint
    $999Name = $999.name

    [PSCustomObject]@{
        Number   = $ParsedNumber
        Endpoint = $Endpoint
        '999Name' = $999Name
    }
}

$ProcessedNumbers | where-object {!$_."999Name"} | format-table
```


### Retriving Invoices
```
Get-SimwoodInvoices -InvoiceType all
Get-SimwoodInvoices -InvoiceType paid
Get-SimwoodInvoices -InvoiceType unpaid
Get-SimwoodInvoicePDF -InvoiceID $SimwoodInvoiceID -FilePath "C:\temp\SimwoodInvoice.pdf"
```

### Balance Functions
```
$fromdate = (Get-Date).adddays(-13)
$todate = Get-Date
Get-SimwoodPrepaySummary
Get-SimwoodPrepaySummary -FromDate $FromDate
Get-SimwoodPrepaySummary -ToDate $ToDate
Get-SimwoodPrepaySummary -FromDate $FromDate -ToDate $ToDate

Get-SimwoodPrepayments -Quantity all
Get-SimwoodPrepayments -Quantity latest1
Get-SimwoodPrepayments -Quantity latest10

Get-SimwoodPrepayTransfers -Quantity all
Get-SimwoodPrepayTransfers -Quantity latest1
Get-SimwoodPrepayTransfers -Quantity latest10

Get-SimwoodBalance
Get-SimwoodBalanceAlert
Set-SimwoodBalanceAlert -AlertBalance 200
#AlertAvailable Doesn't seem to exist
Set-SimwoodBalanceAlert -AlertBalance 250 -AlertAvailable 10

Get-SimwoodLockedBalance
Remove-SimwoodLockedBalance
Get-SimwoodLockedBalance
Set-SimwoodLockedBalance -ProtectedBalance 200.50
```

### Rates / Tariffs
```
Get-SimwoodRatesCSV -FilePath "C:\temp\Default.csv"
Get-SimwoodRatesCSV -Name silver -FilePath "C:\temp\Silver.csv"
Get-SimwoodRatesCSV -Name platinum -FilePath "C:\temp\Platinum.csv"
Get-SimwoodRatesCSV -Name gold -FilePath "C:\temp\Gold.csv"

$tariffs = Get-SimwoodTariffs
foreach ($tariff in $tariffs) {
	$FileName = $tariff.description -replace ' ', '_'
	Get-SimwoodRatesCSV -Name url -url $tariff.url -FilePath "C:\temp\$FileName.csv"	
}

Get-SimwoodDestinationLookup -Number 4433012456789

```
### Working with CDRs
```
$Filter = @{
	"trunk" = "930000-l001"
}

$Date = (Get-Date).addDays(-7)

Get-SimwoodVoiceCDRLatest -Quantity 10
Get-SimwoodVoiceCDRLatest -Quantity 100
Get-SimwoodVoiceCDRLatest -Quantity 1000
Get-SimwoodVoiceCDRLatest -Quantity 10000

Get-SimwoodVoiceCDR
Get-SimwoodVoiceCDR -Date $Date

Get-SimwoodVoiceCDR -Inline
Get-SimwoodVoiceCDR -Inline -Date $Date -Filter $Filter
Get-SimwoodVoiceCDR -Inline -DateStart $Date -DateEnd $Date.adddays(3) -Filter $Filter -Limit 1000 -Start 0

Get-SimwoodVoiceCDRSummary -Direction in
Get-SimwoodVoiceCDRSummary -Direction in -Date $Date
Get-SimwoodVoiceCDRSummary -Direction out | ft
Get-SimwoodVoiceCDRSummary -Direction out -Date $Date | ft

Get-SimwoodSMSCDRLatest -Quantity 10
Get-SimwoodSMSCDRLatest -Quantity 100
Get-SimwoodSMSCDRLatest -Quantity 1000
Get-SimwoodSMSCDRLatest -Quantity 10000

Get-SimwoodSMSCDR
Get-SimwoodSMSCDR -Date $Date

Get-SimwoodInstantSummary -Key "trunk" -Sort "calls" -filter $Filter
Get-SimwoodInstantSummary -Key "destid" -DateStart $((Get-Date).AddDays(-7)) -DateEnd $(Get-Date)
Get-SimwoodInstantSummary -Key "tag" -Limit 100
Get-SimwoodInstantSummary -Key "codec"
Get-SimwoodInstantSummary -Key "iso"
```

### Notifications
```
Get-SimwoodNotificationTypes

$Types = (Get-SimwoodNotificationTypes).psobject.properties.name
foreach ($type in $types) {
	New-SimwoodNotificationRecipient -Type $Type -Method email -Destination "admin@yourdomain.com"
	New-SimwoodNotificationRecipient -Type $Type -Method sms -Destination "441234567890"
}


$EnabledTypes = Get-SimwoodNotifications


Get-SimwoodNotificationRecipients -Type $Type -Method sms -Destination "441234567890"
Remove-SimwoodNotificationRecipients -Type "billing" -method "sms" -Destination "441234567890"
Get-SimwoodNotificationRecipients -Type $Type -Method sms -Destination "441234567890"

Get-SimwoodNotificationRecipients -Type "billing"
Remove-SimwoodNotificationRecipients -Type "billing"
Get-SimwoodNotificationRecipients -Type "billing"


$Types = (Get-SimwoodNotificationTypes).psobject.properties.name
foreach ($type in $types) {
	New-SimwoodNotificationRecipient -Type $Type -Method email -Destination "admin@yourdomain.com"
	New-SimwoodNotificationRecipient -Type $Type -Method sms -Destination "441234567890"
}

$EnabledTypes = Get-SimwoodNotifications

foreach ($type in $EnabledTypes) {
	Get-SimwoodNotificationRecipients -Type $Type
	Get-SimwoodNotificationRecipients -Type $Type -Method sms
	Get-SimwoodNotificationRecipients -Type $Type -Method email
	Get-SimwoodNotificationRecipients -Type $Type -Method email -Destination "admin@yourdomain.com"
	Get-SimwoodNotificationRecipients -Type $Type -Method sms -Destination "441234567890"
	
}

Get-SimwoodNotificationHistory
Get-SimwoodNotificationHistory -DateStart (Get-Date).AddDays(-30) -DateEnd (Get-Date) -class "alerts"
```

### Working with Channels
```
Get-SimwoodVoiceLimits
Set-SimwoodVoiceLimits -in 30 -out 30

Get-SimwoodChannelStatistics
Get-SimwoodChannelStatistics -History "1m"
Get-SimwoodChannelStatistics -History "5m"
Get-SimwoodChannelStatistics -History "1h"
```

### Inprogress Calls
```
$Calls = Get-SimwoodInProgressCalls
Get-SimwoodInProgressCalls -ID ($Calls.Channels[0]).call_id
Remove-SimwoodInProgressCall -ID ($Calls.Channels[0]).call_id
```

### Rejected Calls
```
Get-SimwoodRejectedCalls
Get-SimwoodRejectedCalls -Reason 'cli'
```

### Working with Trunks
```
# Get trunk information
$Trunks = Get-SimwoodTrunks
Get-SimwoodTrunks -Name $Trunks.trunk[0]
Get-SimwoodTrunkBalance -Name $Trunks.trunk[0]

#Trunk name must always be upper case.

# Create and remove an Auth Trunk
New-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST"
Remove-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST"

# Create and remove an IP Trunk
New-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST" -Type "ip"
Remove-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST"

# Set Trunk Settings
New-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST"
$TrunkSettings = @{
	'enabled'                                    = 1
	'enabled_in'                                 = 1
	'enabled_out'                                = 1
	'limit_concurrent_out'                       = 10
	'limit_concurrent_out_international'         = 1
	'limit_concurrent_out_international_hotspot' = 0
	'limit_concurrent_out_per_number'            = 10
	'limit_concurrent_in'                        = 10
	'limit_rate_out'                             = '5/1s'
	'limit_rate_out_international'               = '1/10s'
	'limit_rate_out_international_hotspot'       = '1/12h'
	'limit_rate_out_per_number'                  = '1/1s'
	'limit_rate_in'                              = '1/1s'
	'cli_format'                                 = 'e164'
	'cli_default'                                = '441234567890'
	'cli_force_default'                          = 0
	'nni_default'                                = '441234567890'
	'max_cpm'                                    = '1.0'
	'max_cpc'                                    = '1.0'
	'max_cost'                                   = '10.0'
	'max_dur'                                    = 7000
	'emergency_enabled'                          = 1
}
$Result = Set-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST" -Properties $TrunkSettings


# Update trunk balance and remove the limit on the trunk

Set-SimwoodTrunkBalance -Name "$($SimwoodAccountID)-PSTEST" -Balance '10.0'
Set-SimwoodTrunkBalance -Name "$($SimwoodAccountID)-PSTEST" -Adjust '10.0'
Set-SimwoodTrunkBalance -Name "$($SimwoodAccountID)-PSTEST" -Adjust '-5.75'
Remove-SimwoodTrunkBalance -Name "$($SimwoodAccountID)-PSTEST"


# View trunks in progress calls
Get-SimwoodTrunkInProgressCalls -Name "$($SimwoodAccountID)-PSTEST"

Remove-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST"

# Add and remove an IP to an IP Trunk

New-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST" -Type "ip"

Get-SimwoodTrunkIPACL -Name "$($SimwoodAccountID)-PSTEST"
New-SimwoodTrunkIPACL -Name "$($SimwoodAccountID)-PSTEST" -IP "1.1.1.1"
Remove-SimwoodTrunkIPACL -Name "$($SimwoodAccountID)-PSTEST" -IP "1.1.1.1"

Remove-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST"

# Reset Auth trunk password

New-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST"

Set-SimwoodTrunkResetPassword -Name "$($SimwoodAccountID)-PSTEST"

```
### Trunk ACLS
```
# Set Trunk ACLS

New-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST"

$Deny = @(32909, 88299, 87030, 449)
$Allow = @(441, 442, 443, 447)

Set-SimwoodPrefixACL -TrunkName "$($SimwoodAccountID)-PSTEST" -Allow $Allow -Deny $Deny
Set-SimwoodPrefixACL -Deny $Deny

# Get Trunk ACLs
Get-SimwoodPrefixACLs
Get-SimwoodPrefixACLs -TrunkName "$($SimwoodAccountID)-PSTEST"

# Remove ACLs
Remove-SimwoodPrefixACL
Remove-SimwoodPrefixACL -TrunkName "$($SimwoodAccountID)-PSTEST"

# WAITING SIMWOOD: This is currenty broken waiting on a fix from Simwood
Set-SimwoodRateACL -TrunkName "$($SimwoodAccountID)-PSTEST" -Allow $Allow -Deny $Deny
Set-SimwoodRateACL -Deny $Deny

# Get Trunk ACLs
Get-SimwoodRateACLs
Get-SimwoodRateACLs -TrunkName "$($SimwoodAccountID)-PSTEST"

# Remove ACLs
Remove-SimwoodRateACL
Remove-SimwoodRateACL -TrunkName "$($SimwoodAccountID)-PSTEST"

Remove-SimwoodTrunk -Name "$($SimwoodAccountID)-PSTEST"
```

### Simwood IDAs
Note: IDAs are no longer supported by Simwood. I left this in case someone is using legacy ones, but have been unable to test
```
Get-SimwoodIDA
Get-SimwoodIDA -CLI '44123567890'
New-SimwoodIDA -CLI '44123567890'
```

### Trunk Settings
```
$TrunkSettings = @{
	'enabled'                                    = 1
	'enabled_in'                                 = 1
	'enabled_out'                                = 1
	'limit_concurrent_out'                       = 10
	'limit_concurrent_out_international'         = 1
	'limit_concurrent_out_international_hotspot' = 0
	'limit_concurrent_out_per_number'            = 10
	'limit_concurrent_in'                        = 10
	'limit_rate_out'                             = '5/1s'
	'limit_rate_out_international'               = '1/10s'
	'limit_rate_out_international_hotspot'       = '1/12h'
	'limit_rate_out_per_number'                  = '1/1s'
	'limit_rate_in'                              = '1/1s'
	'cli_format'                                 = 'e164'
	'cli_default'                                = '441234567890'
	'cli_force_default'                          = 0
	'nni_default'                                = '441234567890'
	'max_cpm'                                    = '1.0'
	'max_cpc'                                    = '1.0'
	'max_cost'                                   = '10.0'
	'max_dur'                                    = 7000
	'emergency_enabled'                          = 1
}
$Result = Set-SimwoodTrunk -CLI '44123567890' -Properties $TrunkSettings

Remove-SimwoodTrunk -CLI '44123567890'
```

### Numbering
```
Get-SimwoodNumberRanges
Get-SimwoodAvailableNumbers -NumberType 'standard' -Count 10
Get-SimwoodAvailableNumbers -NumberType 'standard' -Count 10 -pattern '44333*'
Get-SimwoodAvailableNumbers -NumberType 'standard' -Count 10 -Pattern '333*' -CountryCode '44'

# This generates and fetches a report so will be slower
Get-SimwoodAvailableNumbers -Consecutive 10 -Pattern '*1234*'

Get-SimwoodAllocatedNumbers
Get-SimwoodAllocatedNumbers -Limit 10
Get-SimwoodAllocatedNumbers -Pattern "*33*" -Key "Test"

Get-SimwoodAllocatedNumbers -Number "441234567890"

New-SimwoodNumber -Number "441234567890"

Get-SimwoodAllocatedNumberLastCall -Number "441234567890"

```

### Number Configuration
```
Get-SimwoodNumberConfig
Get-SimwoodNumberConfig -Number "441234567890"

# See https://cdn.simwood.com/docs/simwood_apiv3.pdf Page 40 "Number Routing Configuration" onwards for more details
$NumberConfig = @{
	options = @{
		enabled        = $true
		block_payphone = $true
		acr            = $true
		trunk          = '9XXXXX-TRUNK'
	}
	
	rules   = @{
		officehours      = @(
			@{
				dow  = @(1, 2, 3, 4, 5)
				time = @('09:00', '17:00')
			}
		)
		weekend          = @(
			@{
				dow = @(6, 7)
			}
		)
		christmasNewYear = @(
			@{
				day   = @(25, 26)
				month = @(12)
			},
			@{
				day   = @(1, 2)
				month = @(1)
			}
		)
	}

	routing = @{
		officehours      = @(
			@(
				@{
					type    = 'reg'
					user    = '930XXXX-SIPUSER'
					timeout = '30'
				},
				@{
					type     = 'sip'
					endpoint = '%e164@pbx.examplecompany.com'
					timeout  = '30'
				}
			),
			@(
				@{
					type   = 'pstn'
					number = '441234567890'
				}
			)
		)
		weekend          = @(
			# The preceeding , is required for single options so powershell doesn't collapse the nested array
			,@(
				@{
					type   = 'pstn'
					number = '441234567890'
				}
			)
		)
		christmasNewYear = @(
			,@(
				@{
					type = 'busy'
				}
			)
		)
			
	}

	meta    = @{
		key     = 'COMPANY_ACC_CODE'
		notes   = 'This number is used for testing'
		example = 'The key attribute is searchable in Get-SimwoodAllocatedNumbers anything else can be used for your own use'
	}

}

Set-SimwoodNumberConfig -Number "441234567890" -Properties $NumberConfig
# Set Default
Set-SimwoodNumberConfig -Properties $NumberConfig

Remove-SimwoodNumberConfig -Number "441234567890"
```

### Assigning Numbers to Trunks
```
Get-SimwoodNumberTrunk -Number "441234567890"
Set-SimwoodNumberTrunk -Number "441234567890" -Trunk '9XXXXX-TRUNK'
Remove-SimwoodNumberTrunk -Number "441234567890"
```

### Number SMS Configuration
```
Get-SimwoodNumberSMSConfig -Number "447234567890"
Set-SimwoodNumberSMSConfig -Number "447234567890" -mode "http_json" -endpoint "https://test.example.com/sms"
Remove-SimwoodNumberSMSConfig -Number "447234567890"
```

### 999 Settings
```
Get-SimwoodNumber999Config -Number "447234567890"
# Business
Set-SimwoodNumber999Config -Number "447234567890" -Name "IQ in IT" -BusSuffix "Ltd" -Premises "Example House, 123" -Thoroughfare "London Road" -Locality "Example Town" -Postcode "AB1 2CD"
# Individual
Set-SimwoodNumber999Config -Number "447234567890" -Title "Mr" -Forename "Luke" -Name "Whitelock" -Premises "Example House, 123" -Thoroughfare "London Road" -Locality "Example Town" -Postcode "AB1 2CD"
```

### Number lookups and validation
```
Get-SimwoodNumberValidate -Number "441234567890"
Get-SimwoodNumberLookup -Number "441234567890"
```

### Porting 
Please note I have only implemented the read only endpoints at the moment and will wait until we have a new port to submit to be able to test adding a port.
```
Get-SimwoodPorts -Type 'gnp'
Get-SimwoodPorts -Type 'mnp'
Get-SimwoodPorts -Type 'gnp' -ID '1234567'
```

### Send an SMS
```
New-SimwoodSMS -To '441234567890' -From '441234567890' -Message 'Test SMS' -Flash 1 -Replace 1 -Concat 10 -Extended 1
```

### Faxing
```
I hate faxes sorry!
```









