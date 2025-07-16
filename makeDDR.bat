@ECHO off
DEL _IMPORT\*.tdb
DEL _TDB\*.tdb
REN _Transcendence.tdb Transcendence.tdb
IF NOT EXIST _TDB (MD _TDB)
ECHO "========================================================================"
ECHO "===========================       Lib      ============================="
ECHO "========================================================================"
TransCompiler.exe /input:DDR_Library.xml /output:_TDB/DDR_Library.tdb
ECHO "========================================================================"
ECHO "===========================    Extension    ============================"
ECHO "========================================================================"
TransCompiler.exe /input:DDR_Extension.xml /output:_TDB/DDR_Extension.tdb /entities:_TDB/DDR_Library.tdb
ECHO "========================================================================"
ECHO "===========================  Demo Extension ============================"
ECHO "========================================================================"
TransCompiler.exe /input:DDR_Demo_Extension.xml /output:_TDB/DDR_Demo_Extension.tdb /entities:_TDB/DDR_Library.tdb
ECHO "========================================================================"
ECHO "===========================     Cleanup    ============================="
ECHO "========================================================================"
REN Transcendence.tdb _Transcendence.tdb
@ECHO on