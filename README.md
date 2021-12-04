# FELIS-TOKEN.COM

If you appreciate and would like to donate you can send me some ADA @ 

addr1qyj34769qz0gehxym9wwgq4jsr73zaghqnj5p3wp93wjj08rdk6ms56a5ldcvqsx9j0mqy7keldvw3k5ve50gwttdeeqpxcq2x

--------------------------------
FELIS PUBLIC FAUCET WEBSITE CODE
--------------------------------

I made this HTML site for use as a faucet for FELIS. Kinda simple but these things don't need to be super complicated, they just need to work. Feel free to take it for your project. I'm not really in this to spend a whole lot of time designing websites.

------------------
FELISBOT.PS1
-------------------

FELISBOT is an INCOMPLETE WORK-IN-PROGRESS Windows Powershell script that queries the UTXO contents of my wallet through cardano-cli via a Daedalus node every 5 minutes, dumps a text file containing a list of the UTXOs, formats the TXId if it finds the specified amount, scrapes and formats the raw output of cardanoscan.io to achieve a sender address, adds it and the TxHash to a log if it's not already there. That's as far as I've gotten as of my last submission.

The part I'm currently working on and learning about are the construction of a command line transaction containing 1 million FELIS and the necessary amount of return ADA, then the submission of the transaction back to the person who sent it to me.  Together with the simple website it works like a locally hosted auto-faucet if you just leave your powershell script running and your Daedalus wallet connected.  

--------------
NOTE: There is some setup involved to make FELISBOT work. 
--------------
 First, you'll want to install Daedalus and make sure you put the socket path into the environment variables. You can find a video on how to do that here https://www.youtube.com/watch?v=gfHMpDW6W7w.  

Next, make sure your execution policy is set to "RemoteSigned" and not "AllSigned" as detailed here 
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2#managing-the-execution-policy-with-powershell

If you lose connection or have to close Daedalus, you'll need get the socket path again (it changes every time you re-connect) and put the new value back into the environment variable.  

