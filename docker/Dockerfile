FROM lfendy/vim8

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "sudo", "-y"]
RUN ["useradd", "someuser", "-G", "sudo", "-p", "$1$yEoegdSc$bFV7vnJ.fmwexAWnGNBhc/"]
WORKDIR /home/vimuser
RUN ["git", "clone", "https://github.com/JodaOrg/joda-time.git", "/home/vimuser/joda-time"]
RUN ["apt-get", "install", "exuberant-ctags", "-y"]
COPY file.txt /home/vimuser/largefile.txt
RUN ["chown", "-R", "someuser:someuser", "/home/vimuser"]
