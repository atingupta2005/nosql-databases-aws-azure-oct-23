# Download RStudio Server for Debian & Ubuntu
- Refer: https://www.rstudio.com/products/rstudio/download-server/debian-ubuntu/
```
sudo apt -y update
sudo apt install -y libssl
sudo apt-get -y install r-base 
```

```
wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.06.2-561-amd64.deb
```

```
sudo gdebi rstudio-server-2023.06.2-561-amd64.deb
```

```
curl http://localhost:8787
```
