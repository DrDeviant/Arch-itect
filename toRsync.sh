
#anki
rsync -hP --progress -r pc:/home/rdkang/.local/share/Anki2/ ~.local/share/Anki2

rsync -hP --progress -r pc:~/Pictures/ ~/Pictures

# betterlockscreen and wallpaper
randomWallpaper=$(fd '\.jpg$|\.png$|\.webm$' ~/Pictures/Wallpapers | shuf | head -n 1)
setbg $randomWallpaper
betterlockscreen -u $randomWallpaper
