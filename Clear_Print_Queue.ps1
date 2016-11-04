# Define Name of Print Server
$PRINTSVR = "MIT-Robert-0916"


# Stop 'Print Spooler' service on Print Server
sc.exe \\$PRINTSVR stop spooler

# Remove all queued print job
Remove-Item \\$PRINTSVR\c$\WINDOWS\System32\spool\printers\*

sc.exe \\$PRINTSVR start spooler