# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
TRANSACTION=$(bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 243821) 3 | jq -r '.tx[] | select(.vin[].sequence < 4294967294)')
TRANSACTION_ID=$(echo $TRANSACTION | jq -r '.txid')
echo $TRANSACTION_ID
