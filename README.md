# Set-ServicePermission
PS Script to set permissions on a "Print Spooler" service


1. Add Security Group "SG_PrinterAdmin"
2. Run "Set-Permissions.ps1" on Print Server to allow "SG_PrinterAdmin" members to control "Print Spooler"

Security Groups have been implemented in this instance to allow for easier visibilty and management of who has access to the service.
Individuals can be added by changing "SG_PrinterAdmin" to a username however this is not recommended.
