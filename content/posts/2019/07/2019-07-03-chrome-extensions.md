---
title: Chrome擴充應用初探
tags: [chrome, diary]
categories: [Chrome]
draft: false
toc: true
date: 2019-07-03 21:56:40
---

## 前言

起因是 Google Chrome 的某一次改版改了整體的介面，一開始極度不適應，在應用商店裡又找不到滿意的主題來遮醜，就萌生了自己做個主題來用的想法，畢竟很多 Chrome 的主題看起來只是放一張動漫圖在新分頁的背景，感覺不難呀～

## 參考
[官方文件](https://developer.chrome.com/extensions)
Google 官方文件一向很齊全，只是英文總是讓人卻步

## 結論與過程
先說**結論**，因[發佈套件](https://developer.chrome.com/webstore/publish)需要5美元註冊，個人認為這次做出來的作品並沒有好到可以以這種形式公開，所以就只放在沒沒無聞的我的GitHub了。

接下來是過程，看前面會知道，起初是想用現成的主題來著，當時不甚滿意的主題分別是[Tabliss](https://chrome.google.com/webstore/detail/tabliss-a-beautiful-new-t/hipekcciheckooncpjeljhnekcoolahp)、[Momentum](https://chrome.google.com/webstore/detail/momentum/laookkfknpbbblfpciffpaejjkokdgca)、[Live Start Page](https://chrome.google.com/webstore/detail/live-start-page-living-wa/ocggccaacacpienfcgmgcihoombokbbj)、[Toby](https://chrome.google.com/webstore/detail/toby-for-chrome/hddnkoipeenegfoeaoibdmnaalmgkpip)、[Speed Dial(FVD)](https://chrome.google.com/webstore/detail/speed-dial-fvd-new-tab-pa/llaficoajjainaijghjlofdfmbjpebpa)，大致上前三個是用免費的風景圖為基底，但功能比較被限制；Toby主打書籤功能；Speed Dial則是我相較滿意的主題，功能非常齊全。

忘記講需求了，比起美美的主題，我更需要的是預設頁面右上角的Google會員功能，Gmail、雲端硬碟...等等，另外還有新分頁的預設頁面會在上方顯示書籤列表(設定是關閉)，但是上面這些主題客製時，頁面都會整體更新，我需要的功能都要改成用類似書籤的方式實現。

## 結果
幾番掙扎之後，做了個類似[Dynamic Landing Page](https://codepen.io/bradtraversy/full/XLrQvz)的畫面，也發現上架主題需要開通費之後，改做了個[冬季飄雪特效](https://github.com/Mix-Liten/snow-shopee)，當作摸索擴充應用的小結，喜歡的話歡迎拿去使用或修改喔。

![x4飄雪GIF](/images/CANVAS/snow_shopee.gif)

## 後話
大概過了兩個月後我選擇用[Colors](https://chrome.google.com/webstore/detail/colors/lhbgjlhhonbdjfdoiklbbkejcipkbnac)主題，這個主題就是以一張圖片為背景而已，缺點是圖片的色彩集中在上方，會遮到Google會員功能，這也是我挑掉一堆圖片主題的原因，那為什麼還會使用 Colors 呢？因為它的圖片相較之下比較不突兀，那些動漫、風景圖的解析度在目前使用的32吋螢幕上實在是很模糊。