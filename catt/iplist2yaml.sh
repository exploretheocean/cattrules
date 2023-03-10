#!/bin/bash

# change from '.list' form to '.yaml' form
D=.
list=$D/$1
yaml=$D/$(basename ${list} ".list").yaml
cat ${list} | sed "s/^IP-CIDR6*,/  - '/g" | sed "s/,no-resolve/'/" | sed '1i\payload:' > $yaml
