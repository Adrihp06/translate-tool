#!/bin/bash

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
        echo -e "\n${redColour}[!] Saliendo...\n${endColour}"
}

function helpPanel(){
        echo -e "\n${redColour} Uso: ./translatetool${endColour}"

}

parameter_counter=0; while getopts "o:t:w:h:" arg; do
        case $arg in
                o) idioma_original=$OPTARG; let parameter_counter+=1;;
                t) idioma_traducido=$OPTARG; let parameter_counter+=1;;
                w) texto=$OPTARG; let parameter_counter+=1;;
                h) helpPanel;;
  GNU nano 3.2                                        translatetool.sh

                o) idioma_original=$OPTARG; let parameter_counter+=1;;
                t) idioma_traducido=$OPTARG; let parameter_counter+=1;;
                w) texto=$OPTARG; let parameter_counter+=1;;
                h) helpPanel;;
        esac
done
if [ $parameter_counter -eq 3 ]; then
        texto_traducido=$(echo "$texto%" | sed 's/ /%/g')
else
        helpPanel
fi

curl -s "https://translate.googleapis.com/translate_a/single?client=gtx&sl=${idioma_original}&tl=${idioma_traducido}&dt$

#COSAS QUE MEJORAR:
#-Solo acepta 23 palabras
#-Caracteres extraños como el uso de ' en ingles o las tildes en español
#-Mejorar el help panel y poner colorcitos

