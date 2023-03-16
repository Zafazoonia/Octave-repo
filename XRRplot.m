function xrr(filename, lwr=0, upr=10.0)
  M=dlmread(filename);
  Sub=M(:,1);
  L=find(Sub==lwr);
  U=find(Sub==upr);
  %U=size(M)(1)-2;
  %U=551;
  Subx=M(L:U,1);
  Suby0=M(L:U,2);
  Suby1=M(L:U,3);
  Suby=((Suby0.*Suby1));
  h=figure("visible","on");
  %dx = Subx(2)-Subx(1);



  subplot(2,1,1);
semilogy(Subx,Suby);
 subplot(2,1,2);
 SubFFT=abs(fft(Suby));
  [pks idx] = findpeaks(SubFFT,"MinPeakDistance",10);
  k=1:1:size(SubFFT)(1);
 plot(k',SubFFT,k'(idx),SubFFT(idx),"xm");
  %plot(k',SubFFT);
  for i=1:size(idx)
    text(k'(idx(i)),pks(i),num2str(k'(idx(i))),"fontsize",9);
  endfor
  %text (Sub, 0.7, "arbitrary text");
  xlabel("2-theta (degrees)");
  ylabel("Intensity (counts) ");
  %[filepath,name,ext] = fileparts(filename);
  printname=filename(1:(size(filename)(2)-4));
  title({"XRD";printname});
  print(h,printname,"-dpng");
endfunction
