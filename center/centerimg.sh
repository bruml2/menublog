#! /bin/bash

# to be applied to the output of md2html.sh
#  replace lines with "^<p><img" with <div style="display: flex; align-items: center; justify-content: center;"> [the line] followed by </div>
# final: sed -f <commands> <input>

#  sed '/regex/{x;p;x;}' file.txt  ==> new line above and below target lines
#  also: sed '/regex/{x;p;x;G;}' file.txt

# cat test.html |\
sed '/^<p><img/s/^<p>//' test.html |\
sed '/^<img/s/<\/p>//' |\
sed '/^<img/i\
<div style="display: flex\; align-items: center\; justify-content: center\;">
' |\
sed '/^<img/a\
</div>
'
