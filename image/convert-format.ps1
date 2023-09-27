
Param($inputFormat, $outputFormat)

# Checked either specified format or not.
if ($null -eq $inputFormat) {
    Write-Host 'Notice : There is not first parameter. Please enter the file extension want to convert.'
    Write-Host 'Notice : Stop a script...'
    exit
}

if ($null -eq $outputFormat) {
    Write-Host 'Notice : There is not second parameter. This time, image is converted as jpg.'
}

$dirName = 'converted'
New-Item -Path . -Name $dirName -ItemType 'directory' -Force

Write-Host "18"

foreach ($currentItemName in Get-ChildItem -Filter *.${inputFormat}) {
    $outputFilePass = "./${dirName}/${currentItemName}".Replace(".${inputFormat}", ".${outputFormat}")

    switch ($outputFormat) {
        avif {
            ffmpeg -i "snapshot.jpg" -hide_banner -c:v libaom-av1 -crf 0 -still-picture 1 -tune ssim -color_range pc "output.avif"
            break
        }
        png {
            break
        }
        webp{
            break
        }
        Default {
            Write-Host "Default."
            #ffmpeg -i "${currentItemName}" -hide_banner -color_range pc "${outputFilePass}"
            break
        }
    }
}
