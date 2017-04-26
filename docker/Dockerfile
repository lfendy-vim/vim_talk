FROM lfendy/vim8

RUN ["apt-get", "update"]
RUN ["apt-get", "install", "sudo", "autoconf", "-y"]
RUN ["useradd", "someuser", "-G", "sudo", "-p", "$1$yEoegdSc$bFV7vnJ.fmwexAWnGNBhc/"]
WORKDIR /home/someuser
RUN ["git", "clone", "https://github.com/JodaOrg/joda-time.git", "/home/someuser/joda-time"]
RUN ["git", "clone", "https://github.com/universal-ctags/ctags.git", "/home/someuser/ctags"]
RUN cd /home/someuser/ctags && \
    ./autogen.sh && \
    ./configure && \
    make && \
    sudo make install
ENV VIMRUNTIME /usr/share/vim/vim80
ADD files/bashrc /home/someuser/.bashrc
ADD files/vimrc /home/someuser/.vimrc
RUN mkdir -p /home/someuser/.vim/pack/myplugins/start/
RUN ["git", "clone", "https://github.com/metakirby5/codi.vim", "/home/someuser/.vim/pack/myplugins/start/codi.vim"]

RUN mkdir -p /home/someuser/sample/
ADD files/httpd.conf /home/someuser/sample/httpd.conf
RUN ["chown", "-R", "someuser:someuser", "/home/someuser"]


ADD files/createlargefile.sh /home/someuser/sample/createlargefile.sh
ADD files/dictionary /home/someuser/sample/dictionary
ADD files/minvimrc /home/someuser/sample/minvimrc
ADD files/sanevimrc /home/someuser/sample/sanevimrc
RUN chown -R someuser:someuser /home/someuser/sample/

ADD files/root_owned_file.conf /home/someuser/sample/root_owned_file.conf
