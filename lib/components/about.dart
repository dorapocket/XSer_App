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
      ),
    );
  }
}