
del tags

rem --langmap=C++:+.inc+.def

ctags --c++-kinds=+p --fields=+iaS --extra=+fq --language-force=C++ ^
--sort=foldcase --links=no -R .
