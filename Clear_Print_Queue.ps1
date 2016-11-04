# Define Name of Print Server
$PRINTSVR = "MIT-Robert-0916"


# Stop 'Print Spooler' service on Print Server
Write-Host "Stopping the Print Spooler on $PRINTSVR"
sc.exe \\$PRINTSVR stop spooler

# Remove all queued print job
Write-Host "Clearing the Print Queue on $PRINTSVR"
Remove-Item \\$PRINTSVR\c$\WINDOWS\System32\spool\printers\*

# Start 'Print Spooler' service on Print Server
Write-Host "Starting the Print Spooler on $PRINTSVR"
sc.exe \\$PRINTSVR start spooler