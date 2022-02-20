
del cscope.files cscope.out

rem *.inc *.def
where /r "%CD%" *.c *.cpp *.cc *.h *.hpp > cscope.files

cscope -i cscope.files

