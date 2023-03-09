function uvis(filename)
  M=dlmread(filename);
  L=72;
  U=size(M)(1);
  Subx=M(L:U,1);
  Suby=M(L:U,2);
  h=figure();
  plot(Subx,Suby);
  xlabel("Wavelength (nm)");
  ylabel("Reflectance % ");
  printname=filename(1:(size(filename)(2)-4));
  title("UV-Vis-NIR %s,printname");
  print(h,printname,"-dpng");
endfunction
