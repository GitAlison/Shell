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

MENSAGEM="
Uso: $(basename "$0") [-h | -V] 
	-h, --help 	Mostra mensagem de ajuda e sai
	-V, --version	Mostra a versao do pragrama e sai 
"
ordenar=1

case "$1" in
	-h | --help)
		#Mostra help
		echo "$MENSAGEM"
		exit 0
	;;
	-V | --version)
		#Mostra a versão
		echo -n $(basename "$0")
		grep '^# Versão ' "$0" | tail -l | cut -d : -f 1 | tr -d \#
		exit 0
	;;
	-s | --sort)
		$ordenar=1
;;
	*)
		if test -n "$1"
		then
			echo Opção Invalida
			exit 0
		fi
	;;
esac

if test "$ordenar" = 1
then
	#ordena lista
	cut -d : -f 1,5 /etc/passwd | tr : \\t | sort

else
	cut -d : -f 1,5 /etc/passwd |tr : \\t 
fi
