#! /bin/bash
#  invoke with "./md2html.sh Mar20-26"

# see repo for markdown-to-html: https://github.com/cwjohan/markdown-to-html
# Note also: pandoc

echo "Starting conversion"
markdown $1.md --template template.html > $1.html
echo "Finished conversion"
# cat blogtop.html $1.html blogbottom.html > temp
# mv temp $1.html
cp $1.html /Library/WebServer/Documents/rumlcomrepo/coronavirus/
echo "Copied html file to rumlcomrepo/coronavirus/"
cp $1.html /Library/WebServer/Documents/rumlcomrepo/coronavirus/index.html
echo "Copied html file to rumlcomrepo/coronavirus/index.html"
echo "Done"