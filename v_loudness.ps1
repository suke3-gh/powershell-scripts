
Param($filePass)
ffmpeg -i "$filePass" -hide_banner -af "loudnorm=I=-14:LRA=23:TP=-1:print_format=summary" -vn -f null -