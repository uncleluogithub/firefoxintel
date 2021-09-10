FROM ubuntu
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install firefox mate-system-monitor ssh git lxde tightvncserver wget npm apache2 php php-curl  mysql-server php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring  php-xml php-pear php-bcmath  -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_wstunnel
RUN a2enmod  rewrite
RUN wget https://raw.githubusercontent.com/jinshulumengchuang/tuhttpd3/main/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf
RUN mv 000-default.conf /etc/apache2/sites-available
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz
RUN tar -xvf v1.2.0.tar.gz
RUN mv noVNC-1.2.0 /
RUN echo 'Is Tutu!' >/var/www/html/index.html
RUN echo 'wstunnel -s 0.0.0.0:8989 & ' >>/tu.sh
RUN echo 'service mysql restart' >>/tu.sh
RUN echo 'service apache2 restart' >>/tu.sh
RUN echo 'cd /root' >>/tu.sh
RUN echo 'vncserver :2000 -SecurityTypes None '
RUN echo 'cd /noVNC-1.2.0' >>/tu.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 8888 &' >>/tu.sh
RUN echo '/usr/sbin/sshd -D' >>/tu.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Tu!192168|chpasswd
RUN chmod 755 /tu.sh
EXPOSE 80
CMD  /tu.sh 
