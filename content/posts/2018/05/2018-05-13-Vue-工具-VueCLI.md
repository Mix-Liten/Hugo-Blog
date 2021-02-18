---
title: Vue-工具-Vue CLI
tags: [Vue]
categories: [Vue]
draft: false
toc: true
date: 2018-05-13 19:44:26
---

本來第三篇要說關於Vue組件Global和Local的應用還有組件之間上下傳遞事件的方法，不過一想到就有點懶，暫時逃避一下，這篇先介紹一下最近在做作品用到的工具吧。

[Vue-CLI GitHub連結](https://github.com/vuejs/vue-cli)

### 安裝
```
npm i vue-cli -g //安裝在global

vue -V //看看版本 確定安裝好沒
```

### 提供六種起始樣板
```
vue list //檢視Available official templates

vue init <樣板名稱> <專案名稱> //下載樣板
```
![六種樣板](/images/JS/Vue/vue-list.jpg "Vue-list")

選好樣板初始化，基本上會先問一些問題，如：專案名、專案描述、專案作者、可選套件，可選套件看需求使用，等安裝好照著CMD給的提示執行開發伺服器，開發時沒有要改設定的話，基本上只會用到src資料夾，src裡還有assets、components資料夾，因為有內建vue-loader，可以直接使用副檔名是vue的單一組件(含template、script、style)放在components，assets則是靜態檔案，通常會放全域用的JS、CSS、圖片之類的，另外還有個很重要的router，繼續看下面吧。

[Vue-router 說明文件](https://router.vuejs.org/zh-cn/)

順便介紹同樣內建在裡面的vue-router，這東西的用途是可以把網頁做成單頁應用SPA(Single Page Application)，優點是頁面間切換很順暢，缺點是進網頁會讀久一點。

- 挖空格放組件(router-view)
```html
<template>
  <div>
    <Menu/>
    <div class="container">
      <router-view/>
    </div>
    <Footer/>
  </div>
</template>

<script>
import Menu from './Menu';
import Footer from './Footer';

export default{
  components: {
    Menu,
    Footer,
  }
}
</script>
```
router-view tag 會塞入子組件的內容，menu和footer則是直接引入組件到Vue實例裡直接使用。

- 組件之間的連結(router-link)
```html
<router-link to="about">About</router-link>
```
這句會被自動編譯成a連結。

- router設定
```js
// router.js
import Vue from 'vue';
import VueRouter from 'vue-router';

import App from './App.vue';
import About from './about.vue';
import Grocery from './grocery.vue';
import GroceryList from './groceryList';
import GroceryDetail from './groceryDetail';

Vue.use(VueRouter);

export default new VueRouter({
  routes: [
    {
      path: '/',
      component: App,
      children: [
        { path: 'about', component: About},
        {
          path: 'grocery',
          component: Grocery,
          children: [
            {path: '', component: GroceryList},
            {path: ':id?', component: GroceryDetail}, // 用this.$route.params.id 對應
          ],
        },
        { path:'*', redirect:'grocery' },
      ],
    }
  ],
})
```
上面的範例有首頁和首頁下的關於和商品頁，商品頁下有商品清單和商品詳細，另外預防使用者隨便打網址的情況下轉址到商品頁。
另外path可以加上一些正規表達式，id後面的問號是表達0個或1個，意思是id可以有也可以沒有。

### 延伸閱讀
[前後端分離與 SPA](https://blog.techbridge.cc/2017/09/16/frontend-backend-mvc/)