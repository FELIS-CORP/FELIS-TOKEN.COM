#First we ping the utxo content of the FELIS wallet input and output it to a file.
Write-Host 'Now checking FELIS wallet UTXOs for new incoming transactions...' -ForegroundColor YELLOW
cardano-cli query utxo --mainnet --address addr1qx3l3vmpt6sln6an5myyfwt29yrgu8aupy4cgrpw5vt2t90644467xe7zgx9khlgjmujuw0pehf62c0un6nhlfn05cas2z4y6a --out-file d:\website\FELISBOT\FELISUTXO.txt 
#Rest to make sure the file is written before we check it
Start-Sleep -Seconds 2
#Finds out whether the file contains the target value of 2.1234 ADA which is also 2123400 lovelace

If (Select-String -Path d:\website\FELISBOT\FELISUTXO.txt -Pattern '2123400' -SimpleMatch) {

    Write-Host 'A NEW FELIS TRANSACTION WAS DETECTED!!  OMGOMGOMGOMGOMG!!!' -ForegroundColor GREEN
	Select-String -Path d:\website\FELISBOT\FELISUTXO.txt -Pattern '#0": {' -SimpleMatch

} Else {

    Write-Host 'No new FELIS transactions detected...' -ForegroundColor RED

}

Write-Host 'Checking again in 5 minutes' -ForegroundColor BLUE
Start-Sleep -Seconds 268
.\FELISBOT.ps1
