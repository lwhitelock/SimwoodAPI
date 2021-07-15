function Get-SimwoodInvoicePDF {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$InvoiceID,
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )
    $Resource = "accounts/$($script:SimwoodAccountID)/credit/invoices/$InvoiceID"
    $Result = Invoke-WebRequest -Credential $script:SimwoodCred -method get -uri ($Script:SimwoodBaseURL + $Resource + $ResourceFilter) -ContentType 'application/json' -ea stop -OutFile $FilePath
    Return $Result
}