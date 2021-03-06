---
title: "NPM Package.json 使用概述"
date: 2021-03-06T13:27:00+08:00
draft: false
toc: true
categories: 
  - Other
tags: 
  - dev
  - npm
---

## 前言

有在接觸網頁相關領域的人一定都會用到 Node.js 及和它配套的 npm 套件管理工具，使用 npm 的第一步首先要使用指令 `npm init` 進行初始化，建出一個檔名為 `package.json` 的設定檔，前陣子發現，用了這麼久，卻對 package 裡零零總總的設定不怎麼了解，就大致研究一下。

[package 設定檔案_官方文件](https://docs.npmjs.com/files/package.json "官方文件")

## 前置步驟

### 初始化

首先先執行指令 `npm init`，並依序對每個詢問的部分填入示範用內容

```json
{
  "name": "package_name",
  "version": "1.0.0",
  "description": "package_description",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "git+ssh://git@github.com/GitHub_id/repository_name.git"
  },
  "keywords": ["project"],
  "author": "author_name",
  "license": "ISC",
  "bugs": {
    "url": "https://github.com/GitHub_id/repository_name/issues",
    "email": "project@hostname.com"
  },
  "homepage": "https://github.com/GitHub_id/repository_name#readme"
}
```

## 屬性介紹

- ### name
  
  專案名，有些命名限制，自行參照文件，另由於套件過多，為避免重複，現在新增的套件會再上傳後要安裝，套件名會加上帳號前綴

- ### version
  
  版本號

- ### description
  
  專案描述，有助於增加專案公開度

- ### keywords
  
  專案關鍵字，有助於增加專案公開度

- ### homepage
  
  專案首頁，可放形像宣傳頁網址

- ### bugs
  
  回報專案 bug 的途徑，因 npm 是個公開的平台，讓其他想改進專案的人可以聯絡到原作者

- ### license
  
  專案版權宣告，預設是 ISC，在 [Github 建立新 repository](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/licensing-a-repository) 時也可以選擇各種樣板

  UNLICENSED，不授權

  ISC 版權宣告細節如下，大意是，免費提供程式碼，不管任何用途，若商用虧錢也不關作者的事

  ```md
  Copyright (c) [year], [fullname]

  Permission to use, copy, modify, and/or distribute this software for any
  purpose with or without fee is hereby granted, provided that the above
  copyright notice and this permission notice appear in all copies.

  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  ```

  要注意，若你的專案需要版權宣告，請不要從這裡複製，除了版權類型以外，每種版權申明也有版本差異，可以去找適合的或最新版本

- ### author

  作者資訊，含姓名、信箱、個人宣傳網址

- ### files
  
  要包含進專案裡的檔案，類似 `gitignore` 的相反用法，但有些檔案無視設定，部分一定會加進去，部分一定會忽略

- ### main
  
  專案入口檔案，比較希望專案匯入匯出都經過這個檔案

- ### bin
  
  連結 bin 檔案的設定，範例可參考 [Gulp GitHub](https://github.com/gulpjs/gulp "Gulp")

- man
  
  搭配 linux 的 man 指令使用

- ### repository
  
  專案使用的版控類型及版控位置，單純提供資訊

- ### scripts
  
  運行專案的指令

- ### config
  
  放置專案不常改變的常數
  
  假如設定 `"config" : { "port" : "8080" } }`，取值方式為 `npm_package_config_port`
  
  也可用指令臨時設定，`npm config set foo:port 8001`

- ### dependencies
  
  專案使用到的套件，有很多種方法指定版本，`npm install` 會安裝
  
  小技巧是加入 `"~": "file:."`，相當於使用專案根目錄當作一個套件，配合 `require/import` 使用

- ### devDependencies
  
  專案使用到的輔助開發套件，基本上都和 `dependencies` 一樣

- ### optionalDependencies
  
  專案可能使用到的套件，優先於 `dependencies`，作用是 `npm install` 失敗時不會中斷，程式中要自行用 try/catch 處理沒有套件的情況要怎麼辦

- ### engines
  
  指定專案的 node、npm 版本
  
  範例：`"engines": { "node": "^10.19.0", "npm": "^6.9.0" }`

- ### os
  
  指定專案運行系統，使用 `process.platform` 判斷
  
  範例：`"os" : [ "darwin", "linux" ]`
  
  可用驚嘆號轉為黑名單，範例：`"os" : [ "!win32" ]`

- ### cpu
  
  指定專案在特定的 cpu 架構下運行，使用 `process.arch` 判斷
  
  範例：`"cpu" : [ "x64", "ia32" ]`
  
  可用驚嘆號轉為黑名單，範例：`"cpu" : [ "!arm", "!mips" ]`

- ### preferGlobal
  
  是否建議專案安裝在全域，但即使設為 true，也不會阻止安裝在專案內，只會警告提醒

- ### private
  
  表示專案是否為私人專案，作用是防止被發佈

- ### publishConfig
  
  發佈專案時使用的配置
  
  範例：`"publishConfig": { "registry": "https://registry.npmjs.org/", "tag": "beta", "access": "public" }`

- ### contributors
  
  專案貢獻者，自動從 author 抓取指定格式生成

## 速產懶人包

指令：`npm init -y`

```json
{
  "name": "folder_name",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

## npm 指令

只記錄一些跟這篇有關的指令

- ### `npm link`
  安裝套件，但跟 `npm install` 不同，不會重複安裝已有的套件

- ### `npm config set registry https://registry.npmjs.org`
  設定發佈套件的位置，一般都是官網位置

- ### 升級版本
  版本號的組成：MAJOR.MINOR.PATCH

  MAJOR：不兼容的 API 修改

  MINOR：向下兼容的新增功能

  PATCH：向下兼容的問題修正

  假設目前版本號為 v1.0.0，連續進行以下三種指令

  1. `npm version patch`
  -> v1.0.1
  2. `npm version minor`
  -> v1.1.0
  3. `npm version major`
  -> v2.0.0

- ### `npm publish --tag beta`
  
  發佈專案，指定標籤版本

## 題外話

[yarn](https://yarnpkg.com/) 升級套件有個美美的介面，指令是 `yarn upgrade-interactive`
