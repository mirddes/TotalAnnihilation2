@echo off
echo WARNING    this will rebuild ALL of the unit .fbi files from    WARNING
echo WARNING    allunits.xls.  Makesure allunits.xls contains        WARNING
echo WARNING    up-to-date unit information before doing this!       WARNING
echo.
echo old fbi files will be saved in the "backup" directory.
echo.
echo Press control-C to abort, any other key to continue...
echo.
pause
echo on
move /y *.fbi backup
perl xls2fbi.pl

