FROM lfendy/vim8

RUN apt-get update && \
    apt-get install sudo autoconf -y && \
    git clone --depth 1 https://github.com/JodaOrg/joda-time.git /home/someuser/joda-time && \
    git clone --depth 1 https://github.com/universal-ctags/ctags.git /home/someuser/ctags && \
    cd /home/someuser/ctags && \
    ./autogen.sh && \
    ./configure && \
    make && \
    sudo make install && \
    gem install starscope && \
    mkdir -p /home/someuser/.vim/pack/myplugins/start/ && \
    git clone --depth 1 https://github.com/metakirby5/codi.vim /home/someuser/.vim/pack/myplugins/start/codi.vim && \
    apt-get install gawk -y && curl -L git.io/trans -o /bin/trans && chmod +x /bin/trans
RUN ["useradd", "someuser", "-G", "sudo", "-p", "$1$yEoegdSc$bFV7vnJ.fmwexAWnGNBhc/"]
WORKDIR /home/someuser
RUN mkdir -p /home/someuser/sample
ADD files/ /home/someuser/sample

RUN mv /home/someuser/sample/bashrc /home/someuser/.bashrc && \
    mv /home/someuser/sample/vimrc /home/someuser/.vimrc && \
    chown -R someuser:someuser /home/someuser && \
    chown root:root /home/someuser/sample/root_owned_file.conf

RUN sudo apt-get install nodejs -y
RUN git clone --depth 1 https://github.com/nathansobo/treetop /home/someuser/treetop
RUN chown -R someuser:someuser /home/someuser/treetop
RUN sudo apt-get install cscope -y
