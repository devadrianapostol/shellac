#!/bin/sh
echo "getting this directory: $(pwd)" 



echo "creating service file"
touch "svc.service"
echo "[Unit]
After=network.target

[Service]
ExecStart=$(pwd)/svc/shellac/run
WorkingDirectory=$(pwd)
Restart=on-failure
User=ady

[Install]
WantedBy=default.target
" >> svc.service

echo "installing in systemd"
sudo mv svc.service /etc/systemd/system/

sudo chmod 664 /etc/systemd/system/svc.service
sudo systemctl daemon-reload
sudo systemctl enable svc.service
sudo systemctl start svc.service