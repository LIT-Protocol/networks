#!/bin/bash

# This script copies the addresses from this folder into the lit js sdk contracts folder

sdk_path="../../js-sdk/packages/contracts-sdk/src/abis"

contracts_in_sdk=("Allowlist.sol" "LITToken.sol" "Multisender.sol" "PKPHelper.sol" "PKPNFT.sol" "PKPPermissions.sol" "PubkeyRouter.sol" "RateLimitNFT.sol" "Staking.sol")
keys_from_json=("allowlistContractAddress" "litTokenContractAddress" "multisenderContractAddress" "pkpHelperContractAddress" "pkpNftContractAddress" "pkpPermissionsContractAddress" "pubkeyRouterContractAddress" "rateLimitNftContractAddress" "stakingContractAddress")

counter=0
for key in "${keys_from_json[@]}"; do
  value=$(jq -r --arg key "$key" '.[$key]' deployed-lit-node-contracts-temp.json)
  echo "$key: $value"

  # Copy the address to the sdk
  contract_name_in_sdk=${contracts_in_sdk[$counter]}
  contract_name_in_sdk_without_sol=${contract_name_in_sdk%.sol}
  abi_path_js="$sdk_path/$contract_name_in_sdk/${contract_name_in_sdk_without_sol}Data.js"
  abi_path_ts="$sdk_path/$contract_name_in_sdk/${contract_name_in_sdk_without_sol}Data.ts"
  abi_path_mjs="$sdk_path/$contract_name_in_sdk/${contract_name_in_sdk_without_sol}Data.mjs"

  echo "Replacing address for $contract_name_in_sdk in $abi_path_js"

  # Replace the address in the abi file
  sed -i '' -e 's/"address":.*/"address": "'"$value"'",/g' $abi_path_js
  sed -i '' -e 's/"address":.*/"address": "'"$value"'",/g' $abi_path_ts
  sed -i '' -e 's/"address":.*/"address": "'"$value"'",/g' $abi_path_mjs

  ((counter++))
done


