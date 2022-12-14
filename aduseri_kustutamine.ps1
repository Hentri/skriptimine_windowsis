#Kustutab kasutaja
Echo "Sisesta eesnimi"
$eesnimi=Read-Host
Echo "Sisesta perekonnanimi"
$perenimi=Read-Host
    #username= firstname.lastname
    $username = $eesnimi + "." + $perenimi
    $username = $username.ToLower()
    $username = Translit($username)
    $ErrorActionPreference = "SilentlyContinue"
    Remove-ADUser $username -Confirm:$false
if(!$?)
{
echo "kasutaja ei eksisteeri või probleem muhal"
}
else
{
echo "kasutaja $username edukalt eemaltatud"
}
$ErrorActionPreference = "Stop"
#function translit UTF-8 characters to LATIN
function Translit {
    #function use as parameter string to translit
    param(
    [string] $inputString
    )
    #tähed mis tuleb translittida
    $Translit = @{
    [char]'ä' = "a"
    [char]'ö' = "o"
    [char]'ü' = "u"
    [char]'õ' = "o"
    }
    #create translited output
    $outputString=""
    #transfer string to array of characters and by character
    foreach ($character in $inputCharacter = $inputString.ToCharArray())
    {
        #if character exists in list of characters for transliting
        if ($Translit[$character] -cne $Null ){
            #add to output translited character
            $outputString += $Translit[$character]
        }
        else {
            #otherwise add the initial character
            $outputString += $character
        }
    }
    Write-Output $outputString
}
