function batchpros(dir,extension)
   filelist=readdir(dir);
   for i =3:numel(filelist)
   [filepath,name,ext] = fileparts(filelist{i});
    if (strcmp(ext,extension))
      uvis(filelist{i});
    endif
   endfor
endfunction
