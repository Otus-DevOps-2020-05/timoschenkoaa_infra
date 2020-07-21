# timoschenkoaa_infra
timoschenkoaa Infra repository

ДЗ №3 Запуск VM в YC\
Задание

bastion_IP = 84.201.173.21 \
someinternalhost_IP = 10.130.0.22

Самостоятельное задание

ssh -i ~/.ssh/id_rsa -J appuser@84.201.173.21 appuser@10.130.0.22

Дополнительное задание

В конфиг нужно прописать хост bastion и someinternalhost с ProxyJump.\
Host someinternalhost \
  HostName 10.130.0.22\
  ForwardAgent yes\
  ProxyJump  appuser@84.201.173.21\
  User appuser\
  IdentityFile ~/.ssh/id_rsa\

Дополнительное задание с сертификатом\
Сертификат обновлен для:\
 https://84.201.173.21.sslip.io
