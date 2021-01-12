#/bin/bash
# Запуск скрипта настроен в cron
echo "Переходим в папку записей"
DIR="/var/spool/asterisk/monitor"
cd $DIR
echo "Текущий год"
CURYEAR=`date +%G`
echo $CURYEAR
let "CURYEAR -=1"
if [[ -d "$CURYEAR" ]]
then
    echo 'Удаляем прошлогодние записи: '
    rm -rf $CURYEAR
    echo 'Удалено!'
else 
    echo 'Прошлогодние записи уже удалены'
    let "CURYEAR +=1"
    cd $CURYEAR
    echo "Определяем текущий месяц"
    MONTH=`date +%m`
    echo $MONTH
    let "MONTH -=1"
    if [[ -d "$MONTH" ]]
    then
        ch $MONTH
        echo 'Удаляем записи прошлого месяца: '
        rm -rf $MONTH
        echo 'Удалено:'
    else 
        echo "Записей не было"
    fi
fi

