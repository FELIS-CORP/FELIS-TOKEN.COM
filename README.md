# FELIS-TOKEN.COM

If you appreciate and would like to donate you can send me some ADA @ 

addr1qyj34769qz0gehxym9wwgq4jsr73zaghqnj5p3wp93wjj08rdk6ms56a5ldcvqsx9j0mqy7keldvw3k5ve50gwttdeeqpxcq2x

--------------------------------
FELIS PUBLIC FAUCET WEBSITE CODE
--------------------------------

I made this HTML site for use as a way to purchase FELIS for anyone who would like to hold it. It's painfully simple but that's fine by me. Just use the Muesliswap DEX aggregator engine built into the website to trade FELIS<>ADA.

------------------
FELISBOT.PS1
-------------------

FELISBOT is a DEPRECATED Windows Powershell script that queries the UTXO contents of my wallet through cardano-cli via a Daedalus node every 5 minutes, dumps a text file containing a list of the UTXOs, formats the TXId if it finds the specified amount, scrapes and formats the raw output of cardanoscan.io to achieve a sender address, adds it and the TxHash to a log if it's not already there. That's as far as I've gotten as of my last submission before giving up on this approach. Maybe I'll revisit at a later date but probably not as more efficient methods now exist.

--------------
NOTE: There is some setup involved to make FELISBOT work. 
--------------
First, you'll want to install Daedalus, let it sync, and then make sure you put the socket path into the environment variables. You can find a video on how to do that here https://www.youtube.com/watch?v=gfHMpDW6W7w.  

Next, make sure your execution policy is set to "RemoteSigned" and not "AllSigned" as detailed here 
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2#managing-the-execution-policy-with-powershell

If you lose connection or have to close Daedalus, you'll need get the socket path again (it changes every time you re-connect) and put the new value back into the environment variable.  

