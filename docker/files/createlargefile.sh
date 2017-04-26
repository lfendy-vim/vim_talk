#!/bin/bash
ruby -e 'a=STDIN.readlines;10000000.times do;b=[];10.times do; b << a[rand(a.size)].chomp end; puts b.join(" "); end' < ./dictionary > largefile.txt
