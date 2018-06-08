!/bin/bash

#getopts-test.sh

#Alison 7 junho 2018
#Uso de getopts

echo "------------------"
while getopts ":sVa:" opcao
do
	# $opcao guarda a opcai da vez(ou ? e : em caso de error)
	# $OPTARG guarda o argumento da opcao (se houver)

	case $opcao in 
		s)  echo "Ok Opção simples (-s)";;
		V) echo "Versão 1.0";;
		a)  echo "Ok opção com argumento (-a), recebeu: $OPTARG";;
		\?) echo "Error Opção invalida; $OPTARG";;
		:) echo "Error Argumento invalido: $OPTARG";;
	esac
done


#O loop termina quando nenhuma opção for encontrada 
#Mas ainda podem existir argumentos, como um nome de arquivo
#A variavel $OPTIND guarda o indice do resto da linha de comando
#util para arrancar as opções ja processadas.
echo "------------------"
echo shift $((OPTIND - 1))

echo "INDICE $OPTIND"
echo "RESTO :$*"
echo
