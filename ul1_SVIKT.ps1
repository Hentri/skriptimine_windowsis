#määrame kasutajale parool
$Kasutajaparool = ConvertTo-SecureString 'Parool11!' -Asplaintext -force
#read hostiga $eesnimi
$Eesnimi = Read-host "Sisesta oma eesnimi"
#read hostiga $perenimi
$Perenimi = Read-Host "Sisesta oma perenimi"
#$kasutajnimi sätestamine
$KasutajaNimi = $Eesnimi.ToLower() + " " + $Perenimi.ToLower()
#$täisnimi
$TaisNimi =$Eesnimi + " " + $Perenimi
#$kontokirjeldus
$Kirjeldus = "Lokaalne konto"
#kasutajanime confirmimine? write-outputiga
Write-Output "Loodav kasutaja on $($KasutajaNimi)"
#lülitame süsteemi teaded välja
$ErrorActionPreference = 'SilentlyContinue'
#kasutaja loomise command
New-Localuser $Kasutajanimi -Password $Kasutajaparool -FullName $Taisnimi -Description $Kirjeldus
#kontroll
if(!$?){
Write-Output "Tekkinud probleem kasutaja loomisega"
}
#süsteemi teaded tagasi sisse
$ErrorActionPreference = 'Stop'