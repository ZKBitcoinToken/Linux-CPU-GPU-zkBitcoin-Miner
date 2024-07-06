#!/usr/bin/env bash


#Check for dotnet
if ! command -v dotnet &> /dev/null
then
    echo "dotnet 5.0 is not found or not installed."
    echo "Installing dotnet 5.0..."
    ubuntu_version=$(lsb_release -rs)
    if [[ "$ubuntu_version" == "22.04" || "$ubuntu_version" == "24.04" || "$ubuntu_version" == "20.04" ]]; then
        wget 'http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb'
        
        sudo dpkg -i libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb

        target_version="20.04"
    else
        target_version="$ubuntu_version"
    fi

    # Add Microsoft package signing key and repository
    wget https://packages.microsoft.com/config/ubuntu/$target_version/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
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
  output=$(dotnet _zkBitcoinMiner.dll allowCPU=false allowIntel=true allowAMD=true pool=http://pool.zkbitcoin.org:6122 minerAddress=0xF8B99643fAfC79d9404DE68E48C4D49a3936f78 allowCUDA=true web3api=https://mainnet.era.zksync.io abiFile=zkBTC.abi contract=0x366d17aDB24A7654DbE82e79F85F9Cb03c03cD0D MaxZKBTCperMint=50 MinZKBTCperMint=50 HowManyBlocksAWAYFromAdjustmentToSendMinimumZKBTC=500 gasToMine=0.35 gasApiMax=1 gasLimit=1000000 gasApiURL= gasApiPath=$.safeLow gasApiMultiplier=0.1 gasApiOffset=1.0 2>&1 | tee /dev/tty)
  [[ $? -eq 22 ]] || break
done

if [[ "$output" == *"CUDA driver version is insufficient"* && "$output" == *"OpenCL not found"* ]]; then
  echo "Error: Cuda driver version is insufficient for Cuda runtime version."
  echo "ubuntu-drivers is not installed. Reboot system after fresh install"
  sudo apt-get update
  sudo apt-get install -y ubuntu-drivers-common
  sudo ubuntu-drivers autoinstall
  echo "We installed drivers waiting 25 seconds then rebooting machine"
  sleep 25
  sudo reboot
else
  echo "Output says cuda driver version is okay"
  echo "$output"
fi


