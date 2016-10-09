#!/bin/bash

. ~/.colorful
cleancmd='rm ./scaffolds/*'
cleanposts='rm ./source/_posts/*'

eval $cleancmd
eval $cleanposts

echo "clean finished!"
src=('~/code/alglib/leetcode/blog/' '~/code/note/mybook/')
for i in ${src[@]}
do
    cpcmd="cp $i*.md ./scaffolds/"
    eval $cpcmd
done

echo "move all blog in scaffolds done!"

for i in `ls scaffolds/`
do 
	b=`echo $i | cut -d. -f1`
    hexo new $b $b
done

echo "generage finished"
hexo g
