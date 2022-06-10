#!/bin/bash
BYellow='\033[1;33m'
ENDCOLOR='\e[0m'

echo ""
echo -e "$BYellow Uninstall old versions ...$ENDCOLOR\n"
sudo apt-get remove --purge -y docker docker-engine docker.io containerd runc
#==========================================================================#
echo ""
echo -e "$BYellow Set up the Docker Engine repository ... $ENDCOLOR\n"
sudo apt-get update
sudo apt-get install -y \
ca-certificates \
curl \
gnupg \
lsb-release
#==========================================================================#
echo ""
echo -e "$BYellow Add Docker’s official GPG key ... $ENDCOLOR\n"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
#==========================================================================#
echo ""
echo -e "$BYellow set up the Docker Compose repository ... $ENDCOLOR\n"
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#==========================================================================#
echo ""
echo -e "$BYellow Install Docker Engine ...$ENDCOLOR \n"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo ""
echo -e "$BYellow Install Docker Engine completed...$ENDCOLOR \n"
#==========================================================================#
echo ""
echo -e "$BYellow Install Docker Compose ... $ENDCOLOR\n"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
echo ""
echo -e "$BYellow Docker Compose version is ... $ENDCOLOR\n"
docker-compose --version
echo ""
echo -e "$BYellow Install Docker Compose completed... $ENDCOLOR\n"

