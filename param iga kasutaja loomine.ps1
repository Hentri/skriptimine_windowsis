# kontroll parameetrite arvule 
if($args.Count -ne 3 ){
# kui edastatud parameetrite arv ei ole 3
# siis trükime kasutusjuhend
echo "kasutusjuhend: ./sktriptinimi kasutajanimi täisnimi kirjeldus"
}
else {
# vajalikud parameetrid
$Kasutajanimi = $args[0]
$Taisnimi = $args[1]
$kontokirjeldus = $args[2]
# loome kasutajale parooli
$kasutajaparool = ConvertTo-SecureString "Qwerty123" -AsPlainText -Force
# lisame kasutaja vastavate andemetega
New-Localuser $Kasutajanimi -Password $kasutajaparool -FullName $Taisnimi -Description $kontokirjeldus
}