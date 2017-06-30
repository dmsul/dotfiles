REM Set up working environment. <Install Vim and python first!>
cd %HOMEPATH%
SET DOTS=%HOMEPATH%\proj\dotfiles

REM git bash
mklink .bashrc %DOTS%\git.bashrc

REM git config
mklink .gitconfig %DOTS%\.gitconfig
mklink .gitignore_global %DOTS%\.gitignore_global

REM Vim
mklink _vimrc %DOTS%\_vimrc
setx /M PATH "C:\Program Files\Vim\vim80;%PATH%"
REM Vim-plug (plugin manager, will download the rest, requires git)
if not exist "vimfiles/autoload" mkdir "vimfiles/autoload"
Powershell.exe -executionpolicy remotesigned -File %DOTS%\env_scripts\get_vimplug.ps1
REM SumatraPDF in PATH
setx /M PATH "%PATH%;C:\Program Files\SumatraPDF"

REM Latex
mklink .latexmkrc %DOTS%\.latexmkrc

REM Python
if not exist ".\.ipython" ipython profile create
mklink .ipython\profile_default\ipython_config.py "%DOTS%\ipython_config.py"
mklink matplotlibrc %DOTS%\matplotlibrc

REM C compiler batch file
REM $vcvarscommand = "\"c:\users\daniel\appdata\local\Programs\Common\Microsoft\Visual C++ for Python\9.0\vcvarsall.bat\" x64"
REM $vcvarscommand | Out-File vcvarsall.bat

REM ConEmu RC? TODO

REM Misc.
mklink .jrnl_config %DOTS%\.jrnl_config
