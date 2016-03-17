#!/bin/bash

# IPv4

   ##
   ## set default policies to let everything in
   iptables --policy INPUT   ACCEPT;
   iptables --policy OUTPUT  ACCEPT;
   iptables --policy FORWARD ACCEPT;

   ##
   ## start fresh
   iptables -Z; # zero counters
   iptables -F; # flush (delete) rules
   iptables -X; # delete all extra chains


iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
