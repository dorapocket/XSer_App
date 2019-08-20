import 'package:flutter/material.dart';
import 'dart:async';
import 'package:XSer/const/const.dart';
import 'package:XSer/components/searchScore.dart';
import 'package:XSer/components/bottomBar.dart';
import 'package:XSer/routers/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:XSer/routers/application.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    super.initState();
  }

  final routes = Router();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "XSer",
      /*theme:ThemeData(
        primaryColor: C.XS_BLUE,
      ),*/
      home: StartScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: Application.router.generator,
      routes: {
        "/home": (context) => BottomBar(),
      },
      //onGenerateRoute: Application.router.generator,
    );
  }
}

class StartScreen extends StatefulWidget {
  StartScreen({Key key}) : super(key: key);

  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  startTime() async {
    //设置启动图生效时间
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return new Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: C.XS_BLUE,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 150,
              ),
              Image.network(
                "http://dolime.lgyserver.top/logo.png",
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 150,
              ),
              Text(
                "欢迎您",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "xxx老师",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
