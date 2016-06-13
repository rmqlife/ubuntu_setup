#!/bin/zsh
scp ~/.ssh/id_rsa.pub li1.rmqlife.com:
ssh li1.rmqlife.com "cat id_rsa.pub >> .ssh/authorized_keys && rm id_rsa.pub"
