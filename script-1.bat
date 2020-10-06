chcp 866
@echo off
echo -Способ как снять блокировку и ограничение на раздачу от оператора МТС на 1 интернет сессию,
echo -Отключить ipv6 в личном кабинете МТС, в настроке APN, в настройке сети ПК,
echo -Способ основывается на найденой дырке в алгоритме новых ограничений МТС,
echo -Т.к. снимается ttl=1 на входящие и шейп в 1мБит при активации бесплатного пакета,
echo -разрешенной раздачи (должен быть по тарифу), способ работает,при отмене фиксации  на доноре, 
echo -И один TTL у всех реципиентах в локальной сети 65 или 129,
echo -Заменой на пк значения TTL 64 или 128, и т.к. шейп и блокировка снимается,
echo -Сразу возвращаем ttl=65 или 129 и продолжаем юзать интернет без проблем,
echo -Ваш донор должен быть подключен к интернету, расфиксирован и раздавать интернет на этот пк ,
echo -В момент блокировки или шейпа не выключая интернет на доноре, примените ttl=64 или 128
echo -Теперь вам надо активировать бесплатную раздачу открыв любую страничку в интернете
echo -Не увлекаемся)) затем снова применяете ttl=65 или 129 пользуемся!,
echo -Так же добавлен способ "кидания косточки МТС" с помощью пинга с ttl=64,
echo -------------благодарности в репу приветствуются-------------
echo.
echo.
:g_menu
echo Пинг или TTL
echo Пинг 8.8.8.8 с TTL=64 - 1
echo Смена TTL - 2
echo Завершение работы - 0
set /p m=""
if %m%==1 (ping 8.8.8.8 -n 5 -i 64
echo.
echo -----------------------------------------------------------
echo Проверьте интернет, если бесполезно запустите скрипт вновь,
echo повторите попытку или измените в системе на значение TTL=64 
echo -----------------------------------------------------------
pause
goto :g_menu)
if %m%==2 goto :r_menu 
if %m%==0 goto :eof
echo Вы нажали цифру, соответствующую Вашему выбору?
goto :g_menu
echo.
echo.
:r_menu
echo Выберите что сделать с TTL
echo ----------------------------------
echo Применить TTL-64 - 1
echo Применить TTL-65 - 2
echo Применить TTL-128 (по умолчанию)- 3
echo Применить TTL-129 - 4
echo Запустить автоматический сценарий 64-ya.ru-65 - 5
echo Запустить автоматический сценарий 128-ya.ru-129 - 6
echo Вернуться в предыдущее меню - 7
echo Завершение работы - 0
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
echo Вы нажали цифру, соответствующую Вашему выбору?
goto :r_menu
echo.
echo.
echo.
echo.
:ex
echo.
echo Выход
echo.
pause
exit