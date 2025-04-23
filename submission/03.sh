# Which tx in block 216,351 spends the coinbase output of block 216,128?
COINBASE_TXID=$(bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 216128) 2 | jq -r '.tx[0].txid')
TRANSACTION=$(bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 216351) 2 | jq --arg COINBASE_TXID "$COINBASE_TXID" '.tx[] | select(.vin[].txid == $COINBASE_TXID)')
TRANSACTION_ID=$(echo $TRANSACTION | jq -r '.txid')
echo $TRANSACTION_ID
