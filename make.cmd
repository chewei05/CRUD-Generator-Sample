@ECHO OFF

:BEGIN
CD crud
CALL make %1 %2 %3 %4 %5 %6 %7 %8 %9
CD ..
GOTO END

:END