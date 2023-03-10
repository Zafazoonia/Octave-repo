function uvis(filename)
  M=dlmread(filename);
  L=72;
  U=size(M)(1);
  Subx=M(L:U,1);
  Suby=M(L:U,2);
  h=figure("visible","off");
  dx = Subx(2)-Subx(1);
 [pks idx] = findpeaks(Suby,"MinPeakDistance",6);
  plot(Subx,Suby,Subx(idx),Suby(idx),"xm");
  for i=1:size(idx)
    text(Subx(idx(i)),pks(i)+1+mod(i,2),num2str(Subx(idx(i))),"fontsize",9);
  endfor
  %text (Sub, 0.7, "arbitrary text");
  xlabel("Wavelength (nm)");
  ylabel("Reflectance % ");
  %[filepath,name,ext] = fileparts(filename);
  printname=filename(1:(size(filename)(2)-4));
  title({"UV-Vis-NIR";printname});
  print(h,printname,"-dpng");
endfunction
