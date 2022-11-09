# vajalikud parameetrid
param(
$Kasutajanimi,
$Taisnimi,
$kontokirjeldus
)
# loome kasutajale parooli
$kasutajaparool = ConvertTo-SecureString "Qwerty123" -AsPlainText -Force
# lisame kasutaja vastavate andemetega
New-Localuser $Kasutajanimi -Password $kasutajaparool -FullName $Taisnimi -Description $kontokirjeldus