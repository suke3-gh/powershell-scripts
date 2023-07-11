
Param($format)

$dirName = "titled"
New-Item -Path ./ -Name $dirName -ItemType "directory"

foreach ($inputFile in Get-ChildItem -Filter *.${format} ) {
  $metaTitle = "${inputFile}".Replace(".${format}", '')

  Write-Host "Setting title in the metadata ... : ${inputFile}"
  ffmpeg -i ${inputFile} -hide_banner -metadata title="${metaTitle}" -c copy -loglevel warning  "./${dirName}/${inputFile}"
}
