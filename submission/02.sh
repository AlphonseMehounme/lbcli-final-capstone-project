# How many new outputs were created by block 243,825?
bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 243825) 3 | jq -r '[.tx[].vout | length] | add'
