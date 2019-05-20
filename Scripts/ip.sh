#!/bin/bash
for ip in  $(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
do
IP=$ip
export IP
sleep 10
done
