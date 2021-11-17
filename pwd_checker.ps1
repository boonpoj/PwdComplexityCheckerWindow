$pwd = Read-Host 'What is your password:?' -AsSecureString
$dict = Read-Host 'Path to Dictionary:?'
$pwdPlain = [System.Net.NetworkCredential]::new("", $pwd).Password
$tmp = Select-String -Path $dict -pattern "^$pwdPlain$" -CaseSensitive

if($tmp){
	Write-Host 'Your password is not Strong password (well-known password)'
} else {
      	if($pwdPlain -cmatch '(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})'){
            Write-Host 'Your password is Strong password'
     	} else {
            Write-Host 'Your password is not Strong password (Not complexity)'
      	}
}