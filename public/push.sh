#!/bin/bash

# generate newest urls.txt
grep -E --color=no -o "https:.*?</loc>" baidusitemap.xml | sed "s/<\/loc>//" > urls.txt

#submit urls.txt file to baiduspider
curl -H 'Content-Type:text/plain' --data-binary @urls.txt "http://data.zz.baidu.com/urls?site=https://blog.nofile.cc&token=YIxiIeMgg0wocEEP" >> push.log
echo `date` >> push.log
