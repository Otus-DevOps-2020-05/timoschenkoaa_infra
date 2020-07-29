# timoschenkoaa_infra
timoschenkoaa Infra repository

HW №5 Запуск VM в YC
Задание

bastion_IP = 84.201.173.21
someinternalhost_IP = 10.130.0.22

Самостоятельное задание

ssh -i ~/.ssh/id_rsa -J appuser@84.201.173.21 appuser@10.130.0.22

Дополнительное задание

В конфиг нужно прописать хост bastion и someinternalhost с ProxyJump.
Host someinternalhost
  HostName 10.130.0.22
  ForwardAgent yes
  ProxyJump  appuser@84.201.173.21
  User appuser
  IdentityFile ~/.ssh/id_rsa

Дополнительное задание с сертификатом
Сертификат обновлен для:
 https://84.201.173.21.sslip.io

HW №6

testapp_IP = 130.193.37.121
testapp_port = 9292

Дополнительное задание
Добавлен metadata.yaml для конфигурации ВМ во время создания:

yc compute instance create \
--name reddit-app \
--hostname reddit-app \
--memory=4 \
--create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=20GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
--metadata-from-file user-data=metadata.yaml \
#--ssh-key ~/.ssh/appuser.pub

HW №7
Создан конфигурационный файл для создания образа ВМ с предустановленными ruby и mongodb
# packer/ubuntu16.json 
Создан конфигурационный файл 'bake' образа, включающий все зависимости приложения и сам код приложения
# packer/immutable.json
packer/variables.json - переменные для обоих шаблонов (.gitignore)
packer/files/install_puma.sh - скрипт инициализации puma
config-scripts/create_reddit.sh - скрипт создания ВМ из образа (с предустановленными ruby и mongodb)