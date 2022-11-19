#|------------------------------------------------------------|
#|                                                            |
#|   Copyright (C) 2022 SamPandey001                          |
#|   Secktor UB 2022                                          |
#|   First Whatsapp Userbot with shell script program,        |
#|   to install in any environment                            |
#|   @author : SamPandey001                                   |
#|   @description: Secktor,A Multi-functional whatsapp bot.   |
#|                                                            |
#|------------------------------------------------------------|

pause() {
    read -n1 -r -p "Press any key to start process..." key
apt-get update
apt-get upgrade
}

getinfo() {
    if [[ "$OSTYPE" == linux-android* ]]; then
            distro="termux"
    fi

    if [ -z "$distro" ]; then
        distro=$(ls /etc | awk 'match($0, "(.+?)[-_](?:release|version)", groups) {if(groups[1] != "os") {print groups[1]}}')
    fi

    if [ -z "$distro" ]; then
        if [ -f "/etc/os-release" ]; then
            distro="$(source /etc/os-release && echo $ID)"
        else 
            distro="invalid"
        fi
    fi
}

envinfo(){
    declare -A backends; backends=(
        ["arch"]="pacman -S --noconfirm"
        ["debian"]="apt-get -y install"
        ["ubuntu"]="apt -y install"
        ["termux"]="apt -y install"
        ["fedora"]="yum -y install"
        ["redhat"]="yum -y install"
        ["SuSE"]="zypper -n install"
        ["sles"]="zypper -n install"
        ["darwin"]="brew install"
        ["alpine"]="apk add"
    )

   INSTALL="${backends[$distro]}"

    if [ "$distro" == "termux" ]; then
        SUDO=""
    else
        SUDO="sudo"
    fi
}

install_packages(){
    
    packages=(git curl ffmpeg figlet)
    if [ -n "$INSTALL" ];then
        for package in ${packages[@]}; do
            $SUDO $INSTALL $package
        done
    else
        echo "Secktor could not install dependencies,exiting process."
        exit
    fi
}
clear
pause
clear
$SUDO sudo apt -y remove nodejs
curl -fsSl https://deb.nodesource.com/setup_lts.x | $SUDO bash - && $SUDO apt -y install nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | $SUDO apt-key add - 
echo "deb https://dl.yarnpkg.com/debian/ stable main" | $SUDO tee /etc/apt/sources.list.d/yarn.list
$SUDO apt -y update && $SUDO apt -y install yarn
getinfo
envinfo
install_packages
clear
figlet Secktor
echo "Cloning Secktor git repo..."
read -p "Enter Your github username: " secktor
git clone https://github.com/"${secktor}"/Secktor-Md
cd Secktor-Md
clear
echo "Installing required packages,it will take time..."
pauseagain() {
echo -e "\e[4;34mMake sure you have filled vars in \e[1;32mconfig.env\e[0m"
    read -n1 -r -p "Press any key to continue..." key
}
pauseagain
clear
yarn install --network-concurrency 1
clear
echo "Installed packages.."
echo "Starting Bot Server..."
clear
figlet Secktor
read -p "Enter Your Owner Number: " owner
echo "OWNER_NUMBER=${owner}" >> config.env
#--------------------------------------------
read -p "Enter Your Mongodb uri: " mongo
echo "MONGODB_URI=${mongo}" >> config.env
#--------------------------------------------
read -p "Enter Your SESSION_ID: " session
echo "SESSION_ID=${session}" >> config.env
clear
figlet Vars
cat config.env
read -n1 -r -p "Press any key to continue..." key
clear
figlet SpeedY
echo "TheSpeedY"
echo "To stop bot: ctrl+c"
node lib/client.js
