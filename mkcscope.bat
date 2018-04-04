
del cscope.files cscope.out

where /r %CD% *.c *.cpp *.cc *.h *.hpp *.java *.s *.S *.inc *.def > cscope.files

cscope -i cscope.files

