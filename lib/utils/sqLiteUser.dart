import 'package:sqflite/sqflite.dart';

class SqlLite {
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
        print("创建用户信息表");
        await db.execute("""
        Create Table myxs(
        RealName text,
        grade text,
        day text,
        date text,
        week text,
        weathericon text,
        weather text,
        dd90 integer,
        balance real,
        notifications integer
        );
        """);
        // 登录状态
        await db.execute("""
        Create Table loginState(
         login bit primary key,
         first bit,
         code int
        );
        """);
        await db.insert("loginState", {'login': 0, 'first': 1, 'code': 200});
        // 记住使用手机号登录过的账户
        await db.execute("""
        Create Table userSecret(
         name text,
         Account text,
         rememberPwd bit,
         password text,
         method text,
         appsecret text
        );
        """);
      });
    }
  }

  // 登录成功存储相关部分登录信息，方便以后调用
  // l 账号信息 根据 f 决定是否保存
  // f 是否记住登录账号
  insertLoginInfo(
      Map<String, dynamic> l, bool f, String secret, String name) async {
    // 账户基本信息，头像等
    return await db.update(loginState, {'login': 1}).then((e) {
      if (f) {
        db.query('userSecret', where: 'Account="${l['user']}"').then((e) {
          Map<String, dynamic> data = {
            'name': name,
            'Account': l['user'],
            'rememberPwd': 1,
            'password': l['password'],
            'method': l['password'],
            'appsecret': secret
          };
          if (e.length > 0) {
            db.update('userSecret', data, where: 'Account="${l['user']}"');
          } else {
            db.insert('userSecret', data);
          }
        });
      } else {
        db.query('userSecret', where: 'Account="${l['user']}"').then((e) {
          Map<String, dynamic> data = {
            'name': name,
            'Account': l['user'],
            'rememberPwd': 0,
            'password': '',
            'method': l['password'],
            'appsecret': secret
          };
          if (e.length > 0) {
            db.update('userSecret', data, where: 'Account="${l['user']}"');
          } else {
            db.insert('userSecret', data);
          }
        });
        print("不保存账号");
      }
    });
  }

  insertMyXS(Map<String, dynamic> l) async {
    // 账户基本信息，头像等

    db.query('myxs', where: 'RealName="${l['RealName']}"').then((e) {
      if (e.length > 0) {
        db.update('myxs', l, where: 'RealName="${l['RealName']}"');
      } else {
        db.insert('myxs', l);
      }
    });
  }

  // 删除用户数据
  delLoginInfo() async {
    return await db.delete('myxs').then((e) {
      // 修改登录状态
      db.delete('userSecret');
      db.update("loginState", {'login': 0}).then((e) {});
    });
  }

  queryMyXS() async {
    return await db.query("myxs", columns: null);
  }

  queryUserSecret() async {
    return await db.query("userSecret", columns: null);
  }

  queryLoginState() async {
    return await db.query("loginState", columns: null);
  }

  // 缓存首页新闻


  Future<int> count(tableNote) async {
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableNote'));
  }
}
