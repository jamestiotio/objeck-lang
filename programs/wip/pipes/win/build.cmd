@echo off
cls
del /y *.obj *.exe

cl win_client.cpp /EHsc
cl win_client_test.cpp /EHsc

cl win_server.cpp /EHsc