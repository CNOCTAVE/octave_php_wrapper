## Copyright (C) 2024-2025 Yu Hongbo <yuhongbo@member.fsf.org>, 
##                    CNOCTAVE <cnoctave@qq.com>
##
## This program is free software; you can redistribute it and/or modify it under
## the terms of the GNU General Public License as published by the Free Software
## Foundation; either version 3 of the License, or (at your option) any later
## version.
##
## This program is distributed in the hope that it will be useful, but WITHOUT
## ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
## FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
## details.
##
## You should have received a copy of the GNU General Public License along with
## this program; if not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {} create_php_wrapper (@var{filename}, @var{file_path}='', 
##                                      @var{force_overwrite}=false)  
## Create a PHP wrapper for Octave script, 
## so that you can run the Octave script by PHP, 
## like modern Internet service.  
## @example
## param: filename, file_path, force_overwrite
##
## return: php_wrapper_string
## @end example
##
## @end deftypefn
function php_wrapper_string = create_php_wrapper(filename, file_path='', force_overwrite=false)
    if nargin < 1
        print_usage();
    endif
    if (ischar(filename) != 1)
        error('Filename must be a string.');
    endif
    if (length(filename) == 0)
        error('Filename must not be empty.');
    endif
    if (ischar(file_path) != 1)
        error('File path must be a string.');
    endif
    if (isbool(force_overwrite) != 1)
        error('Force overwrite must be a boolean.');
    endif
    if (length(file_path) != 0)
        chdir(file_path);
    endif
    php_wrapper_string = gen_php_wrapper_string(filename);
    php_filename = strjoin({filename, '.php'}, "");
    if (force_overwrite == false && exist(php_filename, 'file') == 2)
        error('File already exists. Use force_overwrite=true to overwrite.');
    endif
    unwind_protect
        fid = fopen(php_filename, 'w');
        if (fid == -1) 
            error('Could not open file for writing.');
        endif
        fwrite(fid, php_wrapper_string);
    unwind_protect_cleanup
        if (fid != -1)
            fclose(fid);
        endif
    end_unwind_protect
endfunction