# Set-ServicePermission
PS Script to set permissions on a "Print Spooler" service


1. Add Security Group "SG_PrinterAdmin"
2. Run "Set-Permissions.ps1" on Print Server to allow "SG_PrinterAdmin" members to control "Print Spooler"

Security Groups have been implemented in this instance to allow for easier visibilty and management of who has access to the service.
Individuals can be added by changing "SG_PrinterAdmin" to a username however this is not recommended.

"Clear_Print_Queue.ps1" can be used by members of "SG_PrintAdmin" to clear the print queue on the print server. Please be sure to set the variable $PRINTSVR to the name of the print server.
