echo off
rem vimrc install script for Windows 10 or above
rem (on Windows 7 sort.exe and curl.exe need to be installed manually)
rem
rem Prerequisites:
rem gvim, 7zip
rem Windows 10 or above
rem %HOME% has be set to C:\Users\{your windows user directory}
rem


if not exist C:\"Program Files"\7-Zip\7z.exe (
  echo PLEASE INSTALL 7Z INTO C:\"PROGRAM FILES"\7-ZIP
  goto quit
  )

rem Check if this batch file runs under vimrc directory
if not exist .vimrc        goto quit
if not exist .cncpp.vimrc  goto quit
if not exist .system.vimrc goto quit
if not exist mkctags.sh   goto quit
if not exist mkcscope.sh  goto quit
if not exist rmtags.sh    goto quit

rem accessible %HOME% is needed
rem recommeded %HOME% is C:\Users\{your windows user directory}
if not exist "%HOME%" goto quit

rem Removing previously installed links
if exist %HOME%\.vimrc        del %HOME%\.vimrc
if exist %HOME%\.cncpp.vimrc  del %HOME%\.cncpp.vimrc
if exist %HOME%\.system.vimrc del %HOME%\.system.vimrc

rem Removing previously installed directory .vim
if exist %HOME%\.vim rd /S /Q %HOME%\.vim

rem *COPYING* .vimrc files
echo F | xcopy .vimrc        /A /Y %HOME%\.vimrc
echo F | xcopy .cncpp.vimrc  /A /Y %HOME%\.cncpp.vimrc
echo F | xcopy .system.vimrc /A /Y %HOME%\.system.vimrc

rem Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git %HOME%/.vim/bundle/Vundle.vim


rem Removing previously installed directory .vim_tools
if exist %HOME%\.vim_tools rd /S /Q %HOME%\.vim_tools
mkdir %HOME%\.vim_tools
echo F | xcopy mkctags.bat /A /Y  %HOME%\.vim_tools\mkctags.bat
echo F | xcopy mkcscope.bat /A /Y %HOME%\.vim_tools\mkcscope.bat
echo F | xcopy rmtags.bat /A /Y   %HOME%\.vim_tools\rmtags.bat

rem curl -o %HOME%\.vim_tools\cscope-15.8a-win32rev1-static.zip https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/cscope-win32/cscope-15.8a-win32rev1-static.zip
curl -o %HOME%\.vim_tools\cscope-15.8a-win64rev1-static.zip https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/cscope-win32/cscope-15.8a-win64rev1-static.zip
if not exist "%HOME%\.vim_tools\cscope-15.8a-win64rev1-static.zip" (
  echo DOWNLOADING OF CSCOPE HAS BEEN FAILED!
  goto quit
  )
C:\"Program Files"\7-Zip\7z x C:\Users\hum\.vim_tools\cscope-15.8a-win64rev1-static.zip -oC:\Users\hum\.vim_tools
if not exist C:\Users\hum\.vim_tools\cscope.exe (
  echo UNZIPPING CSCOPE HAS BEEN FAILED!
  goto quit
  )

curl -o %HOME%\.vim_tools\ctags58.zip https://jaist.dl.sourceforge.net/project/ctags/ctags/5.8/ctags58.zip?viasf=1
if not exist "%HOME%\.vim_tools\ctags58.zip" (
  echo DOWNLOADING OF CTAGS HAS BEEN FAILED!
  goto quit
  )
C:\"Program Files"\7-Zip\7z x %HOME%\.vim_tools\ctags58.zip -oC:\Users\hum\.vim_tools
if not exist C:\Users\hum\.vim_tools\ctags58 (
  echo UNZIPPING CTAGS HAS BEEN FAILED!
  goto quit
  )
echo F | xcopy %HOME%\.vim_tools\ctags58\ctags.exe %HOME%\.vim_tools\ctags.exe
if not exist C:\Users\hum\.vim_tools\ctags.exe (
  echo COPYING CTAGS HAS BEEN FAILED!
  goto quit
  )

echo I
echo I
echo I
echo ==============================================
echo INSTALLING VIMRC HAS BEEN COMPLETED!!!
echo I
echo I
echo Now you need to :
echo 1. Open vim and :PluginInstall yourself!
echo 2. Add %HOME%\.vim_tools to your PATH
echo ==============================================
echo I
echo I
echo I

exit /B

:quit
echo run this batch file under vimrc directory
echo variable HOME has to be set

