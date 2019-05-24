# ITF22515-Operativsystemer-med-Linux

## Obligatorisk oppgave 4: Shellprogrammering
Denne obligatoriske oppgaven består av tre deloppgaver. I alle de tre oppgavene skal du lage shellprogrammer som bruker JPG-bilder som hentes fra en kilde på nettet, f.eks. fra et webkamera. 

http://roblabcam.hiof.no/now.jpg (bare er tilgjengelig fra IP-adresser innenfor hiof-domenet)


# Oppgave 1
Skriv et shellprogram som skal ha en URL som parameter. URL'en skal være adressen til et JPG-bilde på nettet som oppdateres jevnlig av f.eks. et webkamera.
Det skal ikke være mulig å avbryte programmet ved å trykke Ctrl-C (interrupt).
Ved oppstart skal programmet skal sjekke at:
Antall parametre er korrekt.
At parameteren som er gitt er en tekststreng som starter med http:// eller https://, og slutter med .jpg, .jpeg, .JPG eller .JPEG.
Programmet skal gi en feilmelding og avslutte hvis det oppdages feil i innparameter. Det er ikke nødvendig å sjekke at hele URL'en er en korrekt skrevet nettadresse, eller at det faktisk finnes en bildefil på nettet med den angitte adressen.
Programmet skal deretter gå i en "evig" løkke. I hvert gjennomløp skal programmet gjøre følgende:
Bildet på den angitte URL'en skal lastes ned.
Det skal skrives ut en fil med navn spion.html, som skal være en nettside laget med grunnleggende enkel HTML. Filen skal overskrives hvis den finnes fra før. Når man ser på filen spion.html i en nettleser, skal følgende vises:
URL til bildet som er lastet ned.
Selve bildet.
Dato og klokkeslett for når bildet er lastet ned.
Programmer skal deretter "sove" i ett minutt før neste gjennomløp av løkken.


# Oppgave 2
Skriv om programmet fra oppgave 1, slik at det alltid tar vare på de 10 siste bildene som er lastet ned fra webkameraet. Det siste bildet som er lastet ned skal alltid ligge tilgjengelig i filen spion.html. De 9 andre bildene som er lastet ned skal ligge tilgjengelige i filene spion_1.html, spion_2.html,... spion_9.html, sortert på nedlastingstidspunkt.

# Oppgave 3
Skriv om programmet fra oppgave 1 slik at det slår "alarm" hvis det er "mye forskjell" på to påfølgende bilder (f.eks. hvis en innbruddstyv har dukket opp foran/under kameraet).
Her kan du for enkelthets skyld anta at det er "mye forskjell" på to bilder hvis bildefilene har signifikant ulik størrelse, f.eks. at filstørrelsen er endret med mer enn 20 prosent (dette er en svært grov forenkling av problemet med å detektere forandring i bilder, men ikke helt ubrukelig hvis vi f.eks. bruker JPG-bilder med relativt mye kompresjon).

Programmet skal slå alarm ved at den "evige" løkken avbrytes og det skrives ut en linje med teksten "Alarm!". Deretter skal programmet terminere med exit-status lik 99.
