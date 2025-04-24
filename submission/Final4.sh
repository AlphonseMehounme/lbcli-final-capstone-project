##Spend from funded address by creating a transaction with details below:

UTXO_TXID=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme listunspent | jq -r '.[0].txid')
UTXO_VOUT=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme listunspent | jq -r '.[0].vout')

#Send exactly 10,000 sats to tb1qddpcyus3u603n63lk7m5epjllgexc24vj5ltp7

RECIPIENT="tb1qddpcyus3u603n63lk7m5epjllgexc24vj5ltp7"
CHANGE_ADDRESS=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme getrawchangeaddress "bech32")

# Create transaction
#Use transaction Fee: 700 sats
#Make sure transaction fee can be later updated to a higher fee

TX_HEX=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme createrawtransaction '''[{"txid":"'$UTXO_TXID'","vout":'$UTXO_VOUT', "sequence":1}]''' '''{"'$RECIPIENT'":0.00010000, "'$CHANGE_ADDRESS'":0.00090248}''')

# Sign transaction

SIGN_HEX=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme signrawtransactionwithwallet $TX_HEX | jq -r '.hex')

#Broadcast transaction

#FINAL_HEX=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme sendrawtransaction $SIGN_HEX)
#echo $FINAL_HEX

#Save txid to transaction-2.txt
#Save transaction block hash to block-2.txt and coinbase transaction to coinbase-2.txt
