rm -rf source/_posts/* 

if [ ! -d Memo ];then 
    git clone --depth 1 https://gitee.com/gin9/Memo.git
else 
    cd Memo && git pull && cd ..
fi

cp -r Memo source/_posts/
cd source/_posts/Memo

find . -iname "*readme*" | xargs rm -f 
rm -rf .git
rm -f .gitignore LICENSE sync_notes.sh wordRecord.sh SUMMARY*

cd ../../../

hexo clean && hexo g

