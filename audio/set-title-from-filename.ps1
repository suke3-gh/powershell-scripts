
Param($format)

if ($null -eq $format) {
    Write-Host "Notice : There is not first parameter. Please enter target file pass as first parameter."
    Write-Host "Notice : Stop a script..."
    exit
}

$dirName = "titled"
New-Item -Path ./ -Name $dirName -ItemType "directory"

foreach ($inputFile in Get-ChildItem -Filter *.${format} ) {
    $metaTitle = "${inputFile}".Replace(".${format}", '')

    Write-Host "Setting title in the metadata... : ${inputFile}"
    ffmpeg -i ${inputFile} -hide_banner -metadata title="${metaTitle}" -c copy -loglevel warning  "./${dirName}/${inputFile}"
}
