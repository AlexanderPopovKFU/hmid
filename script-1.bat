chcp 866
@echo off
echo -���ᮡ ��� ���� �����஢�� � ��࠭�祭�� �� ࠧ���� �� ������ ��� �� 1 ���୥� ����,
echo -�⪫���� ipv6 � ��筮� ������� ���, � ����ப� APN, � ����ன�� �� ��,
echo -���ᮡ �᭮�뢠���� �� �������� ��થ � �����⬥ ����� ��࠭�祭�� ���,
echo -�.�. ᭨������ ttl=1 �� �室�騥 � 襩� � 1���� �� ��⨢�樨 ��ᯫ�⭮�� �����,
echo -ࠧ�襭��� ࠧ��� (������ ���� �� ����), ᯮᮡ ࠡ�⠥�,�� �⬥�� 䨪�樨  �� �����, 
echo -� ���� TTL � ��� �樯����� � �����쭮� �� 65 ��� 129,
echo -������� �� �� ���祭�� TTL 64 ��� 128, � �.�. 襩� � �����஢�� ᭨������,
echo -�ࠧ� �����頥� ttl=65 ��� 129 � �த������ �� ���୥� ��� �஡���,
echo -��� ����� ������ ���� ������祭 � ���୥��, ��䨪�஢�� � ࠧ������ ���୥� �� ��� �� ,
echo -� ������ �����஢�� ��� 襩�� �� �몫��� ���୥� �� �����, �ਬ���� ttl=64 ��� 128
echo -������ ��� ���� ��⨢�஢��� ��ᯫ���� ࠧ���� ���� ���� ��࠭��� � ���୥�
echo -�� 㢫�������)) ��⥬ ᭮�� �ਬ���� ttl=65 ��� 129 ����㥬��!,
echo -��� �� �������� ᯮᮡ "������� ����窨 ���" � ������� ����� � ttl=64,
echo -------------�������୮�� � ९� �ਢ���������-------------
echo.
echo.
:g_menu
echo ���� ��� TTL
echo ���� 8.8.8.8 � TTL=64 - 1
echo ����� TTL - 2
echo �����襭�� ࠡ��� - 0
set /p m=""
if %m%==1 (ping 8.8.8.8 -n 5 -i 64
echo.
echo -----------------------------------------------------------
echo �஢���� ���୥�, �᫨ ��ᯮ����� ������� �ਯ� �����,
echo ������ ������ ��� ������� � ��⥬� �� ���祭�� TTL=64 
echo -----------------------------------------------------------
pause
goto :g_menu)
if %m%==2 goto :r_menu 
if %m%==0 goto :eof
echo �� ������ ����, ᮮ⢥�������� ��襬� �롮��?
goto :g_menu
echo.
echo.
:r_menu
echo �롥�� �� ᤥ���� � TTL
echo ----------------------------------
echo �ਬ����� TTL-64 - 1
echo �ਬ����� TTL-65 - 2
echo �ਬ����� TTL-128 (�� 㬮�砭��)- 3
echo �ਬ����� TTL-129 - 4
echo �������� ��⮬���᪨� �業�਩ 64-ya.ru-65 - 5
echo �������� ��⮬���᪨� �業�਩ 128-ya.ru-129 - 6
echo �������� � �।��饥 ���� - 7
echo �����襭�� ࠡ��� - 0
echo ----------------------------------
set /p m=""
 if %m%==1 (netsh int ipv4 set glob defaultcurhoplimit=64
start http://ya.ru
goto :ex)
 if %m%==2 (netsh int ipv4 set glob defaultcurhoplimit=65
goto :ex)
 if %m%==3 (netsh int ipv4 set glob defaultcurhoplimit=128
start http://ya.ru
goto :ex)
 if %m%==4 (netsh int ipv4 set glob defaultcurhoplimit=129
goto :ex)
 if %m%==5 (netsh int ipv4 set glob defaultcurhoplimit=64
start http://ya.ru
ping 127.0.0.1 -n 4
netsh int ipv4 set glob defaultcurhoplimit=65
goto :ex)
 if %m%==6 (netsh int ipv4 set glob defaultcurhoplimit=128
start http://ya.ru
ping 127.0.0.1 -n 4
netsh int ipv4 set glob defaultcurhoplimit=129
goto :ex)
if %m%==7 goto :g_menu
if %m%==0 goto :eof
echo �� ������ ����, ᮮ⢥�������� ��襬� �롮��?
goto :r_menu
echo.
echo.
echo.
echo.
:ex
echo.
echo ��室
echo.
pause
exit