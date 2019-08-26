import 'package:flutter/material.dart';
import '../utils/httpUtil.dart';
import 'sqLiteUser.dart';
import 'sysNote.dart';
import 'cache.dart';
//import '../component/loading.dart';
import 'dart:io';

class XSerApi {
  //static final sqlListData = SqlListData();
  static final sqlLite = SqlLite();
  static final cache=XSerCache();
  /// 登录
  /// d : 传入data
  /// t : 保存密码标识
  static Future<Map<String, dynamic>> Studentlogin(
      Map<String, dynamic> d, bool t) async {
    Map<String, dynamic> res =
        await HttpUtils.request('/login/student', data: d);
    if (res != null && res['code'] == 200) {
      String secret = res['secret'];
      await sqlLite.open();
      // 登录成功，保存数据 登录的账号信息记录一下
      await sqlLite.insertLoginInfo(d, t, secret, res['inf']);
      // 登录成功跳转页面 并且关闭给定路由的之前的所有页面
    }
    print("logininf" + res.toString());
    return res;
  }

  // 缓存的用户信息
  static Future<Map<String, dynamic>> getSecrets() async {
    await sqlLite.open();
    List<Map<String, dynamic>> _u = await sqlLite.queryUserSecret();
    return _u[0];
  }

//缓存的MyXS数据
  static Future<Map<String, dynamic>> getMyXS() async {
    Map<String, dynamic> data = {};
    //以后这句话可以服务器上check
    if (!await checkLoginbyDB()) {
      data = {
        'RealName': '请先登录',
        'balance': 0,
        'notifications': 0,
        'weather': "0",
        'dd90': 0,
        'grade': "测试班级",
        'day': '周一',
        'week': '第一周',
        'date': '1月1日',
        'weathericon': 'sunny'
      };
    } else {
      //请求信息
      data = {
        'RealName': '王二狗',
        'balance': 0,
        'notifications': 0,
        'weather': "24℃",
        'dd90': 0,
        'grade': "测试班级",
        'day': '周一',
        'week': '第一周',
        'date': '1月1日',
        'weathericon': 'sunny'
      };
    }
    if (data.isNotEmpty) {
      await sqlLite.open();
      print("更新myxs数据");
      await sqlLite.insertMyXS(data);
      //List<Map<String,dynamic>> _u = data;
      //print(_u);
      return data;
    } else {
      print("使用缓存数据");
      List<Map<String, dynamic>> _u = await sqlLite.queryMyXS();

      //List<Map<String,dynamic>> _u2 = await sqlLite.queryUserInfo();
      return _u[0];
    }
  }


//获取主页新闻
static Future<List> getHomeNews()async{
    List data=[];
    Map<String,dynamic> response=await getHomeArticle(); 
    if(response['code']==200){
      data=response['data']['list'];
    }
    print("列表数据："+data.toString());
    if(data.isNotEmpty){
    await sqlLite.open();
    print("更新首页新闻数据");
    await cache.insertHomeNews(data);
    //List<Map<String,dynamic>> _u = data;
    //print(_u);
    print("更新首页新闻完成");
    return data;
    }else{
      print("使用首页新闻缓存数据");
      List<Map<String,dynamic>> _u = await cache.queryhomeNews();
      //List<Map<String,dynamic>> _u2 = await sqlLite.queryUserInfo();
      return _u;
    }
  }
  // 检查登录状态
  //return 回来的元素["code"]==200 登陆有效 400 登陆失效
  static Future<Map<String, dynamic>> loginStatus() async {
    return await HttpUtils.request('/login/status', method: 'get');
  }
/*
  // 登出
  static Future loginOut(BuildContext context)async{
    await HttpUtils.request('/logout',method: 'post').then((e){
      if (e['code'] == 200) {
        sqlLite.open();
        sqlLite.delLoginInfo();
        Navigator.pushNamedAndRemoveUntil(context, '/start', (route) => route == null);
      } else {
        fuToast("服务器有点挤 Ծ‸ Ծ 等一下再来叭", Colors.red[400], context);
      }
    });
  }*/

  // 用户个人详情 校网“学生信息页”
  //detail样例
  static Future<Map<String, dynamic>> getUserDetail() async {
    Map<String, dynamic> detail = await getSecrets();
    String secret = detail['appsecret'];
    detail = await HttpUtils.request('/user/userinfo',
        data: {'secret': "${secret}"});
    return detail;
  }

  //验证是否登陆有效
  //回传样例{"code":200}
  static Future<bool> checkLogin() async {
    print("登陆检查程序启动");
    await sqlLite.open();
    List<Map<String, dynamic>> loginstate = await sqlLite.queryLoginState();
    print(loginstate);
    if (loginstate[0]["login"] == 0) {
      print("当前无用户登录");
      return false;
    } else {
      List<Map<String, dynamic>> dt = await sqlLite.queryUserSecret();
      //print(dt);
      String secret = dt[0]["appsecret"];
      Map<String, dynamic> status = await HttpUtils.request('/login/status',
          data: {'secret': "${secret}"});
      if (status["code"] == 200) {
        print("登陆有效");
        return true;
      } else {
        print("当前无用户登录");
        return false;
      }
    }
  }

  static Future<bool> checkLoginbyDB() async {
    await sqlLite.open();
    List<Map<String, dynamic>> loginstate = await sqlLite.queryLoginState();
    print(loginstate);
    if (loginstate[0]["login"] == 1) {
      print("用户已经登录");
      return true;
    } else {
      return false;
    }
  }

  //通过文章id和文章类型获取文章信息
  static Future<Map<String, dynamic>> getArticle({String id}) async {
    String secret;
    try {
      Map<String, dynamic> detail = await getSecrets();
      if (detail.isNotEmpty) {
        secret = detail['appsecret'];
      } else {
        secret = "";
      }
    } catch (e) {
      secret = "";
    }
    return await HttpUtils.request('/article/',
        method: 'get', data: {"id": id});
  }

  ///家校互动解析
  ///输入页面数
  /// 样例如下
  /// {
  ///   code:200, int
  ///   data:{
  ///     cnt:int
  ///     list:[
  ///       {
  ///         ques:str 问题
  ///         time:str 时间
  ///         reply:str 回复内容
  ///         isreplied:int 0未回复1回复
  ///         department:str 部门
  ///       },{},{},{}
  ///     ]
  ///   }
  /// }
  static Future<Map<String, dynamic>> getPublicContent(int page) async {
    Map<String, dynamic> detail = await HttpUtils.request(
        '/publiccontent/comments/bypage',
        data: {'page': "${page.toString()}"});
    return detail;
  }

  //判断当前登录信息状态 在登陆标识为1且允许保存密码的时候发起重登录请求。返回登陆状态
  static Future<bool> relogin() async {
    print("程序初始化————判断登录信息与重登录操作");
    bool state = await checkLogin();
    if (state) {
      print("登录信息仍然有效————重登录程序结束");
      return true;
    }
    await sqlLite.open();
    List<Map<String, dynamic>> loginstate = await sqlLite.queryLoginState();
    print(loginstate);
    if (loginstate[0]["login"] == 0) {
      print("当前无用户登录————重登录操作结束");
      return false;
    } else {
      List<Map<String, dynamic>> dt = await sqlLite.queryUserSecret();
      //print(dt);
      if (dt[0]["rememberPwd"] == 1) {
        print("用户选择记住密码，重新发起登录请求");
        Map<String, dynamic> result = await Studentlogin({
          "user": "${dt[0]["Account"]}",
          "password": "${dt[0]["password"]}",
          "method": "student"
        }, true);
        if (result["code"] == 200) {
          print("重新登陆成功");
          return true;
        } else {
          return false;
        }
      } else {
        print("用户选择不记住密码————重登录程序结束");
        return false;
      }
    }
  }

  static Future<String> getUserNameFromDB() async {
    print("获取当前用户姓名");
    try {
      await sqlLite.open();
      List<Map<String, dynamic>> loginstate = await sqlLite.queryLoginState();
      if (loginstate[0]["login"] == 0) {
        print("无法获取当前用户姓名1");
        return "";
      } else {
        List<Map<String, dynamic>> _u = await sqlLite.queryUserSecret();
        if (_u.isNotEmpty) {
          print("用户姓名：" + '${_u[0]["name"]}');
          return _u[0]["name"];
        } else {
          print("无法获取当前用户姓名2");
          return "";
        }
      }
    } catch (e) {
      print("************获取缓存用户姓名错误************");
      print(e);
    }
  }

  //主页文章更新 概览 每条只有两个
  static Future<Map<String, dynamic>> getHomeArticle() async {
    Map<String, dynamic> data =
        await HttpUtils.request('/publiccontent/homepagebrief/', method: 'get');
        return data;
  }

  //获取考试成绩列表
  static Future<Map<String, dynamic>> getExamList() async {
    String secret;
    try {
      Map<String, dynamic> detail = await getSecrets();
      if (detail.isNotEmpty) {
        secret = detail['appsecret'];
      } else {
        secret = "";
      }
    } catch (e) {
      secret = "";
    }
    return await HttpUtils.request('/user/scorelist/',
        method: 'get', data: {'secret':secret,'type':'0'});
  }


//获取考试成绩列表
  static Future<Map<String, dynamic>> getExamScore(id) async {
    String secret;
    try {
      Map<String, dynamic> detail = await getSecrets();
      if (detail.isNotEmpty) {
        secret = detail['appsecret'];
      } else {
        secret = "";
      }
    } catch (e) {
      secret = "";
    }
    return await HttpUtils.request('/user/score/',
        method: 'get', data: {'secret':secret,'type':'0',"id":id});
  }
  //获取公告/最新文章/校务公开
//公告 - board
//最新文章 - alllatest
//校务公开 - schoolaffair
  static Future<Map<String, dynamic>> getArticleList(
      String type, int page) async {
    String a;
    switch (type) {
      case "通知公告":
        a = 'board';
        break;
      case "最新文章":
        a = 'alllatest';
        break;
      case "校务公开":
        a = 'schoolaffair';
        break;
      default:
        break;
    }
    return await HttpUtils.request('/publiccontent/${a}/bypage/',
        method: 'get', data: {"page": page.toString(), 'n': "20"});
  }
}
