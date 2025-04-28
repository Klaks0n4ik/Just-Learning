### Информация об операционной системе и ядре:

Команды: uname -a, cat /etc/*release

### Аппаратные характеристики и ресурсы:

Команды: lscpu, free -h, cat /proc/meminfo, df -h, lsblk

### Сетевые настройки и конфигурация:

Команды: ip a, ss -tuln, ip route

### Запущенные службы и процессы:

Команды: ps aux, systemctl list-units --type=service --state=running

### Информация о пользователях и конфигурация доступа:

Файлы: /etc/passwd, /etc/group, /etc/sudoers

### Логи и конфигурационные файлы:

Команды: journalctl, dmesg, файлы в /var/log/, /etc.
