---
title: "使用 Webpack 搭配 Typescript 建立開發環境"
date: 2021-03-04T22:38:48+08:00
draft: false
toc: true
categories: 
  - Other
tags: 
  - dev
  - webpack
  - typescript
---

## 前言

此文為研究 [The Net Ninja](https://www.youtube.com/channel/UCW5YeuERMmlnqo4oq8vwUpg "youtube 頻道") 教學影片中的 [TypeScript Tutorial](https://www.youtube.com/playlist?list=PL4cUxeGkcC9gUgr39Q_yD6v-bSyMwKPUI "TypeScript Tutorial") 與 [Webpack & TypeScript Setup](https://www.youtube.com/playlist?list=PL4cUxeGkcC9hOkGbwzgYFmaxB0WiduYJC "Webpack & TypeScript Setup") 系列的心得文，內文著重在 [Webpack](https://webpack.js.org/ "Webpack") 的說明，[TypeScript](https://www.typescriptlang.org/ "TypeScript") 就自行研究囉。

本篇旨在使用 webpack 打包 typescript 程式碼建立的開發流程，內文中的程式碼皆出自上述影片，可自行參考

## 建置步驟

1. ### npm 安裝 webpack 及相關套件
    ```sh
    $ npm init -y
    $ npm install -D webpack webpack-cli webpack-dev-server typescript ts-loader
    ```

2. ### 修改 package.json 的 scripts
    ```json
    {
      "scripts": {
        "serve": "webpack-dev-server",
        "build": "webpack"
      }
    }
    ```

3. ### 新增 tsconfig.json

    有兩種方式：

   - 安裝全域 typescript
      ```sh
      $ npm install typescript -g
      $ tsc --init
      ```

   - 使用專案內的 typescript
  
     package.json 的 scripts 新增建立指令並執行
      ```json
      {
        "scripts": {
          "tsconfig": "node_modules/.bin/tsc --init"
        }
      }
      ```

      ```sh
      $ npm run tsconfig
      ```

4. ### 新增 webpack.config.js 並添加以下設定
    ```js
    const path = require("path");

    module.exports = {
      entry: "./src/index.ts", // 進入點
      module: {
        rules: [
          {
            test: /\.ts$/, // 找到符合規則的檔案
            include: [path.resolve(__dirname, "src")], // 從指定資料夾尋找
            use: "ts-loader", // 使用特定 loader 解析、轉換檔案
          },
        ],
      },
      resolve: {
        extensions: [".ts", ".js"], // import 時引入的檔案可自動嘗試匹配副檔名，原本是 import { funcA } from "func.ts"，現在可 import { funcA } from "func"
      },
      devtool: "eval-source-map", // 開發工具 source-map，程式錯誤時，在 F12 的 console 會指出哪裡出錯，若有 source-map，錯誤會指向 ts 檔
      output: {
        // 匯出點
        publicPath: "public",
        filename: "bundle.js",
        path: path.resolve(__dirname, "public"),
      },
    };
    ```

5. ### 新增指定的進入點
   
   以第四步驟的 `entry` 來說，要新增 `src` 資料夾，並在裡面新增 `index.ts` 作為程式的主要執行檔，若有新增其他檔案，要用到的時候就 `export` 給進入點 `import`
6. ### 使用打包後的程式檔
   
   以第四步驟的 `output` 來說，ts 檔編譯成 js 檔後會放在 `public/bundle.js`，所以在 public 資料夾中新增的 html 檔案就這樣引用

    ```html
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Webpack & TypeScript</title>
      </head>
      <body>
        <!-- add scripts here -->
        <script src="bundle.js"></script>
      </body>
    </html>
    ```

7. ### 開始使用開發流程
   
   使用一開始寫在 package.json scripts 的 serve 指令

    ```sh
    $ npm run serve
    ```

## 總結
不懂就看個觀念，懂的看過之後，建議還是直接用框架的 cli

### 其他想法
第六步驟，第一次建的時候覺得很奇怪，因為當時先建好 html 檔，引用了一個一開始不存在的檔案
