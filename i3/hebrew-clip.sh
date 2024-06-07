#!/usr/bin/env bash
# Dependencies: tesseract-ocr imagemagick maim xsel

SCR_IMG=$(mktemp)
trap "rm $SCR_IMG*" EXIT

maim -s -u $SCR_IMG.png

mogrify -modulate 100,0 -resize 400% $SCR_IMG.png
#should increase detection rate

hocr -i $SCR_IMG.png -o $SCR_IMG &>/dev/null
echo $(tr "\n" " " <$SCR_IMG.txt) | xsel -bi
notify-send 'Tesseract-OCR' 'Text has been copied to the clipboard.' --icon=dialog-information
exit
