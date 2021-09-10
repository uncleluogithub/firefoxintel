FROM debian
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install firefox-esr mate-system-monitor  git lxde tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz
RUN tar -xvf v1.2.0.tar.gz
RUN mkdir  /root/.vnc
RUN echo 'TuTu' | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
RUN echo 'cd /root' >>/tu.sh
RUN echo "su root -l -c 'vncserver :2000 -geometry 1360x768' "  >>/tu.sh
RUN echo 'cd /noVNC-1.2.0' >>/tu.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 80 ' >>/tu.sh
RUN echo root:Tu!192168|chpasswd
RUN chmod 755 /tu.sh
EXPOSE 80
CMD  /tu.sh 
