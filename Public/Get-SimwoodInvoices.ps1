function Get-SimwoodInvoices {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("all","unpaid","paid")]
        [string]$InvoiceType
    )
    $Result = Invoke-SimwoodRequest -Method get -Resource "accounts/$($script:SimwoodAccountID)/credit/invoices/$InvoiceType"
    Return $Result
}