function plotter(filename)
  M=dlmread(filename);
  for i=1:size(M)(1)
    if M(i,1)>0
      break;
    endif
  endfor
  L=i;
  U=size(M)(1);
  Sub=M(L:U,1:2);
` subx=Sub(:,1);
  suby=Sub(:,2);
  plot(subx,suby);
  xlabel("2theta");
  ylabel("Intensity");
  
endfunction
