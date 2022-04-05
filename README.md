# SteamRoller
## Why?
Anyone that's wanted to run Steam offline finds that Steam loves to nag about it.  There are settings in loginusers.vdf that will make the process less annoying however Steam resets those values on exit.

So I created a simple power shell script that enforces the users choice of offline or online.

I have a few computers that run Steam so I thought it would be useful to have an installer.

And thus SteamRoller was 'born'.

## What?
SteamRoller is a powershell script that modifies Steam user config and launches Steam in the chosen mode.  Includes a simple InnoSetup installer that handles installation.

## Pre-requisites
- Steam must be installed and you must have signed in at least once before SteamRoller will function correctly.

## Installation

### Automatic
- Run SteamRoller_Setup
- Follow instructions in README.TXT, you must unblock the SteamMode.ps1 script

### Manual
- Copy SteamMode.ps1 somewhere on your local system
- Unblock SteamMode.ps1 via an *Elevated* powershell session: Unblock-File -Path .\SteamMode.ps1
- Create shortcuts to run Offline and Online mode.  Example shortcut command:
   C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file "C:\Program Files (x86)\SteamRoller\steammode.ps1" "OFFLINE"
   Drop "OFFLINE" for Online shortcut
