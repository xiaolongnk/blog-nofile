## 我的个人博客

####  主要内容

技术积累。[个人网站](https://blog.nofile.cc)在这里。

#### 技术支持

基于hexo实现，写文章比较麻烦，正在考虑其他方式。
gen.sh 用来从内容目录抓取对应的md，然后按照hexo的格式处理，自动生成hexo内容，提高写文章的效率。
只用在内容目录写内容，不应该在这里写。这里面的内容都是不可靠的。脚本执行过程中会自动删除public
等几个目录下的内容，请不要在这些目录下存放重要内容。

gen.sh deploy 可以将public的内容scp到你配置好的server上。
gen.sh gen    可以执行对应的内容抓取，将相应的内容抓取过来。
使用gen.sh的时候需要先进行配置，配置好你的内容源，详情请参考代码。
