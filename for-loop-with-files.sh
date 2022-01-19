!#/bin/bash

list="folder1 folder2"
for i in ${list}; do
    echo $i
    rsync -rv ./path/ "./$i/path/"
done
