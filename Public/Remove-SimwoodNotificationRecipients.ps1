function Remove-SimwoodNotificationRecipients {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Type,
        [ValidateSet("sms", "email")]
        [string]$Method,
        [string]$Destination
    )


    if ($Method -and $Destination) {
        $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
        $utf8 = New-Object -TypeName System.Text.UTF8Encoding
        $hash = ([System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($Destination)))) -replace '-'
        $uri = "accounts/$($script:SimwoodAccountID)/notifications/$Type/$Method/$($hash.ToLower())"

    }
    else {
        $uri = "accounts/$($script:SimwoodAccountID)/notifications/$Type"
    }
    


    $Result = Invoke-SimwoodRequest -Method DELETE -Resource $uri
    Return $Result
}