#!/bin/bash

#Gjør det ikke mulig å avbryte programmet
trap 'echo "ikke mulig å avbryte programmet med ^C"' int 

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

function tag_pic () {
  echo "<img src=\"$1\" width=$2>"
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
echo "<img src = "now.jpg" width = 500>"
tag_txt P $2
tag_txt P $3
end_tag BODY
end_tag HTML
}

#Sjekker om fil eksisterer
function file_exist () {
if [ -f $1 ]
then 
	rm $1
fi
}

#kjører scriptet i riktig rekkefølge, og venter 1min, bare hvis antall parameter = 1
while [ $# == 1 ]
do
	url_download $1
	file_exist spion.html
	make_html $1 $(date +%Y-%m-%d) $(date +%H:%M:%S)  > spion.html 
echo "done"
	sleep 60
done


