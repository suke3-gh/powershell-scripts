
Param($format)

if ($null -eq $format) {
    Write-Host "Notice : There is not first parameter. Please enter target file pass as first parameter."
    Write-Host "Notice : Stop a script..."
    exit
}

$dirName = "normalized"
New-Item -Path . -Name $dirName -ItemType "directory"

foreach ($inputFile in Get-ChildItem -Filter *.${format} ) {
    $resultFileName = "loudness-${inputFile}.json"

    Write-Host "Checking the loudness... : ${inputFile}"
    ffmpeg -i ${inputFile} -hide_banner -filter:a loudnorm=I=-14:LRA=23:TP=-1:offset=0:print_format=json -vn -f null - 2> $resultFileName
    Get-Content $resultFileName -Tail 12 | Tee-Object -FilePath $resultFileName

    $jsonData = Get-Content -Raw $resultFileName | ConvertFrom-Json
    $filterContent = "loudnorm=I=-14:LRA=23:TP=-1:offset=0:measured_I=" + $jsonData.input_i + ":measured_TP=" + $jsonData.input_tp + ":measured_LRA=" + $jsonData.input_lra + ":measured_thresh=" + $jsonData.input_thresh + ":offset=" + $jsonData.target_offset + ":linear=false,anlmdn=s=0.00001:p=0.002:r=0.003"
    Write-Host "filter info : ${filterContent}"

    $outputFilePass = "./${dirName}/${inputFile}"

    switch ($format) {
        'wav' {
            ffmpeg -i ${inputFile} -vn -codec:a $format -ar 48k -sample_fmt s16 -async 2 -filter:a $filterContent -hide_banner $outputFilePass
            break
        }
        'flac' {
            ffmpeg -i ${inputFile} -vn -codec:a $format -ar 48k -sample_fmt s16 -async 2 -filter:a $filterContent -hide_banner $outputFilePass
            break
        }
        default {
            ffmpeg -i ${inputFile} -vn -codec:a $format -ar 48k -ab 128k -async 2 -filter:a $filterContent -hide_banner $outputFilePass
            break
        }
    }

    Remove-Item $resultFileName
}
