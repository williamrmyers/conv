#!bin/bash/

# Notes
# https://blog.addpipe.com/converting-webm-to-mp4-with-ffmpeg/ 

video_input=$1

ffmpeg -i $video_input $1.mp4