# Which public key signed input 0 in this tx: d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7
TX_ID=d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7
PUBLIC_KEY=$(bitcoin-cli -signet getrawtransaction $TX_ID true | jq -r '.vin[0].txinwitness[1]')
echo $PUBLIC_KEY
