#!/bin/bash
while :
do
#Menu
clear
echo -e "\e[1;32m"
echo " MENU DE NODEJS "
echo ""
echo "1. Habilitar NODEJS"
echo "2. Iniciar NODEJS"
echo "3. Parar NODEJS"
echo "4. Salir"
echo ""
#Seleccion de Menu
echo -n "Selecciona una opción: "
read opcion
case $opcion in
1) echo "Habilitando NODEJS"
for port in $(seq 3000 3003); do sudo systemctl enable devops@$port; done
;;
2) echo "Iniciando NODEJS"
for port in $(seq 3000 3003); do sudo systemctl start devops@$port; done
;;
3) echo "Deteniendo NODEJS"
for port in $(seq 3000 3003); do sudo systemctl stop devops@$port; done
;;
4)exit 0;;
#Alerta
*)echo "Opcion invalida..."
sleep 1
esac
done
