sudo useradd vimuser -g users -G sudo,docker -b /Home/vimuser -s /bin/bash
passwd vimuser
sudo usermod -a -G dockeronly vimuser
