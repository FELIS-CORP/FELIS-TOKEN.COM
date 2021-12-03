#Message to user letting them know it's sending the query for the UTXOs
Write-Host 'Now checking FELIS wallet UTXOs for new incoming transactions...' -ForegroundColor YELLOW
#initiate the query command to build the raw utxo list
cardano-cli query utxo --mainnet --address addr1qx3l3vmpt6sln6an5myyfwt29yrgu8aupy4cgrpw5vt2t90644467xe7zgx9khlgjmujuw0pehf62c0un6nhlfn05cas2z4y6a --out-file d:\website\FELISBOT\FELISUTXO.txt
#Rest to make sure the file is written before we check it.  Also a great time to inject a value for testing.  
Start-Sleep -Seconds 15   
#Checks whether the file contains the target value of 2.1234 ADA which is also string "lovelace": 2123400". if present, begin formating.
If (Select-String -Path d:\website\FELISBOT\FELISUTXO.txt -Pattern 'lovelace": 2123400' -AllMatch) {
    Select-String -Path d:\website\FELISBOT\FELISUTXO.txt -Pattern 'lovelace": 2123400' -AllMatch -Context 2,0 > TXPrepper.txt #Picks the FELIS transaction
    $txhash = (Get-Content d:\website\FELISBOT\TXPrepper.txt)
	$y= @()
    foreach($line in $txhash){
			if ( $line.length -gt 1){ $y += $line.substring(0,90) } 
    }
    $y | Set-Content d:\website\FELISBOT\TXPrepper.txt 
	(Get-Content d:\website\FELISBOT\TXPrepper.txt) -replace '^.......................' | Set-Content d:\website\FELISBOT\TXPrepper.txt #formatting complete
	(Get-Content d:\website\FELISBOT\TXPrepper.txt) | ForEach-Object {$_ -replace '"',''} | Set-Content d:\website\FELISBOT\TXPrepper.txt #formatting complete
	#Now we check the TxHash against $logfile to see if we already responded to this UTXO.
    $cleantxhash = (Get-Content d:\website\FELISBOT\TXPrepper.txt)
    $txhashlog = (Get-Content d:\website\FELISBOT\TXHashLog.txt)
    if(-not("$txhashlog" -contains "$cleantxhash")) {
        Write-Host 'A new FELIS transaction detected!! MEOWWWWWW!!!' -ForegroundColor GREEN
        Write-Output "It's not in the log so I'll add it after sending."
        
        #WebScraper searches Cardanoscan.io using TX hash
        $Site = "https://cardanoscan.io/transaction/"
        $SiteTx = $Site + $cleantxhash
        $SitePattern = "<meta property=twitter:image content=/public/assets/images/meta-cover.png>"
        (Invoke-WebRequest $SiteTx).RawContent > RawSite.txt #dumps the webpage containing info about the transaction to raw text
        Select-String -Path d:\website\FELISBOT\RawSite.txt -Pattern $SitePattern > d:\website\FELISBOT\Address.txt #Converts the output to lines of strings
        (Get-Content d:\website\FELISBOT\Address.txt | Select-Object -Skip 112) | Set-Content d:\website\FELISBOT\Address.txt #deletes everything up to the row with sender address.
        (Get-Content d:\website\FELISBOT\Address.txt) -replace '^..........................' | Set-Content d:\website\FELISBOT\Address.txt #deletes the leading characters
        (Get-Content d:\website\FELISBOT\Address.txt -First 1) | Set-Content d:\website\FELISBOT\Address.txt #deletes the trailing lines
        (Get-Content d:\website\FELISBOT\Address.txt) | ForEach-Object {$_ -replace '"','.'} | Set-Content d:\website\FELISBOT\Address.txt #rids me of double quotes
        (Get-Content d:\website\FELISBOT\Address.txt) | ForEach-Object {$_ -replace "'","."} | Set-Content d:\website\FELISBOT\Address.txt #rids me of single quotes
        (Get-Content d:\website\FELISBOT\Address.txt).Replace('.,.copyInputAddressID0.). class=.copyButton ','') | Set-Content d:\website\FELISBOT\Address.txt #address formatting complete
        $Address = (Get-Content d:\website\FELISBOT\Address.txt)
        
        #We construct a transaction back to the sender address containing return ADA and 1 million FELIS
        #We send the transaction.
        #We append the TX hash to the log.
        Add-Content d:\website\FELISBOT\AddressLog.txt $Address
	Add-Content d:\website\FELISBOT\TXHashLog.txt $cleantxhash
        #Clear-Content d:\website\FELISBOT\TXPrepper.txt
        #Clear-Content d:\website\FELISBOT\RawSite.txt
        #Clear-Content d:\website\FELISBOT\Address.txt
        }
    Else {
        Write-Host 'No new FELIS transactions detected...' -ForegroundColor RED
	}
}Else {
    Write-Host 'No new FELIS transactions detected...' -ForegroundColor RED
}
Write-Host 'Checking again in 5 minutes...' -ForegroundColor GRAY
Start-Sleep -Seconds 268
.\FELISBOT.ps1 
