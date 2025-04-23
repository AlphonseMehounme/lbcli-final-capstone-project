# what is the coinbase tx in this block 243,834
TRANSACTION_ID=$(bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 243834) 3 | jq -r '.tx[0].txid')
echo $TRANSACTION_ID
