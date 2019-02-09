FROM alpine:edge

#RUN apk add --no-cache curl

RUN apk add --no-cache tor && \
    sed "1s/^/SocksPort 0.0.0.0:9050\n/" /etc/tor/torrc.sample > /etc/tor/torrc
    #sed "1s/^/ControlPort 0.0.0.0:9051\n/" /etc/tor/torrc > /etc/tor/torrc

# https://wiki.alpinelinux.org/wiki/Alpine_Linux_Init_System
# https://wiki.gentoo.org/wiki/Tor#Services

EXPOSE 9050
#EXPOSE 9051

#VOLUME ["/var/lib/tor"]

#COPY bootstrap.sh /root/bootstrap.sh
#RUN chmod 755 /root/bootstrap.sh

USER tor

#curl --socks5 127.0.0.1:9050 http://checkip.amazonaws.com/

CMD ["/usr/bin/tor"]
#CMD ["/root/bootstrap.sh"]
#CMD ["/root/bootstrap.sh", "/usr/bin/tor"]