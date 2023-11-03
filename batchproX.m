function batchproX(dir,extension)
   filelist=readdir(dir);
   for i =3:numel(filelist)
   if isfolder(strcat(dir,'/',filelist{i}))
     batchproX(strcat(dir,'/',filelist{i}),extension)
   else
   [filepath,name,ext] = fileparts(filelist{i});
    if (strcmp(ext,extension))
      XRDplotter(strcat(dir,'/',filelist{i}));
    endif
   endif
   endfor
endfunction


