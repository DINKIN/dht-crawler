#!/bin/bash

torrent_list="torrent.list"

grep "info_hash_crawler" $1 |awk -F "info_hash_crawler:" '{print $2}'|sort -u | awk '{
        code=toupper($1);
        head=substr(code,0,2)
        tail=substr(code,39,2)
        print "http://bt.box.n0808.com/"head"/"tail"/"code".torrent"
        
    }' > $torrent_list

mkdir -p torrentdb
cd torrentdb

while read line;do
    echo $line
    wget $line
    sleep 1
done < "../"$torrent_list


