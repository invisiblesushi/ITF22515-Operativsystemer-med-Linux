#!/bin/bash

#Gjør det ikke mulig å avbryte programmet
#trap 'echo "ikke mulig å avbryte programmet med ^C"' int 

#Sjekker om URL er gyldig, og om det er bilde
function url_download () {
if [[ $1 =~(^http://|^https://) && $1 =~((jpeg|jpg|JPEG|JPG))$ ]]

#Henter bilde
then
	wget $1 -O now$i.jpg
else 
	echo "Error no URL as parameter"
	exit
fi
}

#HTML
function start_tag () 
{
  echo "<$1>"
}

function end_tag ()
{
  echo "</$1>"
}

function tag_txt () {
  start_tag $1
  echo $2
  end_tag $1
}

#setter sammen html
function make_html () {
start_tag HTML
start_tag HEAD
tag_txt TITLE "Roblabcam"
end_tag HEAD
start_tag BODY
tag_txt H1 "Roblabcam"
tag_txt h3 $1
echo "<img src = "now$4.jpg" width = 500>"
tag_txt P $2
tag_txt P $3
end_tag BODY
end_tag HTML
}

#Sjekker om fil eksisterer, så sletter
function rm_exist () {
if [ -f $1 ]
then 
	rm $1
fi
}

#kjører scriptet i riktig rekkefølge, og venter 1min, bare hvis antall parameter = 1
while [ $# == 1 ]
do
	#Sletter nummer 9, fordi 9 er siste fil
	rm_exist now9.jpg
	rm_exist spion_9.html
	
	#kopierer alle et hakk bortover
	for i in {1..9}
	do
		cp spion_8.html spion_9.html
                cp spion_7.html spion_8.html
                cp spion_6.html spion_7.html
                cp spion_5.html spion_6.html
                cp spion_4.html spion_5.html
                cp spion_3.html spion_4.html
                cp spion_2.html spion_3.html
                cp spion_1.html spion_2.html
		cp spion.html spion_1.html		
		#laster ned, og lager ny html
		url_download $1
		make_html $1 $(date +%Y-%m-%d) $(date +%H:%M:%S) $i  > spion.html 
		sleep 1
	done
	sleep 60
done


