FROM imiell/vim8

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "sudo", "-y"]
RUN ["useradd", "someuser", "-p", "`openssl passwd -1 somepassword`"]