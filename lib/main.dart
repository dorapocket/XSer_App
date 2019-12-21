import 'package:XSer/utils/commonRequests.dart' as prefix0;
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:XSer/const/const.dart';
import 'package:XSer/components/searchScore.dart';
import 'package:XSer/components/bottomBar.dart';
import 'package:XSer/routers/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:XSer/routers/application.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'utils/commonRequests.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String debugLable = 'Unknown';
  chklgin()async{
    print("");
   
  }
final JPush jpush = new JPush();
  @override
  void initState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
     initPlatformState();
     chklgin();
    super.initState();
  }
// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    

    // Platform messages may fail, so we use a try/catch PlatformException.
    jpush.getRegistrationID().then((rid) {
      setState(() {
          debugLable = "flutter getRegistrationID: $rid";
        });
    });

    jpush.setup(
      appKey: "/*your app keys*/",
      channel: "theChannel",
      production: false,
      debug: true,
      );
    jpush.applyPushAuthority(new NotificationSettingsIOS(
      sound: true,
      alert: true,
      badge: true));

    try {
      
      jpush.addEventHandler(
        onReceiveNotification: (Map<String, dynamic> message) async {
        print("flutter onReceiveNotification: $message");
        setState(() {
            debugLable = "flutter onReceiveNotification: $message";
          });
      },
      onOpenNotification: (Map<String, dynamic> message) async {
        print("flutter onOpenNotification: $message");
        setState(() {
            debugLable = "flutter onOpenNotification: $message";
          });
      },
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("flutter onReceiveMessage: $message");
        setState(() {
            debugLable = "flutter onReceiveMessage: $message";
          });
      },
      );

    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      debugLable = platformVersion;
    });
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
  bool loginstat=false;
  String username="";
  getUserName() async{
    String a= await XSerApi.getUserNameFromDB();
    bool b=await XSerApi.relogin();
    setState(() {
      username=a;
      loginstat=b;
    });
  }
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
    getUserName();
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
              Image.asset(
                "images/waitpagelogo.png",
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
                username,
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
