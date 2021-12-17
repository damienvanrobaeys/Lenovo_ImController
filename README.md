# Intune Proactive Remediation sript to check System Interface Foundation Service version

On Lenovo device there is an issue with the System Interface Foundation Service which allows attacker to get admin privileges.
This script allows you to check if the lmcontroller service exists and what is th version of the lmcntroller by checking vesion of the file Lenovo.Modern.ImController.PluginHost.exe

If version is equal or greather than 1.1.20.3 it's ok
If not script gives an EXIT 1 meaning issue.

See below the post relaive to the issue with System Interface Foundation Service
https://www.bleepingcomputer.com/news/security/lenovo-laptops-vulnerable-to-bug-allowing-admin-privileges/
