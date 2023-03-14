function absr(filename)
  M=dlmread(filename);
  L=72;
  h=6.626e-34;
  c=3e8;
eV=1.6e-19;

  U=size(M)(1);
  Subx=M(L:U,1);
  Suby=190-M(L:U,2);
  a=log((1-Suby.^2)/0.1);
  Ex=(h*c*1e9/eV)./Subx;
  acoeff=(a.*Ex).^(2);
  h=figure("visible","on");
  dx = Subx(2)-Subx(1);
 [pks idx] = findpeaks(Suby,"MinPeakDistance",6);
  plot(Ex,acoeff,Ex(idx),acoeff(idx),"xm");
  for i=1:size(idx)
    text(Ex(idx(i)),pks(i)+1+mod(i,2),num2str(Ex(idx(i))),"fontsize",9);
  endfor
  %text (Sub, 0.7, "arbitrary text");
  xlabel("Energy (eV)");
  ylabel("I - Reflectance % ");
  %[filepath,name,ext] = fileparts(filename);
  printname=filename(1:(size(filename)(2)-4));
  title({"UV-Vis-NIR";printname});
  print(h,printname,"-dpng");
endfunction
