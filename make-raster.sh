#!/bin/sh
rm -r TMP_Rasters
find Source\ Files -type d -printf "TMP_Rasters/%P\0" | xargs -0 mkdir -p
find "Source Files/" -type f | sed 's/Source Files\///g' | while read iconName; do
inkscape -f "Source Files/$iconName" --export-area-page --export-dpi=90 -e "TMP_Rasters/$(echo $iconName | sed -e 's/.svg/.png/g')"
done
