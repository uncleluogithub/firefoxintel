FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install firefox-esr mate-system-monitor  git lxde tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz
RUN tar -xvf v1.2.0.tar.gz
RUN mkdir  $HOME/.vnc
RUN echo 'TuTu' | vncpasswd -f > $HOME/.vnc/passwd
RUN chmod 600 $HOME/.vnc/passwd
RUN echo 'whoami ' >>/tu.sh
RUN echo 'cd ' >>/tu.sh
RUN echo " 'vncserver :2000 -geometry 1360x768' "  >>/tu.sh
RUN echo 'cd /noVNC-1.2.0' >>/tu.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 8900 ' >>/tu.sh
RUN chmod 755 /tu.sh
EXPOSE 80
CMD  /tu.sh 
