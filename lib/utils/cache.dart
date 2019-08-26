import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class XSerCache {
  final sqlFileName = "XSer.sql"; // sql数据文件
  final userInfo = "userInfo"; // 用户信息
  final loginState = "loginState"; // 用户信息
  final userSecret = "userSecret"; //用户登录信息
  Database db; //后面使用 db缩写 表示 Database
  // 建立一个开启数据库的方法
  open() async {
    String path = "${await getDatabasesPath()}/$sqlFileName";
    if (db == null) {
      db = await openDatabase(path, version: 1, onCreate: (db, ver) async {
        print("创建缓存信息表");
        await db.execute("""
        Create Table homenews(
        title text,
        time text,
        id text
        );
        """);
      });
    }
  }

  insertHomeNews(List l) async {
    print("开始更新");
    if (l.isNotEmpty) {
      try{
        db.delete('homenews');
      }catch(e){print(e);}
        l.map((value) {
          db.insert('homenews', value);
        });
    }
  }

  

  //读取首页新闻缓存数据
  queryhomeNews() async {
    return await db.query("homenews", columns: null);
  }
}
