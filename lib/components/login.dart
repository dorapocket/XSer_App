import 'dart:async';

import 'package:XSer/components/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../const/const.dart';
import '../utils/commonRequests.dart';
import '../utils/sysNote.dart';
import 'package:XSer/routers/routes.dart';
import '../components/myxs.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();
String u = "";
String p = "";

class _LoginPageState extends State<LoginPage> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
    usernameController.addListener(() {
      u = usernameController.text;
      print(u + p);
    });
    passwordController.addListener(() {
      usernameController.text = u;
      p = passwordController.text;
      print(u + p);
    });
    return Container(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: C.XS_BLUE,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Image.asset(
                  'images/xslogo.png',
                  scale: 4,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "用 户 登 录",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          //hasFloatingPlaceholder: true,
                          hintText: "用户名",
                          border: InputBorder.none,
                          icon: Icon(Icons.person),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          //hasFloatingPlaceholder: true,
                          hintText: "密码",
                          border: InputBorder.none,
                          icon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        onChanged: (bool val) {
                          // val 是布尔值
                          this.setState(() {
                            this.check = !this.check;
                            passwordController.text = p;
                            usernameController.text = u;
                          });
                        },
                        activeColor: Colors.blue,
                        value: this.check,
                      ),
                      Text(
                        "自动登录",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    fuToast("正在登录，请稍后", Colors.green[400], context);
                    Map<String, dynamic> result = await XSerApi.Studentlogin({
                      "user": "${u}",
                      "password": "${p}",
                      "method": "student"
                    }, check);
                    //Map<String, dynamic> result = {"code": 200, "inf": "aaa"};
                    if (result["code"] == 200) {
                      print("loginpage:" + result.toString());
                      fuToast("欢迎您，${result["inf"]}，登陆成功！", Colors.green[400],
                          context);
                      Timer(
                          Duration(seconds: 3),
                          () => {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => BottomBar()),
                                    (route) => route == null)
                              });
                    } else if (result["code"] == 403) {
                      fuToast("登陆失败。。用户名或密码错误！", Colors.red[400], context);
                    } else {
                      fuToast("抱歉，服务器错误，请稍后重试", Colors.red[400], context);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xFF69f0ae),
                              Color(0xFF00c853),
                            ],
                            begin: FractionalOffset(0, 1),
                            end: FractionalOffset(1, 0))),
                    child: Center(
                      child: Text(
                        "登  录  LOGIN ",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: Color(0x99000000),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => BottomBar()),
                        (route) => route == null);
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Color(0xffffff00),
                              Color(0xFFffd600),
                            ],
                            begin: FractionalOffset(0, 1),
                            end: FractionalOffset(1, 0))),
                    child: Center(
                      child: Text(
                        "取  消  CANCEL",
                        style: TextStyle(
                          fontFamily: "Product Sans",
                          color: Color(0x99000000),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
