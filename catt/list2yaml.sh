#!/bin/bash

# change from '.list' form to '.yaml' form
D=.
list=$D/$1
yaml=$D/$(basename ${list} ".list").yaml
kwd=$D/$(basename ${list} ".list")-kwd.list
ip=$D/$(basename ${list} ".list")-ip.list
grep -v IP-CIDR $list |grep -v KEYWORD | sed "s/^DOMAIN-SUFFIX,/  - '+./g" | sed "s/^DOMAIN,/  - '/g" | sed "/  - '/ s/$/&'/" | sed '1i\payload:' > $yaml

# get 'DOMAIN-KEYWORD'
grep KEYWORD $list > $kwd

# get 'IP-CIDR'
grep IP-CIDR $list > $ip
