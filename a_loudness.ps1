
Param($format)
foreach ($inputFile in Get-ChildItem -Filter *.${format} ) {
  $resultFileName = "loudness-${inputFile}.json"
  ffmpeg -i ${inputFile} -hide_banner -filter:a loudnorm=I=-14:LRA=23:TP=-1:print_format=json -vn -f null - 2> $resultFileName
  Get-Content $resultFileName -Tail 12 | Tee-Object -FilePath $resultFileName
}