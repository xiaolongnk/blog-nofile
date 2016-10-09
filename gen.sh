#!/bin/bash


function generate()
{
    . ~/.colorful
    cleancmd='rm ./scaffolds/*'
    cleanposts='rm -rf ./source/_posts/*'
    cleanpublic='rm -rf ./public'

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

    echo "generate finished"
    hexo g
}

function deploy()
{
    scp -r ./public/* work@101.200.154.217:~/code/blog/
    echo "deploy finished!"
}

case $1 in
    gen    ) generate;;
    deploy ) deploy;;
    *        ) echo "no support args";;
esac

