#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Create new directories and enter the first one.

mkd() {
  if [ -n "$*" ]; then
    mkdir -p "$@"
    #      └─ make parent directories if needed

    cd "$@" || exit 1
  fi
}

# turn that video into webm.
# brew reinstall ffmpeg --with-libvpx
webmify() {
  ffmpeg -i "$1" -vcodec libvpx -acodec libvorbis -isync -copyts -aq 80 -threads 3 -qmax 30 -y "$2" "$1.webm"
}

# animated gifs from any video
# from alex sexton (https://gist.github.com/SlexAxton/4989674)
gifify() {
  if [[ -n "$1" ]]; then

    if [[ $2 == '--good' ]]; then
      ffmpeg -i "$1" -r 10 -vcodec png "out-static-%05d.png"
      time convert -verbose +dither -layers Optimize -resize 900x900\> "out-static*.png"  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > "$1.gif"
      rm "out-static*.png"
    else
      ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$1.gif"
    fi

  else
    printf "\n%s" "Usage: gifify <input_movie.mov> [--good]. You DO need to include extension."
  fi
}
