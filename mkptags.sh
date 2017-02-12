#!/bin/sh

rm -rf tags

ctags --langmap=C++:+.inc+.def \
      --c++-kinds=+p \
      --fields=+iaS \
      --extra=+fq \
      --sort=foldcase \
      -R . \
      -h ".php" \
      --PHP-kinds=+cf \
      --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
      --regex-PHP='/interface ([^ ]*)/\1/c/' \
      --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'

