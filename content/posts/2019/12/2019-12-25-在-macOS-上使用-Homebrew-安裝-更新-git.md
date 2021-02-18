---
title: 在-macOS-上使用-Homebrew-安裝&更新-git
tags: [安裝, Git, Homebrew]
categories: [Other]
draft: false
toc: true
date: 2019-12-25 23:32:25
---

## 前言
作為寫程式必備的版控軟體，macOS上預設是有安裝的，那為什麼我還要多此一舉，用 [Homebrew](https://brew.sh/) 再安裝一次呢？
因為有時候作為開源軟體的 Git 會修正一些嚴重的漏洞或是有重要更新，這時候參考這篇文章就可以立刻跟上最新版本囉～

## 指令
直接上指令表，視情況使用。

```BASH
# 安裝
brew install git

# 更新
brew upgrade git

# 切換 Git 指令使用 Homebrew 版本
brew link git

# 切換 PATH 亦可切換為自行安裝的版本
export PATH=/usr/local/bin:$PATH

# 查看 Git 版本指令
git version

# 查看目前使用的 Git 的存放位置
which git
```

## 結語
老實說我目前不管是在開發 Side-Project 或是公司專案，在使用 Git 的部分都沒遇到什麼問題，更新都是求心安。
