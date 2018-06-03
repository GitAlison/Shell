#!/bin/bash

MENSAGEM="
Uso [-h] mensagem de ajuda
	-h , --help mostra ajuda e sai
	-V , --version mostra versao e sai
"

case "$1" in 
	-h | --help)
		echo "$MENSAGEM"
		exit 0
	;;
	-v | --version)
		echo Versão 0.1
		exit 0 
	;;
	*)
		echo Opção invalida
		exit 0
	;;
esac

