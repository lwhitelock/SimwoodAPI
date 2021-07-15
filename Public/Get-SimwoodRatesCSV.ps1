function Get-SimwoodRatesCSV {
    [CmdletBinding()]
    Param(
        [ValidateSet("default","silver","platinum","gold","url")]
        [string]$Name = "default",
        [Parameter(Mandatory=$true)]
        [string]$FilePath,
        [string]$url
        
    )
    if ($Name -eq "url"){
        $Result = Invoke-WebRequest -Credential $script:SimwoodCred -method get -uri $($Script:SimwoodBaseURL + $url.Substring(4)) -ContentType 'application/json' -ea stop -OutFile $FilePath
        Return $Result        
    }
    $Resource = "accounts/$($script:SimwoodAccountID)/rates/csv/$Name"
    $Result = Invoke-WebRequest -Credential $script:SimwoodCred -method get -uri ($Script:SimwoodBaseURL + $Resource) -ContentType 'application/json' -ea stop -OutFile $FilePath
    Return $Result
}