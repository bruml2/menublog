#! /bin/bash
#  March 24, 2020; invoke with "./md2html.sh"

# see repo for markdown-to-html: https://github.com/cwjohan/markdown-to-html
# Note also: pandoc

# for sed: https://www.grymoire.com/Unix/Sed.html and
# for REs: https://www.grymoire.com/Unix/Regular.html

MDFILE="Mar20-26"
echo "Starting conversion"
markdown $MDFILE.md --template template.html > $MDFILE.temp.html
echo "Fixing img tags"
node fiximgs.js $MDFILE.temp.html > $MDFILE.html
echo "Finished conversion"
cp $MDFILE.html /Library/WebServer/Documents/rumlcomrepo/coronavirus/
echo "Copied html file to rumlcomrepo/coronavirus/"
cp $MDFILE.html /Library/WebServer/Documents/rumlcomrepo/coronavirus/index.html
echo "Copied html file to rumlcomrepo/coronavirus/index.html"
echo "Done"