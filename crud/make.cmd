@ECHO OFF

:INITIAL
:: �iModel name�j�ݭn�j�g�B��ơB�m�p���R�W�B���γs�r���A�i�ɦW�j���ƼơB��r���u�Ϲj
SET Model_Name=NewsCatlog
SET File_Name=news_catlogs
:: ���n�ɤ~�]�w Options
SET Options=--indexes=""
:: ���n�ɤ~�]�w Foreign Keys
SET ForeignKeys=--foreign-keys=""
SET Route=yes
SET Localize=yes
SET Locales=zh-TW
:INITIAL
SET Key=""
SET ExtOpt=""

:ARTISAN
IF EXIST "artisan" SET ArtisanPath=
IF EXIST "..\artisan" SET ArtisanPath=..


:ALERT1
SET /P Key=Are you sure to create CRUD - [%Model_Name%]? (Y/n)
IF %Key%==""  GOTO ALERT2
IF %Key%==y GOTO ALERT2
IF %Key%==Y GOTO ALERT2
IF %Key%==n GOTO EXIT
IF %Key%==N GOTO EXIT
GOTO EXIT

:ALERT2
SET /P Key=Do you want to use Options? (Y/n)
IF %Key%==""  GOTO BEGIN
IF %Key%==y GOTO BEGIN
IF %Key%==Y GOTO BEGIN
IF %Key%==n GOTO RUN
IF %Key%==N GOTO RUN
GOTO RUN

:BEGIN
SET ExtOpt=%Options%

:RUN
IF "%ArtisanPath%"==".." SET ArtisanPath=%ArtisanPath%\
php %ArtisanPath%artisan crud:generate %Model_Name% --fields_from_file="%File_Name%.json" --view-path=admin --controller-namespace=Admin --route-group=admin --route=%Route% --localize=%Localize% --locales=%Locales% %ExtOpt% %ForeignKeys%

:EXIT
