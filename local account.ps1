# loome kasutaja jaoks parooli
$KasutajaParool = ConvertTo-SecureString "Parool1!" -AsPlainText -force
# loome kasutaja
New-LocalUser "kasutaja1" -Password $KasutajaParool -FullName "esimene kasutaja" -Description "local account"