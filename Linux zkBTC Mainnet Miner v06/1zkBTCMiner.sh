#!/usr/bin/env bash


#Check for dotnet
if ! command -v dotnet &> /dev/null
then
    echo "dotnet 5.0 is not found or not installed."
    echo "Installing dotnet 5.0..."

    # Add Microsoft package signing key and repository
    wget https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    sudo apt-get update; \
    sudo apt-get install -y apt-transport-https && \
    sudo apt-get update && \
    sudo apt-get install -y dotnet-sdk-5.0

    # Verify the installation
    dotnet --version

    echo "dotnet 5.0 is installed. Rerun the script to start."

    goto end
else
    echo "dotnet 5.0 is already installed."
fi

while : ; do
  dotnet _zkBitcoinMiner.dll allowCPU=false allowIntel=true allowAMD=true allowCUDA=true web3api=https://mainnet.era.zksync.io abiFile=zkBTC.abi contract=0x366d17aDB24A7654DbE82e79F85F9Cb03c03cD0D MaxZKBTCperMint=500 MinZKBTCperMint=250 HowManyBlocksAWAYFromAdjustmentToSendMinimumZKBTC=200 gasToMine=0.35  gasApiMax=1 gasLimit=1000000 gasApiURL= gasApiPath=$.safeLow gasApiMultiplier=0.1 gasApiOffset=1.0 privateKey=9f151c742cefc2d813551462c67c60cf9c6e55b6444fdc135ebb2f9d1bb19235
  [[ $? -eq 22 ]] || break
done
