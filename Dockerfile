FROM alpine
MAINTAINER Uwe Schwarz, git@iq42.de

RUN apk add mutt msmtp vim

RUN adduser -D --gecos '' mutt
WORKDIR /home/mutt
USER mutt

ENTRYPOINT /bin/ash -c 'if [ -f ~/.muttrc -a -f ~/.msmtprc ] ; then /usr/bin/mutt ; else echo "ERROR: /home/mutt/.muttrc or /home/mutt/.msmtprc not found." ; fi'
