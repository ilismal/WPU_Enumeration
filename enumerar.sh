#!/bin/bash

indice=2
wget -qO- https://domain_name/blog/?author=$indice > temp.txt

while [ $(( `cat temp.txt | wc -l` )) -gt 0 ]
do
	usuario=`cat temp.txt | grep \<title\> | cut -d \> -f2 | cut -d \| -f1`
	echo $indice $usuario
	indice=$(( $indice + 1 ))
	wget -qO- https://domain_name/blog/?author=$indice > temp.txt
done
