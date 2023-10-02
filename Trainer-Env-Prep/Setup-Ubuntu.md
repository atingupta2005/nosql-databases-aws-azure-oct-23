# Trainer Tasks
## VM Configuration
- RAM: 8 GB
- CPU Cores: 4

## Install packages
```
sudo apt update
sudo apt install -y tree zip vim nano ranger net-tools iputils-ping
sudo groupadd docker
```


## Setup multiple users in Ubuntu
- For each participant, we need to setup login accounts
```
for ((i=1;i<=9;i++)); do
	export username="u0$i"
	sudo useradd -g docker -m -p "p" $username;sudo usermod -aG sudo $username;echo $username:p | sudo /usr/sbin/chpasswd;sudo chown -R  $username:root /home/$username
done


for ((i=10;i<=50;i++)); do
	export username="u$i"
	sudo useradd -g docker -m -p "p" $username;sudo usermod -aG sudo $username;echo $username:p | sudo /usr/sbin/chpasswd;sudo chown -R  $username:root /home/$username
done
```

## Install docker
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
sudo usermod -aG sudo $USER
sudo apt -y install docker-compose
```


## Enable Swap space
```
sudo sh -c 'cat << EOF >> /var/lib/cloud/scripts/per-boot/create_swapfile.sh
#!/bin/sh
if [ ! -f '/mnt/swapfile' ]; then
fallocate --length 64GiB /mnt/swapfile
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile
swapon -a 
else
swapon /mnt/swapfile; fi
EOF'
```

```
sudo chmod +x /var/lib/cloud/scripts/per-boot/create_swapfile.sh
```


```
sudo reboot
```

```
free -m
```

## AWS CLI

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
aws configure
aws s3 ls
```

- Node: Region: us-east-1

## Install Python
```
sudo apt install -y python3.10-venv python3-pip
sudo chmod -R 777 /pyenv
python3 -m venv /pyenv
source /pyenv/bin/activate
sudo mkdir -p /workdir
sudo chmod -R 777 /workdir
cd /workdir
pip install jupyter
nohup jupyter notebook --ip 0.0.0.0 --port 8888 &
```

## Set password
```
New Jupyter password: jupyter123
```