# Create 2-of-3 multisig address:

ADDRESS1=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme getnewaddress "" "bech32")
PUBKEY1=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme getaddressinfo $ADDRESS1 | jq -r '.pubkey')

ADDRESS2=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme getnewaddress "" "bech32")
PUBKEY2=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme getaddressinfo $ADDRESS2 | jq -r '.pubkey')

ADDRESS3=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme getnewaddress "" "bech32")
PUBKEY3=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme getaddressinfo $ADDRESS3 | jq -r '.pubkey')

MULTISIG=$(bitcoin-cli -signet -rpcwallet=AlphonseMehounme createmultisig 2 '''["'$PUBKEY1'","'$PUBKEY2'","'$PUBKEY3'"]''')
echo $MULTISIG
MULTISIG_ADDRESS=$(echo $MULTISIG | jq -r '.address')
echo $MULTISIG_ADDRESS
MULTISIG_REDEEM=$(echo $MULTISIG | jq -r '.redeemScript')
echo $MULTISIG_REDEEM

#Save to multisig-address.txt
#Save redeemScript to multisig-redeem.txt
#Fund using this faucet(alt.signetfaucet.com), and save txid to multisig-transaction.txt
#Save transaction block hash to multisig-block.txt and coinbase transaction to multisig-coinbase.txt
