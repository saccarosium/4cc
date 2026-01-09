@echo off

REM Make sure we are in the directory of the script
cd "%~dp0"

set src_path=%cd%\code
set custom_path=%src_path%\custom

set opts=/nologo /FC /Zi /utf-8 /I%src_path% /I%custom_path%

pushd %src_path%
call cl %opts% %src_path%\build.cpp /Febuild /link /INCREMENTAL:NO && build %*
popd
