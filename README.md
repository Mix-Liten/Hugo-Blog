#使用手冊

## 預覽
```sh
$ hugo server
# -D 同時預覽草稿
```

## 開新篇
``` sh
$ sh newPost.sh
# Input New Post Name: <name>
# Output to content/posts/YYYY/MM/YYYY-MM-DD-<name>.md
```

## 佈版
``` sh
$ sh deploy.sh
# cd public
# git commit "rebuilding site `date`"
# git push origin master
```
