$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fileLocation = Join-Path -Path $toolsDir -ChildPath "splunkforwarder-9.0.4-de405f4a7979-x64-release.msi"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  file          = $fileLocation
  softwareName  = 'UniversalForwarder*'
  silentArgs    = '/qn /norestart AGREETOLICENSE=YES'
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}

Install-ChocolateyPackage @packageArgs