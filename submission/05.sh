# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
TX_ID=b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb
INPUT_TX_ID=$(bitcoin-cli -signet getrawtransaction $TX_ID true | jq -r '.vin[0].txid')
INPUT_SAT_AMOUNT=$(bitcoin-cli -signet getrawtransaction $INPUT_TX_ID true | jq -r '.vout[0].value * 100000000')
OUTPUT_SAT_AMOUNT=$(bitcoin-cli -signet getrawtransaction $TX_ID true | jq -r '[.vout[].value * 100000000] | add')
FEES=$((INPUT_SAT_AMOUNT - OUTPUT_SAT_AMOUNT))
echo $FEES
