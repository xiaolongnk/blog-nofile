#!/bin/bash

. ~/.colorful
marg=$2

function generate()
{

    echo "clean finished!"
    src=("$HOME/code/alglib/leetcode/blog" "$HOME/code/note/mybook")
    for i in ${src[@]}
    do
        src_cmd=''
        if [ $marg = 'all'  ]
        then
            src_cmd="find $i -name '*.md' -mtime -300 -type f"
            #cleanposts='rm -rf ./source/_posts/*'
            #eval $cleanposts
        elif [ $marg = 'latest' ]
        then
            src_cmd="find $i -name '*.md' -mmin -60 -type f"
        else
            echo "invalidate parameters"
            exit 1
        fi
        for j in `eval $src_cmd`
        do
            cp $j ./scaffolds
            b=`echo $j | awk -F "/" '{print $NF}' | awk -F "." '{print $1}'`
            rm_old_posts=`echo $b | sed 's/_/-/'`
            rm -rf ./source/_posts/$rm_old_posts* > /dev/null
            hexo new $b $b
        done
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
    gen    ) generate $2;;
    deploy ) deploy;;
    *        ) echo "no support args";;
esac

