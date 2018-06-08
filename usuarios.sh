#!/bin/bash

#usuarios.sh
#Programa para ler arquivo de usuarios
#
#
#Mostra os logins e nomes de usuarios do sistema
#
#Obs. Lê dados do arquivo /etc/passwd
#
#Alison Aguiar 20/05/2018 as 18:34
#
# Versão 1:MOstra os usuarios e nomes separados por TAB
# Versão 2:Mostra suport a opção -h
# Versão 3:Mostra a opção -h -V e opcao invalida com case 21/05/2018
# Versão 4:Arrumando bug quando nao tem opcoes
#	nome do programa,-V extraindo direto dos cabeçalhos
#	adcionais opcoes --version e --help
# Versão 5: Opções e argumentos tratados com getopts. 07/06/2018

MENSAGEM="
Uso: $(basename "$0") [-h | -V] 
	-h, --help 	Mostra mensagem de ajuda e sai
	-V, --version	Mostra a versao do pragrama e sai
	-s ordena
	-d ex [-d - ] 	delimitador -  
"
ordena=0
maiuscula=0
reverse=0
delim='\t'



while getopts ":hVd:rsu" opcao

do
	case $opcao in
		s) ordena=1;;
		r) reverse=1;;
		u) maiuscula=1;;
		d) delim="$OPTARG";;
		h) #Mostra help
			echo "$MENSAGEM"
			exit 0 
		;;
		V)
			#Mostra a versão
			echo -n $(basename "$0")
			grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;

		\?) 	echo Opcao invalida $OPTARG
			exit 1
		;;

		:)
			echo Faltou argumento para: $OPTARG
			exit 1
		;;

	esac
	#opcao $1 ja processada a fila deve andar
done


#Extrai a lista
lista=$(cut -d : -f 1,5 /etc/passwd)

#Ordena e inverte ou converte uma lista para maiusculas se nessesario


test "$ordena"		= 1 && lista=$(echo "$lista" | sort)
test "$reverse" 	= 1 && lista=$(echo "$lista" | tac)
test "$maiuscula" 	= 1 && lista=$(echo "$lista" | tr a-z A-Z)

echo "$lista" | tr : "$delim"
