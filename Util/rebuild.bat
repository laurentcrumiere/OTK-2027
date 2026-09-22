@echo off
if %1. == . goto usage
if %2. == . goto usage
    if not exist %2.db goto ok1
	echo Database %2 exists.
	echo You must "dberase" it first.
	goto done
    :ok1
    if not exist unload\*.* goto ok2
	echo Directory UNLOAD exists, but is needed for rebuilding.
	echo You must remove it first.
	goto done
    :ok2
    mkdir unload
    set pwd=%3
    if %pwd%. == . set pwd=sql
    C:\SQLANY50\WIN32\dbunload -c "uid=dba;pwd=%pwd%;dbf=%1" -u unload
    set pwd=
    C:\SQLANY50\WIN32\dbinit %2 -p 4096 
    C:\SQLANY50\WIN32\isql -c "uid=dba;pwd=sql;dbf=%2;dbs=-q" read reload.sql
    goto done
:usage
    echo Usage: rebuild {olddb} {newdb} [{dba-password}]
    echo        Unloads "{olddb}.db", then creates "{newdb}.db".
    echo        Do not specify ".db" in the database names.
    goto done
:done
