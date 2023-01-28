function retval = imgcount(filename)
img=imread(filename);
imgr=rgb2gray(img);
imbw=im2bw(imgr,graythresh(imgr));
invimg=~imbw;
B=bwboundaries(invimg);
retval=size(B)(1);
endfunction
