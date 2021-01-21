#!bin/bash/

video=$1
audio_track=$2
_time=$(date +%s)
new_file_name="/Users/williammyers/Desktop/conv/completed/"$video"_"$_time".mp4"

echo "Analyzing Files"

video_length=$(ffprobe -i $video -show_entries format=duration -v quiet -of csv="p=0")

audio_length=$(ffprobe -i $audio_track -show_entries format=duration -v quiet -of csv="p=0")

echo $video_length
echo $audio_length

results=$(echo $audio_length / $video_length | bc)

start=1
end=$results
for ((i=$start; i<=$end; i++)); do printf "file '%s'\n" $video >> list.txt ; done

echo "Assembling Video"

ffmpeg -f concat -i list.txt -c copy -flags global_header output.mp4
# cat list.txt

echo "Adding Audio to Video"

# ffmpeg -i output.mp4 -i $audio_track -codec copy -shortest $new_file_name
# ffmpeg -i input.mp4 -i input.mp3 -c copy -map 0:v:0 -map 1:a:0 output.mp4
ffmpeg -i output.mp4 -i $audio_track -c copy -map 0:v:0 -map 1:a:0 $new_file_name

echo "Deleting Temp files"

# Delete Temp files
rm list.txt output.mp4

open $new_file_name
