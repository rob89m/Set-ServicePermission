# The first part of this code is to check that it is being run as Admin and request elevation if required.
# Please go to line #72 for executed code

# Get the ID and security principal of the current user account

$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()

$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

 

# Get the security principal for the Administrator role

$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

 

# Check to see if we are currently running "as Administrator"

if ($myWindowsPrincipal.IsInRole($adminRole))

   {

   # We are running "as Administrator" - so change the title and background color to indicate this

   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"

   $Host.UI.RawUI.BackgroundColor = "DarkBlue"

   clear-host

   }

else

   {

   # We are not running "as Administrator" - so relaunch as administrator

   

   # Create a new process object that starts PowerShell

   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

   

   # Specify the current script path and name as a parameter

   $newProcess.Arguments = $myInvocation.MyCommand.Definition;

   

   # Indicate that the process should be elevated

   $newProcess.Verb = "runas";

   

   # Start the new process

   [System.Diagnostics.Process]::Start($newProcess);

   

   # Exit from the current, unelevated, process

   exit

   }

# Run your code that needs to be elevated here
Set-ExecutionPolicy Unrestricted -Force

# Install Chocolatey Package Manager
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Carbon using Chocolatey
# More information regarding carbon can be found at http://get-carbon.org/
cinst Carbon -y

# Set Permissions on Service (eg. Spooler)
# More information on usage can be found at http://get-carbon.org/Grant-ServicePermission.html
Grant-ServicePermission -Name spooler -Identity robert -FullControl
