# FELIS-TOKEN.COM
FELIS PUBLIC FAUCET WEBSITE CODE

I made this for use as a faucet for FELIS. Kinda simple but these things don't need to be super complicated, they just need to work. Feel free to take it for your project.  



FELISBOT.PS1
--------------
NOTE: There is some setup involved to make this work. 

First, you'll want to make sure you get the socket path into the environment variables.  You can find a video on how to do that here https://www.youtube.com/watch?v=gfHMpDW6W7w.  
Next, make sure your execution policy is set to "RemoteSigned" and not "AllSigned" as detailed here 
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2#managing-the-execution-policy-with-powershell
--------------
FELISBOT is a powershell script that queries the UTXO contents of my wallet through cardano-cli via a Daedalus node every 5 minutes, dumps a text file containing a list of the UTXOs, searches the text file for the amount specified, copies the TXId if it finds the specified amount, queries the TXId for a sender address, constructs a transaction containing 1 million felis and 1.8ADA, then submits the transaction back to the person who sent it to me. Together with the simple website it works like a locally hosted auto-faucet if you just leave your powershell script running and your Daedalus wallet connected.  If you lose connection or have to close Daedalus, you'll need get the socket path again (it changes every time you re-connect) and put the new value back into the environment variable.  
