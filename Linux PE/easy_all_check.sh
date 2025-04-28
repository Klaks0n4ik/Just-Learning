#!/bin/bash

# Функция вывода заголовка
function print_header() {
    echo "============================================================"
    echo " $1"
    echo "============================================================"
}

# Функция для сбора информации о системе
function collect_info() {
    # Информация о системе
    HOSTNAME=$(hostname)
    OS=$(lsb_release -d | awk -F"\t" '{print $2}')
    KERNEL=$(uname -r)
    UPTIME=$(uptime -p)

    # Информация о процессоре
    CPU=$(lscpu | grep "Model name" | awk -F": " '{print $2}')
    CORES=$(lscpu | grep "^CPU(s):" | awk -F": " '{print $2}')

    # Информация о памяти
    MEM_TOTAL=$(free -h | grep Mem | awk '{print $2}')
    MEM_USED=$(free -h | grep Mem | awk '{print $3}')
    MEM_FREE=$(free -h | grep Mem | awk '{print $4}')

    # Информация о дисках
    DISK_INFO=$(df -h --total | grep "total" | awk '{print $2 " total, " $3 " used, " $4 " available"}')

    # Информация о сети
    IP_ADDRESSES=$(ip -o -4 addr show | awk '{print $2 ": " $4}')

    # Активные службы
    SERVICES=$(systemctl list-units --type=service --state=running | grep ".service" | awk '{print $1}')

    # Открытые порты
    OPEN_PORTS=$(ss -tuln | grep LISTEN | awk '{print $1 ": " $4}')
}

# Функция вывода информации
function display_info() {
    print_header "ИНФОРМАЦИЯ О СИСТЕМЕ"
    echo "Имя хоста: $HOSTNAME"
    echo "Операционная система: $OS"
    echo "Версия ядра: $KERNEL"
    echo "Время работы системы: $UPTIME"

    print_header "ИНФОРМАЦИЯ О ПРОЦЕССОРЕ"
    echo "Модель процессора: $CPU"
    echo "Количество ядер: $CORES"

    print_header "ИНФОРМАЦИЯ О ПАМЯТИ"
    echo "Всего памяти: $MEM_TOTAL"
    echo "Использовано памяти: $MEM_USED"
    echo "Свободно памяти: $MEM_FREE"

    print_header "ИНФОРМАЦИЯ О ДИСКАХ"
    echo "Использование диска: $DISK_INFO"

    print_header "ИНФОРМАЦИЯ О СЕТИ"
    echo "IP-адреса:"
    echo "$IP_ADDRESSES"

    print_header "ЗАПУЩЕННЫЕ СЛУЖБЫ"
    echo "$SERVICES"

    print_header "ОТКРЫТЫЕ ПОРТЫ"
    echo "$OPEN_PORTS"
}

function main() {
    collect_info
    display_info
}

main
