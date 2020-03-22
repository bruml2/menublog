#! /bin/bash
# March 22, 2020
# resize to width of 200 retaining the aspect-ratio;
# convert example.png -resize 200 example.png
# https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/
#   ==> removed "-strip" from recommended command retaining metadata;
#   ==> to change output format: "-format png";
# truncating filename extension: ../imgfinished/${file%.*}.png

echo "resizing images in imgwaiting"
cd /Users/ruml/Blogs/2020MenuBlog/imgwaiting
echo "Beginning . . ."
# normally, imgfinished will be empty;
mogrify -path ../imgfinished/ -filter Triangle -define filter:support=2 -thumbnail 1000 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB  *

cd -
echo "Moving from imgwaiting to imgprocessed"
# create the directory if absent;
[ ! -d /Users/ruml/Blogs/2020MenuBlog/imgprocessed/`date +%F` ] && \
  mkdir /Users/ruml/Blogs/2020MenuBlog/imgprocessed/`date +%F`
mv /Users/ruml/Blogs/2020MenuBlog/imgwaiting/* \
  /Users/ruml/Blogs/2020MenuBlog/imgprocessed/`date +%F`
echo "Moving from imgfinished to rumlcomrepo/coronavirus/img"
mv /Users/ruml/Blogs/2020MenuBlog/imgfinished/* \
  /Library/WebServer/Documents/rumlcomrepo/coronavirus/img
# NB: imgwaiting and imgfinished are now empty;
echo "Done!"
