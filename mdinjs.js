/* mdinjs.js */
/* March 24, 2020; invoke with "node mdinjs.js <inputfile> > <outputfile> */

// modified from: https://github.com/cwjohan/markdown-to-html
// NB: for template option, node module must be installed with:
//      npm install cwjohan/markdown-to-html

const Markdown = require('markdown-to-html').Markdown
let md = new Markdown()
md.bufmax = 2048
const fileName = process.argv[2]
const opts = {template: 'template.html'}

// Write a header.
// console.log('===============================');
// Write a trailer at eof.
md.once('end', function() {
  // console.log('===============================');
});
md.render(fileName, opts, function(err) {
  if (err) {
    console.error('>>>' + err);
    process.exit();
  }
  md.pipe(process.stdout);
});