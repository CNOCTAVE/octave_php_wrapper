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
## @deftypefn {} {} octave_php_wrapper_examples (@var{name})  
## Get octave_php_wrapper examples.  
## Support examples:
## name | description
## -----------------------------------------------------------------------------
## pass_args_get | Pass arguments with GET method.
## pass_args_post | Pass arguments with POST method.
## pass_args_put | Pass arguments with PUT method.
## pass_args_patch | Pass arguments with PATCH method.
## pass_args_delete | Pass arguments with DELETE method.
## jsondecode | Pass arguments with jsondecode.
## jsonencode | Pass arguments with jsonencode.
## base64_decode | Pass arguments with base64_decode.
## base64_encode | Pass arguments with base64_encode.
## upload_file | Pass arguments with upload_file.
## download_file | Pass arguments with download_file.
## @example
## param: name
##
## return: octave_php_wrapper_example_string
## @end example
##
## @end deftypefn
function octave_php_wrapper_example_string = octave_php_wrapper_examples(name)
    if nargin < 1
        print_usage();
    endif
    if (ischar(name) != 1)
        error('name must be a string.');
    endif
    if strcmp(name, "pass_args_get") == 1
        text_cell = {
            "<?php",
            "if (isset($_GET['n'])) {",
            "    $n = $_GET['n'];",
            "    echo escapeshellarg($n);",
            "} else {",
            "    echo \"Param n should not be null.\";",
            "}",
            "?>",
        };
    elseif strcmp(name, "pass_args_post") == 1
        octave_php_wrapper_example_string = pass_args_post();
    elseif strcmp(name, "pass_args_put") == 1
        octave_php_wrapper_example_string = pass_args_put();
    elseif strcmp(name, "pass_args_patch") == 1
        octave_php_wrapper_example_string = pass_args_patch();
    elseif strcmp(name, "pass_args_delete") == 1
        octave_php_wrapper_example_string = pass_args_delete();
    elseif strcmp(name, "jsondecode") == 1
        octave_php_wrapper_example_string = jsondecode();
    elseif strcmp(name, "jsonencode") == 1
        octave_php_wrapper_example_string = jsonencode();
    elseif strcmp(name, "base64_decode") == 1
        octave_php_wrapper_example_string = base64_decode();
    elseif strcmp(name, "base64_encode") == 1
        octave_php_wrapper_example_string = base64_encode();
    elseif strcmp(name, "upload_file") == 1
        octave_php_wrapper_example_string = upload_file();
    elseif strcmp(name, "download_file") == 1
        octave_php_wrapper_example_string = download_file();
    else
        error('name must be one of the supported examples.');
    octave_php_wrapper_example_string = strjoin(text_cell, "\n");
endfunction