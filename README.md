#使用手冊

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
