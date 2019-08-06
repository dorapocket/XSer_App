# NBXS_App

------

## 概览 Overview

一款由两位中国浙江省宁波市效实中学2018级毕业生兴趣制作的效实人专用跨平台App！

A cross-platform App created by two 2018 graduates from Ningbo XiaoShi High School, Zhejiang , China.

开发语言 Language ：Google Flutter

适配终端 Platform ：IOS/Android

##### 屏幕截图 ScreenShots

![](screenshots\main.jpg)

![myxs](screenshots\myxs.jpg)

##### 贡献者(排名不分先后) Contributor

[dorapocket](https://github.com/dorapocket)  Dart/Flutter

[ztjryg4](https://github.com/ztjryg4)  API

## 开发

如果你有意向加入开发 欢迎申请加入我们 请邮件到dorapocket@outlook.com

If you are interested to join the development application, please email to dorapocket@outlook.com

##### 构建 Build

**请注意：请事先安装好Flutter和Dart开发环境，终端运行flutter doctor不报错以后进行下面的步骤**

**Warning: Please install the Flutter and Dart SDK in advance, and proceed to the following steps after the " Flutter doctor " runs in the terminal without error reporting**

****

构建Flutter项目 

Build Flutter Project

```bash
flutter create -t app --org net.nbxiaoshi -i swift -a kotlin XSer 
```

删除“XSer”下所有文件夹，将本git文件复制进去

Delete all folders under "XSer" and copy git file into it

在项目根目录内运行

Run in the root directory

```bash
flutter run
```

会自动安装安装所需依赖

The required dependencies will automatically installed

## 功能 Features

**本项目仍在开发中 目前直接下载只会出现静态数据 没有写入API请求部分 后期完善**

**At present, only static data will be used, the API request still under development**

- 爬取校网主页 获取最新文章信息 
- Crawl the homepage of the school website to get the latest article information
- “我的效实”界面:登录、天气、一卡通余额、DD90、未读信息
- "MyXS" interface : login, weather, card balance, DD90, unread information
- Developing...

**如果你有更好的点子，欢迎提交Issues向我们反映！**

**If you have any better ideas, please feel free to issue them to us!**

## 协议 Licences

GPL V3.0

原作者保留所有权利 All rights reserved

仅供学习交流使用，禁止用于任何非法或商业用途。

For study and communication only. No illegal or commercial use is allowed.