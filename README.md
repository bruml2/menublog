## The Coronavirus Menu Blog

Using a simple markdown file as a source, the html is generated. The only special marking is ":70" following the alternate text in img tags; this is converted to a width property, changing the displayed width of the image from 90% to the percentage specified.

### To add a new post.

1. Select, crop and adjust the photos.
2. Copy them from *Photos* to the imgwaiting directory.
3. Execute "./resizewaiting.sh".
4. Modify the markdown file.
5. Execute "./md2html.sh
6. View result in localhost/rumlcomrepo/coronavirus/
7. With Filezilla, move new index.html to ruml.com/coronavirus
8. Move contents of directory with new photos to ruml.com/coronavirus/img
9. View ruml.com/coronavirus/