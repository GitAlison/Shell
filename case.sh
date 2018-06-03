#Usando Case para usar parametros

MENSAGEM="MENSAGEM DE AJUDA [-h]"


case "$1" in 
	-h)

	echo $MENSAGEM
	exit 0
	;;

	-v)
	echo Version 0.1
	exit 0 
	;;
	*)
	echo Opcao invalida
	exit 0
	;;
	
esac
