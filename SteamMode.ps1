if (Test-Path Registry::HKEY_CURRENT_USER\Software\Valve\Steam)
{
  $steamPath = Get-ItemProperty -Path HKCU:\Software\Valve\Steam | Select-Object -ExpandProperty SteamPath
  $steamExe = Get-ItemProperty -Path HKCU:\Software\Valve\Steam  | Select-Object -ExpandProperty SteamExe
}

if (($steamPath -eq '') -or ($steamExe -eq ''))
{ 
  return
} else {
#    Start-Process -FilePath "$steamExe" -ArgumentList "-shutdown"
    $modeparam=$args[0]
    if ($modeparam -eq 'OFFLINE')
    {
        $a = Get-Content ($steamPath + '\config\loginusers.vdf')
        $a = $a -replace '(WantsOfflineMode.*)("0")','$1"1"'
        $a = $a -replace '(SkipOfflineModeWarning.*)("0")','$1"1"'
        [IO.File]::WriteAllLines(($steamPath + '\config\loginusers.vdf'), $a)
        Start-Process -FilePath "$steamExe" -ArgumentList "-noasync -nofriendsui -single-core -tcp -offline"
    }
    else 
    {
        $a = Get-Content ($steamPath + '\config\loginusers.vdf')
        $a = $a -replace '(WantsOfflineMode.*)("1")','$1"0"'
        $a = $a -replace '(SkipOfflineModeWarning.*)("1")','$1"0"'
        [IO.File]::WriteAllLines(($steamPath + '\config\loginusers.vdf'), $a)
        Start-Process -FilePath "$steamExe" -ArgumentList "-noasync -nofriendsui -single-core -tcp"
    }
}