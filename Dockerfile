FROM debian
RUN echo 'echo 1 ' >/1.sh
RUN apt update
RUN apt install ssh wget npm -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'service sshd restart' >>/1.sh
RUN echo 'wstunnel -s 0.0.0.0:80 ' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Tu!192168|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80
CMD  /1.sh 
