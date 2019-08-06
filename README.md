# NBXS_App

------

## 概览 

一款由两位中国浙江省宁波市效实中学2018级毕业生兴趣制作的效实人专用跨平台App！

开发语言：Google Flutter

适配终端：IOS/Android

##### 屏幕截图

![](D:\Develop\Flutter_App\XSer\screenshots\main.jpg)

![myxs](D:\Develop\Flutter_App\XSer\screenshots\myxs.jpg)

##### 贡献者(排名不分先后)

[dorapocket](https://github.com/dorapocket)  Dart/Flutter开发

[ztjryg4](https://github.com/ztjryg4)  爬虫/API开发

## 开发

如果你有意向加入开发 欢迎申请加入我们 请邮件到dorapocket@outlook.com

##### 构建

**请注意：请事先安装好Flutter和Dart开发环境，终端运行flutter doctor不报错以后进行下面的步骤**

1、从头构建Flutter项目（不推荐）

```bash
flutter create -t app --org net.nbxiaoshi -i swift -a kotlin XSer 
```

删除“XSer”下所有文件夹，将本git文件复制进去

在项目根目录内运行

```bash
flutter run
```

安装所需依赖

2、直接构建（推荐）

解压本git内所有文件
```bash
flutter run
```

会自动安装所需依赖

## 功能

**本项目仍在开发中 目前直接下载只会出现静态数据 没有写入API请求部分 后期完善**

- 爬取校网主页 获取最新文章信息
- “我的效实”界面登录、天气、一卡通余额、DD90、未读信息
- Developing...

**如果你有更好的点子，欢迎提交Issues向我们反映！**

## 协议

GPL V3.0开源

原作者保留所有权利

仅供学习交流使用，禁止用于任何非法或商业用途。