function Invoke-SimwoodHashRequest {
    [CmdletBinding()]
    param(
        [string]$Hash,
        [int]$AttemptNo = 0
    )
    if (!$script:SimwoodCred) {
        Write-Error "Please run Set-SimwoodAPIDetails before other commands"
    }
    else {
        
        if ($AttemptNo -le 30) {
            try {
                $Response = Invoke-WebRequest -Credential $script:SimwoodCred -method GET -uri ($Script:SimwoodBaseURL + "files/$($script:SimwoodAccountID)/$Hash") -ContentType 'application/json' -ea stop
                if ($Response.StatusCode -eq 200 -and $Response.Content[0] -eq '[') {
                    $Result = $Response | ConvertFrom-Json -Depth 100
                }
                else {
                    Write-Verbose "204 Report not ready trying again in 2 seconds"
                    Write-Verbose "Response $($Response)"
                    Start-Sleep 2
                    $AttemptNo++
                    $Result = Invoke-SimwoodHashRequest -Hash $Hash -AttemptNo $AttemptNo
                }
            }
            catch {
                Write-Verbose "Report error trying again in 2 seconds: $_"
                    Start-Sleep 2
                    $AttemptNo++
                    $Result = Invoke-SimwoodHashRequest -Hash $Hash -AttemptNo $AttemptNo            
            }
                

        }
        else {
            Write-Error "Failed to Fetch Report after 30 attempts"
        }

        return $Result

    }				
			
}
		
