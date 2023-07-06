
Param($filename, $mI, $mTP, $mLRA, $mTH, $offset)

$audioFilter = "loudnorm=I=-14:LRA=23:TP=-1:measured_I=${mI}:measured_TP=${mTP}:measured_LRA=${mLRA}:measured_thresh=${mTH}:offset=${offset}:linear=false,anlmdn=s=0.00001:p=0.004:r=0.002"

ffmpeg -i "$filename" `
-codec:v hevc_nvenc -rc:v constqp -init_qpI 26 -init_qpP 30 -g 120 -fps_mode cfr -r 60 -multipass fullres -preset p7 -tune hq -profile:v main10 -tag:v hvc1 -level 5.2 `
-codec:a libopus -b:a 160k -async 2 -filter:a ${audioFilter} `
-hide_banner "output-$filename"

Write-Output "Fileter info: ${audioFilter}"