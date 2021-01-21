ffmpeg -i VID.mp4 -vf drawtext="fontfile=lemon_milk/LemonMilkbold.otf: \
text='Passionfruit': fontcolor=white: fontsize=100: \
boxborderw=5: x=(w-text_w)/2: y=(h-text_h)/2" -codec:a copy output.mp4
