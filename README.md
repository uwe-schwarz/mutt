# mutt
[mutt](http://mutt.org) in a [Docker](https://www.docker.com) container.

# configuration

*On the host system, create a folder `~/.mutt/`. In this folder, create the configuration files as follows:*

## msmtp configuration

[msmtp](https://marlam.de/msmtp/) is a very simple MTA. It is configured _on the host system_ in a file `~/.mutt/.msmtprc` as follows:

```
defaults
logfile ~/.msmtp.log

account   bob
host      mail.example.com
from      bot@example.com
auth      on
tls       on
user      bob
password  xxxxxxxx

account   default : bob
```

Then do: `chmod 600 ~/.mutt/.msmtprc`.

## mutt configuration

[mutt](http://mutt.org) is configured _on the host system_ in `~/.mutt/.muttrc`. 

```
#########################
# sending with msmtp
#########################

set sendmail="/usr/bin/msmtp"
set use_from=yes
set realname="Bob Mallet"
set from=bob@example.com
set envelope_from=yes

#########################
# receiving with imap
#########################

set folder="imaps://bob:xxxxxxx@mail.example.com"
set spoolfile="+INBOX"
set record="+Sent"
set postponed="+Drafts"
set trash="+Trash"
set header_cache = "/home/mutt/.mutt_cache"
set message_cachedir = "/home/mutt/.mutt_cache"

set imap_check_subscribed
set mail_check=60

#########################
# usability
#########################

set editor="vim"
```

Create the mutt cache directory `~/.mutt/.mutt_cache/` _on the host system_ and change access rights of `~/.mutt` to `700`: `chmod 700 ~/.mutt`.

# start docker container

```bash
docker run -v ~/.mutt:/home/mutt -ti e38383/mutt
```
