# NBXS_App

------

## 概览 Overview

**我们很抱歉地说。学校官方不是很支持此App的运行，鉴于已有某智慧教育app存在类似功能，项目无限期延迟**

**That's ok! && Practice makes Perfect!**

一款由两位中国浙江省宁波市效实中学2018级毕业生兴趣制作的效实人专用跨平台App！

A cross-platform App created by two 2018 graduates from Ningbo XiaoShi High School, Zhejiang , China.

开发语言 Language ：Google Flutter

适配终端 Platform ：IOS/Android

##### 屏幕截图 ScreenShots

![main](main.jpg)

![myxs](myxs.jpg)

![features](features.jpg)

##### 贡献者(排名不分先后) Contributor

[dorapocket](https://github.com/dorapocket)  Dart/Flutter

[ztjryg4](https://github.com/ztjryg4)  API

效实中学动漫社  App图标

## 开发

如果你有意向加入开发 欢迎加入我们 请邮件到dorapocket@outlook.com

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

#####推送设置

**项目采用极光推送 请现在极光推送注册app**

在 /android/app/build.gradle 中添加下列代码：

```bash
android: {
  ....
  defaultConfig {
    applicationId "替换成自己应用 ID"
    ...
    manifestPlaceholders = [
        JPUSH_PKGNAME : applicationId,
        JPUSH_APPKEY : "appkey", // NOTE: JPush 上注册的包名对应的 Appkey.
        JPUSH_CHANNEL : "developer-default", //暂时填写默认值即可.
    ]
  }    
}
```

根据官方pub说明 添加代码到main.dart

实测该版本推送pub包会有导入冲突错误 请在你项目的.packages里面找到jpush的地址

比如我这里是C:\Users\dorap\AppData\Roaming\Pub\Cache\hosted\pub.flutter-io.cn\jpush_flutter-0.0.13

进入android 修改build.gradle 删除 dependencies里面 

```bash
//implementation 'com.android.support:appcompat-v7:27.+'
```

应该就不会报错了

## 功能 Features

**本项目已经接入最新的XSer API 鉴于校网目前正在改版 后期会加以完善**

**This project has been connected to the latest XSer API and will be improved later.**

- 爬取校网主页 获取最新文章信息(done)
- Crawl the homepage of the school website to get the latest article information
- “我的效实”界面:登录、天气、一卡通余额、DD90、未读信息(开发中)
- "MyXS" interface : login, weather, card balance, DD90, unread information(Developing)
- “功能”界面：查成绩(done)、查书、通讯录
- "Features" interface : Score, Search Books, Address List for graduate
- Developing...

**如果你有更好的点子，欢迎提交Issues向我们反映！**

**If you have any better ideas, please feel free to issue them to us!**

## 协议 Licences

GPL V3.0

原作者保留所有权利 All rights reserved

仅供学习交流使用，禁止用于任何非法或商业用途。

For study and communication only. No illegal or commercial use is allowed.