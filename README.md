# FELIS-TOKEN.COM
FELIS TOKEN WEBSITE CODE

I made this for use as a faucet for FELIS. Feel free to take it for your project.  

FELISBOT.PS1

FELISBOT is a powershell script that queries the UTXO contents of my wallet through cardano-cli via a Daedalus node every 5 minutes, dumps a text file containing a list of the UTXOs, searches the text file for the amount specified, copies the TXId if it finds the specified amount (later it will include any amount more than that), queries the TXId for a sender address, constructs a transaction containing 1 million felis and 1.8ADA, then submits the transaction back to the person who sent it to me.  Together these things work like a local auto-faucet if you just leave your powershell script running and your Daedalus wallet connected.  If you lose connection or have to close Daedalus, you'll need get the socket path again (it changes every time you re-connect) and put the new value back into the environment variable.  If you're not sure how to do that you can find more info here:

https://www.youtube.com/watch?v=gfHMpDW6W7w
