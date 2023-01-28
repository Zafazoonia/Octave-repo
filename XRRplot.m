function XRRPlotter(filename)
  M=dlmread(filename);
  for i=1:size(M)(1)
    if M(i,1)>0
      break;
    endif
  endfor
  L=i;
  U=size(M)(1);
  Sub=M(L:U,1:3);
  subx=Sub(:,1);
  suby=Sub(:,2).*Sub(:,3);
  f=figure();
  semilogy(subx,suby);
  xlabel("2theta");
  ylabel("Intensity");
  print (f, filename, "-dpng");

endfunction
