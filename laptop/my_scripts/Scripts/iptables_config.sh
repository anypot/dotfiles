#! /bin/sh
# -t = filter by default

DNS_IP1="212.47.228.136" # scaleway-fr
DNS_PORT1=443
DNS_IP2="151.80.222.79" # opennic-R4SAS
DNS_PORT2=443

##############################################################################
# FLUSH TABLES
iptables -F

##############################################################################
# DEFAULT POLICY = DROP EVERYTHING
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

##############################################################################
# LOOPBACK
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

##############################################################################
# DNS
iptables -A INPUT -p udp -m udp --sport 53 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 53 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT 
iptables -A INPUT -p udp -m udp -s $DNS_IP1 --sport $DNS_PORT1 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -m udp -d $DNS_IP1 --dport $DNS_PORT1 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp -m udp -s $DNS_IP2 --sport $DNS_PORT2 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -m udp -d $DNS_IP2 --dport $DNS_PORT2 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

##############################################################################
# PING
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

##############################################################################
# BROWSER
iptables -A INPUT -p tcp -m multiport --sports 80,443,8000,8080 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --dports 80,443,8000,8080 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT 

##############################################################################
# MAIL CLIENT (posteo.de server)
iptables -A INPUT -p tcp -m tcp --sport 143 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 143 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -m tcp --sport 587 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 587 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

##############################################################################
# SSH CLIENT
iptables -A INPUT -p tcp -m tcp --sport 22 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 22 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

##############################################################################
# TELNET CLIENT
iptables -A INPUT -p tcp -m tcp --sport 23 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 23 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

##############################################################################
# NTP CLIENT
iptables -A INPUT -p udp -m udp --sport 123 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 123 -j ACCEPT

##############################################################################
# GIT CLIENT
iptables -A INPUT -p tcp -m tcp --sport 9418 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 9418 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

##############################################################################
# FTP CLIENT
iptables -A INPUT -p tcp -m tcp --sport 21 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 21 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT
# Active
iptables -A INPUT -p tcp --sport 20 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 20 -m conntrack --ctstate ESTABLISHED -j ACCEPT
# Passive
iptables -A INPUT -p tcp --sport 1024: --dport 1024: -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --sport 1024: --dport 1024: -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

#############################################################################
# SYNCTHING
iptables -A INPUT -p tcp -m tcp --sport 22000 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 22000 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p udp -m udp --sport 21027 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 21027 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

##############################################################################
# GOOGLE MEET
iptables -A INPUT -p udp -m udp --sport 19302:19309 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p udp -m udp --dport 19302:19309 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

##############################################################################
# SAVING RULES AND RESTART
iptables-save > /etc/iptables/iptables.rules
systemctl restart iptables


##############################################################################
# IPV6
##############################################################################
# FLUSH TABLES
ip6tables -F

##############################################################################
# DEFAULT POLICY = DROP EVERYTHING
ip6tables -P INPUT DROP
ip6tables -P OUTPUT DROP
ip6tables -P FORWARD DROP

##############################################################################
# LOOPBACK
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A OUTPUT -o lo -j ACCEPT

##############################################################################
# PING
ip6tables -A INPUT -p icmpv6 --icmpv6-type echo-reply -j ACCEPT
ip6tables -A OUTPUT -p icmpv6 --icmpv6-type echo-request -j ACCEPT

##############################################################################
# BROWSER
ip6tables -A INPUT -p tcp -m multiport --sports 80,443,8000,8080 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
ip6tables -A OUTPUT -p tcp -m multiport --dports 80,443,8000,8080 -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

ip6tables-save > /etc/iptables/ip6tables.rules
systemctl restart ip6tables

