$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'tools/DeerPortal-0.8.2'
$handbook = Join-Path (Split-Path $tools) 'tools/DeerPortal-0.8.2/data/assets/pdf/DeerPortalHandBook.pdf'
$classic = Join-Path $content 'DeerPortal.exe'
$classic_shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'Deer Portal Game.lnk'

Get-ChocolateyWebFile -PackageName 'deerportal' -FileFullPath "$tools\DeerPortal-0.8.2.zip" -Url 'https://github.com/deerportal/deerportal/releases/download/v0.8.2/Windows-DeerPortal-0.8.2.zip'

Install-ChocolateyZipPackage 'deerportal' "$tools\DeerPortal-0.8.2.zip" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyShortcut `
    -ShortcutFilePath $classic_shortcut `
    -WorkingDirectory $content `
    -TargetPath $classic

