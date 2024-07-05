#!/usr/bin/env bash

rm -f packages-microsoft-prod.deb

version=$(lsb_release -sr)

case $version in
14.04)
    wget https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb
    ;;
16.04)
    wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
    ;;
17.10)
    wget https://packages.microsoft.com/config/ubuntu/17.10/packages-microsoft-prod.deb
    ;;
18.04)
    wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
    ;;
20.04)
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
    
    wget 'http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb'
        
    sudo dpkg -i libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb
    ;;
22.04)
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
    wget 'http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb'
        
    sudo dpkg -i libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb
    ;;
24.04)
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
    wget 'http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb'
        
    sudo dpkg -i libssl1.1_1.1.1-1ubuntu2.1~18.04.23_amd64.deb
    ;;
*)
    echo "Unrecognized version"
    wget https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb
    ;;
esac

sudo dpkg -P packages-microsoft-prod
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update

rm -f packages-microsoft-prod.deb

sudo apt-get install apt-transport-https -y
sudo apt-get install dotnet-sdk-5.0 -y
