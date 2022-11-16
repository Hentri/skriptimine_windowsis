$Eesnimi = Read-host "Sisesta oma eesnimi"
#read hostiga $perenimi
$Perenimi = Read-Host "Sisesta oma perenimi"
#$kasutajnimi sätestamine
$KasutajaNimi = $Eesnimi.ToLower() + " " + $Perenimi.ToLower()
#$täisnimi
$TaisNimi =$Eesnimi + " " + $Perenimi
#kasutajanime väljakirjutamine write-outputiga
Write-Output "Kustutav kasutaja on $($KasutajaNimi)"
Write-Output "Kasutaja $($KasutajaNimi) on kustutatud"
#lülitame süsteemi teaded välja
$ErrorActionPreference = 'SilentlyContinue'
#kasutaja loomise command
Remove-LocalUser $Kasutajanimi
if(!$?){
Write-Output "Tekkinud probleem kasutaja loomisega"
}
#süsteemi teaded tagasi sisse
$ErrorActionPreference = 'stop'