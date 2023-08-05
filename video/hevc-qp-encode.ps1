
Param($inputFile)

if ($null -eq $inputFile) {
    Write-Host "Notice : There is not first parameter. Please enter target file pass as first parameter."
    Write-Host "Notice : Stop a script..."
    exit
}

$loudnessInfo = "loudness-${inputFile}.json"

Write-Host "Checking the loudness... : ${inputFile}"
ffmpeg -i ${inputFile} -hide_banner -filter:a loudnorm=I=-14:LRA=23:TP=-1:offset=0:print_format=json -vn -f null - 2> $loudnessInfo
Get-Content $loudnessInfo -Tail 12 | Tee-Object -FilePath $loudnessInfo

$jsonData = Get-Content -Raw $loudnessInfo | ConvertFrom-Json
$audioFilterContent = "loudnorm=I=-14:LRA=23:TP=-1:offset=0:measured_I=" + $jsonData.input_i + ":measured_TP=" + $jsonData.input_tp + ":measured_LRA=" + $jsonData.input_lra + ":measured_thresh=" + $jsonData.input_thresh + ":offset=" + $jsonData.target_offset + ":linear=false,anlmdn=s=0.00001:p=0.002:r=0.002"
Write-Output "filter info : ${audioFilterContent}"

ffmpeg -i ${inputFile} `
-codec:v hevc_nvenc -rc:v constqp -init_qpI 25 -init_qpP 29 -g 120 -fps_mode cfr -r 60 -multipass fullres -preset p7 -tune hq -profile:v main10 -tag:v hvc1 -level 5.2 `
-codec:a libopus -b:a 128k -async 2 -filter:a ${audioFilterContent} `
-hide_banner output-${inputFile}

Remove-Item $loudnessInfo
