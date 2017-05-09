#!/bin/bash
grep -E --color=no -o "https:.*?</loc>" baidusitemap.xml | sed "s/<\/loc>//" > urls.txt
curl -H 'Content-Type:text/plain' --data-binary @urls.txt "http://data.zz.baidu.com/urls?site=https://blog.nofile.cc&token=YIxiIeMgg0wocEEP"
