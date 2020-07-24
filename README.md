# timoschenkoaa_infra
timoschenkoaa Infra repository

HW №3 Запуск VM в YC
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

HW №4

testapp_IP = 178.154.247.74
testapp_port = 9292

Дополнительное задание
Добавлен metadata.yaml для конфигурации ВМ во время создания:

yc compute instance create \
--name reddit-app \
--hostname reddit-app \
--memory=4 \
--create-boot-disk image-folder-id=b1ga0cmqqghggdje2gi1,image-family=reddit-full,size=20GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
--metadata-from-file user-data=metadata.yaml \
--ssh-key ~/.ssh/appuser.pub
