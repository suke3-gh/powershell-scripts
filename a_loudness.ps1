
Param($format)
foreach ($fileName in Get-ChildItem -Filter *.${format} ) {
  ffmpeg -i ${fileName} -hide_banner -filter:a loudnorm=I=-14:LRA=23:TP=-1:print_format=json -vn -f null - 2> loudness-${fileName}.json
  Get-Content loudness.json -Tail 12 | Tee-Object loudness-${fileName}.json
}