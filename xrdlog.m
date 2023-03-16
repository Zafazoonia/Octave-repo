function xrdlog(filename)
  M=dlmread(filename);
  L=351;
  U=size(M)(1)-2;
  Subx=M(L:U,1);
  Suby0=M(L:U,2);
  Suby1=M(L:U,3);
  Suby=((Suby0.*Suby1));
  h=figure("visible","on");
  %dx = Subx(2)-Subx(1);
 [pks idx] = findpeaks(Suby,"MinPeakDistance",300);
  semilogy(Subx,Suby,Subx(idx),Suby(idx),"xm");
  for i=1:size(idx)
    text(Subx(idx(i)),pks(i)+1+mod(i,2),num2str(Subx(idx(i))),"fontsize",9);
  endfor
  %text (Sub, 0.7, "arbitrary text");
  xlabel("2-theta (degrees)");
  ylabel("Intensity (counts) ");
  %[filepath,name,ext] = fileparts(filename);
  printname=filename(1:(size(filename)(2)-4));
  title({"XRD";printname});
  print(h,printname,"-dpng");
endfunction
