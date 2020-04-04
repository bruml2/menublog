#! /bin/bash
# March 22-24, 2020  invoke with "./resizewaiting.sh"
# resize to width of 1000px retaining the aspect-ratio;

# https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/
#   ==> removed "-strip" from recommended command retaining metadata;
#   ==> to change output format: "-format png";
# truncating filename extension: ../imgfinished/${file%.*}.png

# check starting conditions: files in imgwaiting; imgfinished empty;
FILESINWAITING=`ls ~/blogs/2020MenuBlog/imgwaiting | wc -l`
FILESINFINISHED=`ls ~/blogs/2020MenuBlog/imgfinished | wc -l`
if [ -d ~/blogs/2020MenuBlog/imgwaiting ] && \
   [$FILESINWAITING > 0 ] && \
   [ -d ~/blogs/2020MenuBlog/imgfinished ] && \
   [$FILESINFINISHED = 0 ]
then
echo "resizing images in imgwaiting"
cd /Users/ruml/Blogs/2020MenuBlog/imgwaiting
# copy waiting files to backup;
rm ../imgbackup/*
cp * ../imgbackup
echo "Copied to imgbackup; Beginning . . ."
# normally, imgfinished will be empty;
mogrify -path ../imgfinished/ -filter Triangle -define filter:support=2 -thumbnail 1000 -unsharp 0.25x0.25+8+0.065 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB  *

cd -
echo "Moving from imgwaiting to imgprocessed"
FDATE=`date +%F`
# create the directory if absent;
[ ! -d /Users/ruml/Blogs/2020MenuBlog/imgprocessed/$FDATE ] && \
  mkdir /Users/ruml/Blogs/2020MenuBlog/imgprocessed/$FDATE
mv /Users/ruml/Blogs/2020MenuBlog/imgwaiting/* \
  /Users/ruml/Blogs/2020MenuBlog/imgprocessed/$FDATE
echo "Moving from imgfinished to rumlcomrepo/coronavirus/img3 and $FDATE"
# make convenience directory for Filezilla transer;
[ ! -d /Library/WebServer/Documents/rumlcomrepo/coronavirus/img3/$FDATE ] && \
  mkdir /Library/WebServer/Documents/rumlcomrepo/coronavirus/img3/$FDATE
cp /Users/ruml/Blogs/2020MenuBlog/imgfinished/* \
  /Library/WebServer/Documents/rumlcomrepo/coronavirus/img3/$FDATE
mv /Users/ruml/Blogs/2020MenuBlog/imgfinished/* \
  /Library/WebServer/Documents/rumlcomrepo/coronavirus/img3
# NB: imgwaiting and imgfinished are now empty;
echo "Done!"

else
  echo "Directories not as expected: imgwaiting: $FILESINWAITING; imgfinished: $FILESINFINISHED"
fi
