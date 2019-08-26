import 'package:flutter/material.dart';
import '../const/const.dart';
class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("关于-XSer"),
          backgroundColor: C.XS_BLUE,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                "XSer",
                style: TextStyle(
                  fontFamily: "Product Sans",
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.grey,
                ),),
              Text(
                "开发人员",
                style: TextStyle(
                  fontFamily: "Product Sans",
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.grey,
                ),),
                RichText(
                  text: TextSpan(
                    children: [
                      
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}