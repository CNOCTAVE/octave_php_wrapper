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
        text_cell = {
            "<?php",
            "if (isset($_POST['n'])) {",
            "    $n = $_POST['n'];",
            "    echo escapeshellarg($n);",
            "} else {",
            "    echo \"Param n should not be null.\";",
            "}",
            "?>",
        };
    elseif strcmp(name, "pass_args_put") == 1
        text_cell = {
            "<?php",
            "if ($_SERVER['REQUEST_METHOD'] === 'PUT') {",
            "    $n = file_get_contents('php://input');",
            "    echo escapeshellarg($n);",
            "} else {",
            "    echo \"This script only handles PUT requests.\";",
            "}",
            "?>",
        };
    elseif strcmp(name, "pass_args_patch") == 1
        text_cell = {
            "<?php",
            "if ($_SERVER['REQUEST_METHOD'] === 'PATCH') {",
            "    $n = file_get_contents('php://input');",
            "    echo escapeshellarg($n);",
            "} else {",
            "    echo \"This script only handles PATCH requests.\";",
            "}",
            "?>",
        };
    elseif strcmp(name, "pass_args_delete") == 1
        text_cell = {
            "<?php",
            "if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {",
            "    parse_str($_SERVER['QUERY_STRING'], $queryParams);",
            "    if (isset($queryParams['n'])) {",
            "        $n = $queryParams['n'];",
            "        echo escapeshellarg($n);",
            "} else {",
            "        echo \"Param n should not be null.\";",
            "    }",
            "} else {",
            "    echo \"This script only handles DELETE requests.\";",
            "}",
            "?>",
        };
    elseif strcmp(name, "jsondecode") == 1
        text_cell = {
            "args = argv();",
            "n = jsondecode(args(1));",
            "disp(sum(n));",
        };
    elseif strcmp(name, "jsonencode") == 1
        text_cell = {
            "n = [1,2,3,4,5,6,7];",
            "disp(jsonencode(n));",
        };
    elseif strcmp(name, "base64_decode") == 1
        text_cell = {
            "args = argv();",
            "n = base64_decode(args(1));",
            "disp(sum(n));",
        };
    elseif strcmp(name, "base64_encode") == 1
        text_cell = {
            "n = [1,2,3,4,5,6,7];",
            "disp(base64_encode(n));",
        };
    elseif strcmp(name, "upload_file") == 1
        text_cell = {
            "<?php",
            "if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_FILES['fileToUpload']) && $_FILES['fileToUpload']['error'] == UPLOAD_ERR_OK) {",
            "    $fileTmpPath = $_FILES['fileToUpload']['tmp_name'];",
            "    $fileName = $_FILES['fileToUpload']['name'];",
            "    $fileSize = $_FILES['fileToUpload']['size'];",
            "    $fileType = $_FILES['fileToUpload']['type'];",
            "    $fileNameCmps = explode(\".\", $fileName);",
            "    $fileExtension = strtolower(end($fileNameCmps));",
            "    $allowedfileExtensions = array('jpg', 'jpeg', 'png', 'gif');",
            "    if (in_array($fileExtension, $allowedfileExtensions)) {",
            "        $uploadFileDir = 'uploads/';",
            "        if (!is_dir($uploadFileDir)) {",
            "            mkdir($uploadFileDir, 0777, true);",
            "        }",
            "        $dest_path = $uploadFileDir . $fileName;",
            "        if(move_uploaded_file($fileTmpPath, $dest_path)) {",
            "            echo \"File is valid and was successfully uploaded.\n\";",
            "        } else {",
            "            echo \"There was some error moving the file to upload directory. Please make sure the upload directory is writable.\";",
            "        }",
            "    } else {",
            "        echo \"Sorry, only JPG, JPEG, PNG & GIF files are allowed.\";",
            "    }",
            "} else {",
            "    echo \"No file was uploaded. Sorry, your file was not uploaded.\";",
            "}",
            "?>",
        };
    elseif strcmp(name, "download_file") == 1
        text_cell = {
            "<?php",
            "$filePath = 'path/to/your/file.zip';",
            "if (!file_exists($filePath)) {",
            "    die('File not found');",
            "}",
            "$fileSize = filesize($filePath);",
            "header('Content-Description: File Transfer');",
            "header('Content-Type: application/octet-stream');",
            "header('Content-Disposition: attachment; filename=\"' . basename($filePath) . '\"');",
            "header('Content-Transfer-Encoding: binary');",
            "header('Expires: 0');",
            "header('Cache-Control: must-revalidate');",
            "header('Pragma: public');",
            "header('Content-Length: ' . $fileSize);",
            "ob_clean();",
            "flush();",
            "readfile($filePath);",
            "exit;",
            "?>",
        };
    else
        error('name must be one of the supported examples.');
    endif
    octave_php_wrapper_example_string = strjoin(text_cell, "\n");
endfunction