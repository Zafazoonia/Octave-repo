function XRDplotComp(filename,filename2)
M=dlmread(filename);
N=dlmread(filename2);
L2=find(N(:,1)==10);
U2=find(N(:,1)==90);
L=find(M,1);
U=find(M(:,1),1,'last');
X=M(L:U,1);
Y=M(L:U,2).*M(L:U,3);
X2=N(L2:U2,1);
Y2=N(L2:U2,2)*max(Y)/100;
h=figure("visible","on");
%dx = X(2)-X(1);
[pks idx] = findpeaks(Y,"MinPeakDistance",300);

if (max(Y)<10000)
plot(X,Y,1);
hold on;
plot(X2,Y2,'r');
scatter(X(idx),Y(idx),"xm");
elseif
semilogy(X,Y,X(idx),Y(idx),"xm");
hold on;
plot(X2,Y2,'r');
endif
  %plot(Subx,Suby,Subx(idx),Suby(idx),"xm");
 for i=1:size(idx)(1)
   text(X(idx(i)),pks(i)+1+mod(i,2),num2str(X(idx(i))),"fontsize",9);
 endfor
 %text (Sub, 0.7, "arbitrary text");
 xlabel("2-theta (degrees)");
 ylabel("Intensity (counts) ");
 %[filepath,name,ext] = fileparts(filename);
 printname=strcat(filename(1:(size(filename)(2)-4)),filename2(1:(size(filename2)(2)-3)));
 title({"XRD";printname});
 print(h,printname,"-dpng");
endfunction
