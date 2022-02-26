let g:gcpp_headers_path=
\system("g++ --version | grep g++ | awk '{print \"/usr/include/c++/\"$NF}'")

execute 'set path+=' . g:gcpp_headers_path

