
MENSAGEM="
Uso: [-h]
	-h é o botao de ajuda e sai
"

if test "$1" = "-h"
then
	echo $MENSAGEM
	exit 0

elif test "$1" = "-V"
then
	echo Version 0.1 Beta
	exit 0
fi
