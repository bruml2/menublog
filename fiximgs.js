/* fiximgs.js  -- executed by md2html.sh to modify img tags */
// March 24, 2020; invoke with "node fiximgs.js <inputfile>"

const fs = require('fs')
const readline = require('readline')
const inputfile = process.argv[2]

const readlnInterface = readline.createInterface({
  input: fs.createReadStream(inputfile)
  // use console.log for output;
  // output: process.stdout
});
let changesCount = 0
// ?<width> is a "named capturing group" (webkit only);
// const re = /\:(?<width>\d\d)"><\/div>/
readlnInterface.on('line', function(line) {
  let lineout = line
  // surround img with <div class='pic'></div> rather than <p></p>;
  const re1 = /^<p><img/
  let found = line.match(re1)
  if (found) {
    const temp = line.replace(/^<p>/, "<div class='pic'>")
    lineout = temp.replace(/<\/p>$/, "</div>")
    // move :60 to be width of image in %;
    const re2 = /\:(\d\d)"><\/div>/
    let found = lineout.match(re2)
    if (found) {
      changesCount++
      const match = found[0]                // string
      const width = found[1]                // string
      const widthIdx = found.index          // number
      // const grpsWidth = found.groups.width  // string
      // console.log(found, width, widthIdx, grpsWidth)
      lineout = lineout.replace(match, `" style="width:${width}%"></div>`)
    } 
  }
  console.log(lineout)
}).on('close', () => {
  // console.log('EOF: Have a great day!');
  process.exit(0);
}).on('error', function (e) {
  console.log("error", e);
  // something went wrong
})