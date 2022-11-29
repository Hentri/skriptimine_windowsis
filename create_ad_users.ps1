# New-ADUser -Name "adkasutaja2" -GivenName "AD" -Surname "Kasutaja 2" -SamAccountName "adkasutaja2" -UserPrincipalName "adkasutaja2@sv-kool.local" -AccountPassword(Read-Host -AsSecureString "Input Password") -Enabled $true
#location of AD users file
$file = "C:\Users\Administrator\Documents\adusers.csv"
#import file content
$users = Import-Csv $file -Encoding default -Delimiter ";"
# foreach user data row in file
foreach ($user in $users){
# username is firstname.lastname
$username = $user.firstname + "." + $user.lastname
$username = $username.ToLower()
$username = Translit($username)
# user principal name
$upname = $username + "@sv-kool.local"
# display name - eesnimi + perenimi
$displayname = $user.firstname + " " + $user.lastname
echo $username
New-ADUser -Name $username `
-displayname $displayname `
-givenname $user.firstname `
-surname $user.lastname `
-department $user.department `
-title $user.role `
-userprincipalname $upname `
-accountpassword (ConvertTo-SecureString $user.password -AsPlainText -Force) -enabled $true
}
# function translit UTF-8 characters to LATIN
function Translit {
#function use a parameter string to translit
  param(
  [string] $inputString
  )
  # define the characters which have to be translited
    $Translit = @{
      [char]'ä' = "a"
      [char]'ö' = "o"
      [char]'ü' = "u"
      [char]'õ' = "o"
      }
 # create translited output
 $outputString=""
 # transfer string to array of characters and by character
 foreach ($character in $inputCharacter = $inputString.ToCharArray()){
      #if character exists in list of characters of transliting
      if ($Translit[$character] -cne $null ){
      # add to output translited character
      $outputString += $Translit[$character]
      } else {
      #otherwise add the initial char
      $outputString += $character
      }
}
Write-Output $outputString
}     