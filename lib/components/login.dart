import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../const/const.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool check = true;
  @override
  Widget build(BuildContext context) {
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
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width-100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [Color(0xFF69f0ae), Color(0xFF00c853),], begin: FractionalOffset(0, 1), end: FractionalOffset(1, 0))
                  ),
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width-100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [Color(0xffffff00), Color(0xFFffd600),], begin: FractionalOffset(0, 1), end: FractionalOffset(1, 0))
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
