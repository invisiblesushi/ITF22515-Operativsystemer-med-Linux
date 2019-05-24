#!/bin/bash

#Gjør det ikke mulig å avbryte programmet
#trap 'echo "ikke mulig å avbryte programmet med ^C"' int 

#Sjekker om URL er gyldig, og om det er bilde
function url_download () {
if [[ $1 =~(^http://|^https://) && $1 =~((jpeg|jpg|JPEG|JPG))$ ]]

#Henter bilde
then 
	wget $1 -O now.jpg
else 
	echo "Error no URL as parameter"
	exit
fi
}

#kjører scriptet i riktig rekkefølge, og venter 1min, bare hvis antall parameter = 1
while [ $# == 1 ]
do
	#laster ned fil, og ender navn, så man har 2filer
	url_download $1
	cp now.jpg now_1.jpg
	sleep 1
	url_download $1
	
	#lagrer størrelsen i variabel
	new_pic=$(wc -c <now.jpg)
	old_pic=$(wc -c <now_1.jpg)
	
	#finner 20% forskjell
	difference=$((new_pic / 5))

	#Legger til eller fjerner forskjellen
	old_pic_lt=$((old_pic - difference))
	old_pic_gt=$((old_pic + difference))
	
	#Sammenlikner å se om ny fil er mindre enn eller større enn
	if [[ $new_pic -lt old_pic_lt ]] || [[ $new_pic -gt old_pic_gt ]]
	then
	echo "Alarm!"
	exit 99
	#Feilmelding om det ikke er nokk forskjell
	else
	echo "Ikke nokk forskjell"
	fi
	break
done


