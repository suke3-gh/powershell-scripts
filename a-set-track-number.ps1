
Param($format, $num)

$dirName = "numbered"
New-Item -Path ./ -Name $dirName -ItemType "directory"

foreach ($inputFile in Get-ChildItem -Filter *.${format} ) {

  Write-Host "Setting the track number in the metadata ... : ${inputFile}"
  ffmpeg -i ${inputFile} -hide_banner -metadata track="${num}" -c copy -loglevel warning  "./${dirName}/${inputFile}"

  ++$num
}
