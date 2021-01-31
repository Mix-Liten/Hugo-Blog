---
title: 在-macOS-上建立-Laradock-環境
tags: [docker, laravel]
category: [laravel]
draft: false
toc: true
date: 2019-12-22 21:08:39
---

## 前言
[Laradock](https://laradock.io/) 是~~一款簡單食用的APP~~一種輕鬆簡便安裝 Laravel 環境的開源專案，相較於官網提供的 [Homestead 虛擬機](https://laravel.com/docs/6.x/homestead)在更新版本的不便以及過多用不到的配置，Laradock 提供了`更多的自由度`且同時有 Docker `開箱即用的便利性`。

以下篇幅可能略長，但大多是在建置時可能會遇到的問題，沒遇到問題可直接略過該步驟，另外其實大多數步驟在 Windows 系統也可以比照辦理。

## 步驟

1. 安裝 [Docker](https://docs.docker.com/docker-for-mac/install/)

下載前要先註冊會員，下載後打開應用登入運行就可以不管它了。

2. 安裝 [Laradock](https://laradock.io/)

打開 CMD 或同等功用的 Command Line，依照下方範例逐行執行
```BASH
cd ~/Documents/Laravel
git clone https://github.com/Laradock/laradock.git
cd laradock
cp env-example .env
```
第一行 cd 進入的位置 `可任意更換為你想要放 Laradock 專案的位置`
第四行 cp 即是 `複製 env-example 並更名為 .env`

3. 修改 `.env` 檔

```
APP_CODE_PATH_HOST=~/Documents/PHPProject
```
後方位置請設定為預備要映射進虛擬機裡的放置專案的資料夾

```
MYSQL_VERSION=5.7
```
MySQL 預設的版本是 latest，但這會有個延伸問題，如果你真想要用最新版本的 MySQL，就再多做一個步驟
於 `laradock/mysql/my.cnf` 新增下面這一行並儲存
```
default_authentication_plugin=mysql_native_password
```

4. 建立 Laravel 專案

```BASH
cd ~/Documents/PHPProject
laravel new testProject
```
如果出現錯誤說無法識別 laravel 指令，請參考[官方文件](https://laravel.com/docs/6.x)安裝 `laravel/installer`

接著修改修改該專案的 `.env` 檔

```ENV
DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=testDatabase
DB_USERNAME=default
DB_PASSWORD=secret
```
這個連資料庫的帳號是 Laradock 運行 MySQL image 時建立的一般用戶，也可更換為資料庫中開通所有權力的帳戶，`DB_USERNAME` 及 `DB_PASSWORD` 皆為 `root`

5. 設定 nginx 站點

```BASH
cd ~/Documents/Laravel/laradock/nginx/sites
cp laravel.conf.example laravel.test.conf
```

接著用文字編輯器打開 `laravel.test.conf` 並修改
```
server_name test.com;
root /var/www/testProject/public;
```
請自行替換自己想要的網址於 `server_name`，以及替換專案名稱

6. 註冊虛擬主機別名

macOS使用者 請於 `Finder` 的 `前往/前往檔案夾...` 輸入 `/private/etc/hosts`
之後複製 hosts 檔至 Desktop，並以文字編輯器在其中新增下方內容，最後貼回去覆蓋掉 `/private/etc/hosts`

```
127.0.0.1 test.com
```

7. 安裝並運行虛擬機

先確定 cmd 目前位置在 laradock 專案中，接著運行下方指令，然後等待一段時間讓它安裝虛擬機
```BASH
docker-compose up -d nginx mysql
```

8. 進入 MySQL image 建立專案所用的資料庫

進入 MySQL image
```BASH
docker-compose exec mysql bash
```

登入資料庫並建立資料庫
```
mysql --user="root" --password="root"
CREATE DATABASE `testDatabase`;
```

離開資料庫及 image 的方式皆為 `exit`

9. 進入運行中的 container 執行專案的資料庫遷移

進入 container
```BASH
docker-compose exec workspace bash
```

執行遷移
```BASH
cd testProject
php artisan migrate
```

10. 測試網站是否建立成功

瀏覽器網址輸入：<http://test.com/>

11. 關閉運行中的 container

```BASH
docker-compose stop
```

## 結語
步驟七可能會受到網速影響，順利的話，應該可以在一小時內建置完成。
有問題可留言詢問，或是自行餵狗。
