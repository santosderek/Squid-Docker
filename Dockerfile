FROM ubuntu:latest

RUN apt-get update && apt-get install squid apache2-utils -y

RUN touch /etc/squid/passwd

RUN htpasswd -b /etc/squid/passwd UserNameHere PasswordHere

RUN rm /etc/squid/squid.conf

RUN echo "alias logs='tail -f /var/log/squid/access.log'" >> ~/.bashrc

COPY squid.conf /etc/squid/

EXPOSE 1234

RUN service squid start