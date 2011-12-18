#!/bin/bash

function ips {
  ifconfig | grep "inet " | awk '{ print $2 }'
}

function myip {
  res=$(curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+')
  echo "Your public IP is: ${bold_green} $res ${normal}"
}

# check to see if a domain is registered or not
function isreg {
  dig soa $1 | grep -q ^$1 && echo "${bold_red}Sorry! it's already registered.${normal}" || echo "${bold_green}No, You can go and register it for yourself :) ${normal}"
}

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias http_dump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""