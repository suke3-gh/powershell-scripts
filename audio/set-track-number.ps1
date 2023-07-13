
Param($format, $num)

if ($null -eq $format) {
    Write-Host "Notice : There is not first parameter. Please enter target file pass as first parameter."
    Write-Host "Notice : Stop a script ..."
    exit
}

if ($null -eq $num) {
    Write-Host "Notice : There is not second parameter to become initial track number. In this case, this parameter is assumed as 1."
    $num = 1
}

if ($num -le 0) {
    Write-Host "Notice : A value less than or equal 0 is entered. In this case, this parameter is assumed as 1."
    $num = 1
}

$dirName = "numbered"
New-Item -Path ./ -Name $dirName -ItemType "directory"

foreach ($inputFile in Get-ChildItem -Filter *.${format} ) {
    Write-Host "Setting the track number in the metadata ... : ${inputFile}"
    ffmpeg -i ${inputFile} -hide_banner -metadata track="${num}" -c copy -loglevel warning  "./${dirName}/${inputFile}"

    ++$num
}
