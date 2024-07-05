# zkBitcoin-Testnet-Linux-Paymaster-Miner
# Installing Script on Linux

Go to download Folder and
run 'sh install-deps.sh' to install dependencies.

sudo apt install build-essential

sudo apt install pkg-config libglvnd-dev

Download your graphics card driver
https://www.nvidia.com/download/index.aspx

sudo sh NVIDIA-Linux-x86_64-525.60.11.run

For NOUVEAU ERROR
https://askubuntu.com/questions/841876/how-to-disable-nouveau-kernel-driver


IF SCREEN RESOLUTION IS MESSED UP DO next two steps
1) sudo nvidia-xconfig

2) https://askubuntu.com/questions/441040/failed-to-get-size-of-gamma-for-output-default-when-trying-to-add-new-screen-res
Go to Downloaded Folder and Open Terminal


TO RUN SCRIPT OPEN TERMINAL IN FOLDER AND TYPE

chmod u+x 1zkBTCMiner.sh  or right click the file -> Properities -> Permissions and check "Allow executing file as Program"



chmod u+x 1zkBTCMiner.sh or right click the file -> Properities -> Permissions and check "Allow executing file as Program"

./1zkBTCMiner.sh

to run the miner

or

./1zkBTCMiner.sh

Mines normally using your eth account to mint the tokens

It should run!

Edit the 1zkBTCMiner.sh file and _zkBitcoinMiner.conf to edit your settings




# For Ubuntu 20.04

wget http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run -O ~/cuda_tmp/cuda.run

sudo ./cuda_10.2.89_440.33.01_linux.run

sudo chmod +x cuda_10.2.89_440.33.01_linux.run

dont install 440 just the 10.2 toolkit

# we had to install gcc 8

Install the Desired GCC Version:
Install the version of GCC that you want to use for the rest of your system. For example, if you want to use GCC 8(which is available in the Ubuntu 18.04 repositories), you can install it with the following command:

bash

sudo apt-get install gcc-8 g++-8

Select the Default GCC Version:
Use the update-alternatives command to set the default GCC version to the one you just installed. For example, if you installed GCC 8:

bash

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 100

Select the Default GCC Version:
Use the update-alternatives command again to choose the default GCC version:

bash

sudo update-alternatives --config gcc
sudo update-alternatives --config g++

Select the version you want to set as default from the list.

Verify the GCC Version:
Confirm that the desired GCC version is now the default:

bash

    gcc --version

    This should display the version information for the GCC version you selected.

Now, you should have the desired GCC version as the default for your system, and you can proceed with your CUDA installation without the --override flag, using the newly selected GCC version. (edited)
[5:52 AM]
The error message you received indicates that the Nouveau kernel driver is currently in use on your system. The NVIDIA driver cannot be installed while Nouveau is active because they are incompatible. To proceed, you need to disable the Nouveau driver. Here's how you can do that:

    Edit the Grub Configuration:

    Open the Grub configuration file in a text editor using the following command:

    bash

sudo nano /etc/default/grub

Locate the line that starts with GRUB_CMDLINE_LINUX_DEFAULT and add "nouveau.modeset=0" to the kernel boot options. It should look something like this:

bash

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nouveau.modeset=0"

Save the file and exit the text editor.

Update Grub:

After making the changes, update the Grub configuration with the following command:

bash

sudo update-grub

Blacklist Nouveau:

Create a file to blacklist the Nouveau driver. Create a new file called nouveau-blacklist.conf in the /etc/modprobe.d/ directory:

bash

sudo nano /etc/modprobe.d/nouveau-blacklist.conf

Add the following lines to the file:

bash

blacklist nouveau
options nouveau modeset=0

Save the file and exit the text editor.

Regenerate Initramfs:

Regenerate the initramfs to apply the changes:

bash

sudo update-initramfs -u

Reboot:

Reboot your system to apply the changes:

bash

sudo reboot

sudo ubuntu-drivers autoinstall
