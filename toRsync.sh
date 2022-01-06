
flags="-hP --progress"

#anki
rsync $flags -r pc:/home/rdkang/.local/share/Anki2/ ~.local/share/Anki2

rsync $flags -r pc:~/Pictures/ ~/Pictures

# betterlockscreen and wallpaper
randomWallpaper=$(fd '\.jpg$|\.png$|\.webm$' ~/Pictures/Wallpapers | shuf | head -n 1)
setbg $randomWallpaper
betterlockscreen -u $randomWallpaper


# firefox
firefox &;sleep 1;killall firefox

pcprofile=`ssh pc 'ls /home/rdkang/.mozilla/firefox | grep default-release'`
currentprofile=`ls /home/rdkang/.mozilla/firefox | grep default-release`

rm -rf /home/rdkang/.mozzila/firefox/$currentprofile

rsync $flags -r pc:~/.mozilla/firefox/$pcprofile/ ~/.mozzila/firefox/$currentprofile
