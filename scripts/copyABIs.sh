#!/bin/bash

# Copy the ABI files to the abi directory

rsync -avr --include="*/" --include="*.abi" --exclude="*" ../lit-assets/blockchain/contracts/abis ./