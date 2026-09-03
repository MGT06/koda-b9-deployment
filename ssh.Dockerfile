FROM ubuntu:jammy

RUN apt-get update && apt-get install openssh-server -y
RUN useradd -ms /bin/bash given && passwd -l given

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

RUN mkdir /home/given/.ssh

COPY mykey.pub /home/given/.ssh/authorized_keys

RUN chown -R given:given /home/given/.ssh

CMD [ "sh", "-c", "service ssh start; tail -f /dev/null" ]
