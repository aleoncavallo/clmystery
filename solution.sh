#!/bin/bash

if [ "$2" ]; then
	echo "Puede ser que hayas olvidado las comillas?" >&2
	exit 1
fi 

echo $1 | $(command -v md5 || command -v md5sum) | grep -qif /dev/stdin encoded && echo ¡CORRECTO! ¡EXCELENTE TRABAJO, DETECTIVE! || echo LO SIENTO, INTENTALO DE NUEVO.


