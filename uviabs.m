function uviabs(filename,t=1e-5)
  M=dlmread(filename);
   %N=dlmread("Baseline.asc");
  L=95;
  %Ln=220;
  U=size(M)(1);
  Subx=M(L:U,1);
  Suby=M(L:U,2);
  %Subxn=N(Ln:U,1);
  %Subyn=N(Ln:U,2);
  h=figure("visible","on");
  %Suby=Suby./Subyn;
  %Fr=(1-Suby./100).^2./(2*Suby);
  %hbar=6.626e-34;
  %c=299792458;
  %hv=(1e9*hbar*c/1.602e-19)./Subx;
  Eg=1239.9655587428./Subx;
  alpha=(2.303/t)*Suby;
  alphaEg=(alpha.*Eg).^(0.5);
  %dx = Subx(2)-Subx(1);
 %[pks idx] = findpeaks(Suby,"MinPeakDistance",6);
  %plot(hv,Frhv);
  plot(Eg,alphaEg);%,Subx(idx),Suby(idx),"xm");
  %for i=1:size(idx)
  %  text(Subx(idx(i)),pks(i)+1+mod(i,2),num2str(Subx(idx(i))),"fontsize",9);
  %endfor
  %text (Sub, 0.7, "arbitrary text");
  xlabel("Eg (eV)");
  ylabel("alphahv (cm-1)");
  %[filepath,name,ext] = fileparts(filename);
  printname=filename(1:(size(filename)(2)-4));
  title({"UV-Vis-NIR";"Tauc Plot";printname});
  print(h,printname,"-dpng");
endfunction
