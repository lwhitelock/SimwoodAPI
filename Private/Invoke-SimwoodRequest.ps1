function Invoke-SimwoodRequest{
    [CmdletBinding()]
    param(
        [string]$Method,
		[string]$Resource,
		[string]$ResourceFilter,
		[string]$Body
    )

    $Result = $null

    if (!$script:SimwoodCred){
        Write-Error "Please run Set-SimwoodAPIDetails before other commands"
    } else {
        try {
			if (($Method -eq "put") -or ($Method -eq "post") -or ($Method -eq "delete")) {
                Write-Verbose "Body: $Body"
				$Response = Invoke-WebRequest -Credential $script:SimwoodCred -method $method -uri ($Script:SimwoodBaseURL + $Resource) -ContentType 'application/json' -body $Body -ea stop
				Write-Verbose "Content: $($Response.Content)"
				$Result = $Response | ConvertFrom-Json -depth 100
			}
			else {
					$Response = Invoke-WebRequest -Credential $script:SimwoodCred -method $method -uri ($Script:SimwoodBaseURL + $Resource + $ResourceFilter) -ContentType 'application/json' -ea stop
					Write-Verbose "Content: $($Response.Content)"
					$Result = $Response | ConvertFrom-Json -Depth 100		
			}
		}
		catch {
			Write-Error "An Error Occured $_"
		}
    
        return $Result
    
    }

}