---
title: 釐清JS的export／exports／require／import
tags: [js]
category: [Other]
draft: false
toc: true
date: 2018-11-14 20:24:23
---

### 前言

使用套件和框架經常看到 require / import / export / exports，因為之前都抱著「能用就好」的想法，一直沒有詳細了解，最近因為學習 Vue、React 和 Webpack，覺得有必要把這種偏向基礎但很重要的部分看懂。

首先先了解它們原本的界定範圍：
require： Node.js、ES6
export ／ import ： ES6
module.exports ／ exports： Node.js

可能有疑問為什麼要說Node.js的語法，因為現在前端幾乎都仰賴Node.js的npm在做事，框架也不例外，另外跟原生的語法也滿容易搞混，用法和用詞都是。


### Node.js的用法

```js
//exports.js
const test = 100;

console.log(module.exports); // {}
console.log(exports); // {}

exports.output = test; // 同步修改 module.exports 為 {output : 100}
/* 千萬不要 exports = test; */

//require.js
const a = require('./exports');
console.log(a) // {output : 100} 
```

理論上 exports = module.exports = {}，但是有一點要注意，**直接指定 exports 是無效的**，而且也不會匯出，因為 require 拿到的只會是 module.exports，直接指定 exports 等於重新指定變數的內容，等於不再依照理論上的參照。

結論，盡量使用 module.exports，畢竟實際上匯入匯出的都是它，也可以直接迴避上述的錯誤。


### ES6的用法

寫法直接參考MDN：

- [MDN - Modules](https://developer.mozilla.org/en-US/docs/Archive/Add-ons/Add-on_SDK/Guides/Contributor_s_Guide/Modules)
- [MDN - export](https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Statements/export)
- [MDN - import](https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Statements/import)

這邊只說明一般常用的 export default，因為輸出是預設(default)，import 的時候可以任意取名；如果是 export test，則必須 import {test}，也可用 import {test as xxx} 的方式取別的名稱；總結用 export default的好處是可以在匯入時不用知道匯入的檔案匯出什麼，壞處是會可能載入多餘的東西，當然 export default 也可以用 import {} 來避免壞處。

另外還有個重點是，在一個檔案中，**export、import 可以有很多個**，但是 **export default 只能有一個**。

###### 備註

現在有種寫法可以直接在html裡import
```js
// example.js
function cube(x) {
  return x * x * x
}
export { cube }
```
```html
<!-- index.html -->
<script type="module">
import { cube } from "example.js"
console.log(cube(3)) // 27
</script>
```
原理請參考[圖說 ES Modules](https://segmentfault.com/a/1190000014318751)
順便看目前瀏覽器能不能用 [Can I use - ES Module](https://caniuse.com/#search=JavaScript%20modules)

目前ES的用法(import)僅常見於框架的CLI，因為很多瀏覽器都還不支援ES6的語法，Node.js也不支援，因此請愛用[Babel](https://babeljs.io/)，它會把新語法轉換成舊的，import 會被轉換成 require。