function raman(filename)
  M=dlmread(filename);
  L=35;
  U=size(M)(1);
  Subx=M(L:U,1);
  Suby=abs(M(L:U,2));
  h=figure("visible","off");
  dx = Subx(2)-Subx(1);
  %smoothy=smooth2(Suby);
 [pks idx] = findpeaks(Suby,"MinPeakDistance",20);
  plot(Subx,Suby,Subx(idx),Suby(idx),"xm");
  for i=1:size(idx)
    text(Subx(idx(i))+mod(i,2),pks(i)+1+mod(i*10,20),num2str(Subx(idx(i))),"fontsize",5);
  endfor
  %text (Sub, 0.7, "arbitrary text");
  xlabel("Raman shift (cm-1)");
  ylabel("Intensity ");
  %[filepath,name,ext] = fileparts(filename);
  printname=filename(1:(size(filename)(2)-4));
  title({"Raman Spectra 532nm";printname});
  print(h,printname,"-dpng","-landscape");
endfunction
