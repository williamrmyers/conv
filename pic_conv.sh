!# bin/bash

image=$1
audio_track=$2
_time=$(date +%s)
new_file_name="completed/"$audio_track"_"$_time".mp4"

# Works for some images and not others.
# Trumps-America-Nazis-in-Charlottesville-1.jpg fails
ffmpeg -loop 1 -i $image -i $audio_track -shortest -c:a aac -c:a copy $new_file_name


#
# ffmpeg -f $audio_track -i $image imagestovideo.mp4


# ffmpeg -y -loop 1 -i $image -i $audio_track -r 30 -b:v 2500k -vframes 14490 -acodec libvo_aacenc -ab 160k result.mp4


# Again
# ffmpeg -i $audio_track -f image2 -loop 1 -r 2 -i $image \
# -shortest -c:a copy -c:v  -pix_fmt yuv420p -crf 23 -preset veryfast output.mp4

# FAILED
# ffmpeg -i $1  -loop -i $2 \
# -c:v copy -c:a aac -strict experimental \
# -map 0:v:0 -map 1:a:0 output.mp4
