#!/bin/bash
clear
if [ "$1" == "" ]
	then
		printf '\x1b[36m=#=%.0s\x1b[0;0m' {1..20} \n
		printf "\n\n"
		echo -e "\033[1;31mScript utilizado de forma errada\033[0;0m"
		echo " "
		echo -e "Como utilizar: \033[1;33m$0\033[0;0m \033[1;35msite\033[0;0m"
		echo " "
		echo -e "Exemplo: \033[1;33m$0\033[0;0m \033[1;35mwww.businesscorp.com.br\033[0;0m"
		printf '\x1b[36m=#=%.0s\x1b[0;0m' {1..20} \n
		printf "\n\n"
else
wget $1

mkdir arquivos_limpos
mkdir lixo
cat index.html | grep "href" | cut -d '/' -f 3 | grep "\." | cut -d '"' -f1 | grep -v "<" | grep -v "return" | grep -v "javascript" > subdomains.txt
rm index.html
clear
printf "\n"
printf '\x1b[34m=#=%.0s\x1b[0;0m' {1..23} \n
printf "\n"

echo -e "\033[31mESTAMOS PROCESSANDO OS SEUS DADOS\033[0;0m"

printf '\x1b[34m=#=%.0s\x1b[0;0m' {1..23} \n
printf "\n"

echo "Foram encontrados os seguintes Sub Dominíos em $1" >> $1.txt
for url in $(cat subdomains.txt );do echo $(host $url) | grep "has" | cut -d " " -f 1 >> dominios_finais.txt; done
for url in $(cat subdomains.txt); do echo $(host $url) | grep "has" | cut -d " " -f 4 >>ips.txt;done

#4444444444444444444444444444444444444444444444444444444444444444444444444444444

printf "\n" >> $1.txt
printf '=#=%.0s' {1..23} \n >> $1.txt
printf "\n" >> $1.txt

for domin in $(cat dominios_finais.txt); do echo "[+] HOST: $domin" >> $1.txt ;done

printf "\n" >> $1.txt
printf '=#=%.0s' {1..23} \n >> $1.txt
printf "\n" >> $1.txt

for ips in $(cat ips.txt);do echo "[-]IP: $ips";done >> $1.txt

printf "\n" >> $1.txt
printf '=#=%.0s' {1..23} \n >> $1.txt
printf "\n" >> $1.txt

mv $1.txt arquivos_limpos
mv dominios_finais.txt lixo
mv ips.txt lixo
mv subdomains.txt lixo


#4444444444444444444444444444444444444444444444444444444444444444444444444444444

#5555555555555555555555555555555555555555555555555555555555555555555555555555555
clear
echo -e "\033[32mForam encontrados os seguintes Sub Dominíos em \033[37m$1\033[0;0m"
printf "\n"
printf '\x1b[31m=#=%.0s\x1b[0;0m' {1..23} \n
printf "\n"

for domin in $(cat lixo/dominios_finais.txt); do echo -e "\033[35m[\033[37m+\033[35m] \033[0;0m \033[36mHOST:\033[33m $domin\033[0;0m";done

printf "\n"
printf '\x1b[34m=#=%.0s\x1b[0;0m' {1..23} \n
printf "\n"

for ips in $(cat lixo/ips.txt);do echo -e "\033[35m[\033[37m+\033[35m]\033[0;0m \033[36mIP: \033[33m$ips\033[0;0m";done

printf "\n"
printf '\x1b[31m=#=%.0s\x1b[0;0m' {1..23} \n
printf "\n"
echo -e "\033[33mSeu arquivo \033[35m$1.txt\033[33m foi salvo em 'arquivos_limpos' \033[0;0m"
echo " "
fi

rm -rf lixo
echo "Aperte qualquer tecla para sair"
read sair 
#5555555555555555555555555555555555555555555555555555555555555555555555555555555
#printf '\x1b[36m=#=%.0s\x1b[0;0m' {1..23} \n >> $1.txt