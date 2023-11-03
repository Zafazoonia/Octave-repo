function XRDplotter(filename)
M=dlmread(filename);
L=find(M,1);
U=find(M(:,1),1,'last');
X=M(L:U,1);
Y=M(L:U,2).*M(L:U,3);

h=figure("visible","on");
%dx = X(2)-X(1);
[pks idx] = findpeaks(Y,"MinPeakDistance",300);
data=[pks X(idx)];
if (max(Y)<10000)
plot(X,Y,1);
hold on;
scatter(X(idx),Y(idx),"xm");
elseif
semilogy(X,Y,X(idx),Y(idx),"xm");
endif
  %plot(Subx,Suby,Subx(idx),Suby(idx),"xm");
 for i=1:size(idx)(1)
   text(X(idx(i)),pks(i)+1+mod(i,2),num2str(X(idx(i))),"fontsize",9);
 endfor
 %text (Sub, 0.7, "arbitrary text");
 xlabel("2-theta (degrees)");
 ylabel("Intensity (counts) ");
 %[filepath,name,ext] = fileparts(filename);
 printname=filename(1:(size(filename)(2)-4));
 title({"XRD";printname});
 print(h,printname,"-dpng");
 csvname=strcat(printname,'peak-data.csv');
dlmwrite(csvname, data);

endfunction
