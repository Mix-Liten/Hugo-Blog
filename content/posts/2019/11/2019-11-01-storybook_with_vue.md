---
title: Vue with Storybook 概述
tags: [Vue, Other]
category: [Vue]
draft: false
toc: true
date: 2019-11-01 17:36:29
---

## 前言
現在前端流行的框架都可單獨開發多種元件，在元件切得很多的情況下，使用 Storybook 檢視各個元件，相信會在開發上給予相當程度的便利。

目前 Storybook 可用於 [React](https://storybook.js.org/docs/guides/guide-react/)、[Vue](https://storybook.js.org/docs/guides/guide-vue/)、[Angular](https://storybook.js.org/docs/guides/guide-angular/)、[Svelte](https://storybook.js.org/docs/guides/guide-svelte/)、[Ember](https://storybook.js.org/docs/guides/guide-ember/)、...等等框架，本篇以 Vue 為例，版本是5.1。

## 連結
1. [Storybook](https://storybook.js.org/)
2. [vue-cli-plugin-storybook](https://www.npmjs.com/package/vue-cli-plugin-storybook)
3. [storybook-addon-vue-info](https://www.npmjs.com/package/storybook-addon-vue-info)
4. [storybook-addon-vue-info-demo](https://storybook-addon-vue-info.netlify.com/)

## 安裝
Storybook 官網裡安裝 Vue 版本的方法有兩種
1. Automatic setup
在 Vue 專案裡使用下方指令
```
npx -p @storybook/cli sb init --type vue
```

2. Manual setup
這個比較麻煩，就是照著步驟做，為了避免篇幅過長，僅提供[傳送門](https://storybook.js.org/docs/guides/guide-vue/#manual-setup)。

3. Vue CLI plugin
別人造好的輪子，使用方式是先開啟 Vue CLI 3 新增的圖形化介面，進入你要使用的專案，選擇目錄中的插件(Plugins)，點擊新增插件後安裝[vue-cli-plugin-storybook](https://www.npmjs.com/package/vue-cli-plugin-storybook)

## 配置及插件(Addons)
安裝好後，使用 package.json 裡的相關指令把 Storybook 跑起來
![官方首頁Demo](/images/other/storybook/storybook_demo.jpg)
此時你會發現，自己跑起來的 Storybook 與官網的影片相差甚遠，主要有兩部分，一是左邊的目錄很空，這是因為我們還沒配置要呈現的 story，二是右邊的元件控制項很少，這是另一項重點，插件(Addons)。

首先配置的部分，這是一個很多工的步驟，以官方給的 Button 範例說明，程式部分僅供參考，實際使用要看 Storybook 的版本
```js
// Button.stories.js
import { storiesOf } from '@storybook/vue'
import { action } from '@storybook/addon-actions'
import { withKnobs } from "@storybook/addon-knobs"

const stories = storiesOf("Button", module)
stories.addDecorator(withKnobs)

stories
  .add('Button', () => ({
    template: '<button :handle-click="log">Click me to log the action</button>',
    methods: {
      log: action('log'),
    },
  }))
```

在這段範例中，首先要建一個 story 的主體，接著往裡面增加內容，中間配置了 knobs 的插件，如果要用全域插件也可以在 config.js 裡使用以下這段
```js
import { addDecorator } from '@storybook/vue'
import { withInfo } from 'storybook-addon-vue-info'
addDecorator(withInfo)
```

- 如果要在目錄呈現階層關係，只要在 add 的第一個參數使用斜線(slash)，ex:'Button/Pure'。

插件部分有分[Official addons](https://storybook.js.org/addons/)以及自製的，從 Button.stories.js 的範例中可看出元件加進故事裡的 template 是直接放字串或是引入元件檔，此時預設的插件無法提供足夠的資訊，因此我使用了 storybook-addon-vue-info 套件，這個套件可以清晰的顯示出提示訊息、元件樣板、需要傳入的 props 等等。

## 總結
這篇只有簡單的介紹，以及我遇到問題的部分，還有很多眉角要注意，另外也要因應各個專案的需求不同配置。
再次重申，請注意 Storybook 的版本。
