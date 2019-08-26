import 'package:XSer/components/login.dart';
import 'package:XSer/utils/commonRequests.dart';
import 'package:XSer/utils/sqLiteUser.dart';
import 'package:flutter/material.dart';
import '../const/const.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluro/fluro.dart';
import 'package:XSer/routers/routes.dart';

class MyXS extends StatefulWidget {
  MyXS({Key key}) : super(key: key);

  _MyXSState createState() => _MyXSState();
}

bool lgin=false;
class _MyXSState extends State<MyXS>{
  
  //checklogin() async{
  //bool hh=await XSerApi.checkLogin();
//}
  @override
  void initState(){
    //print("ss");
    //checklogin();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    if(lgin){
      print("hhhhhhhhhhhhhhhhhhhhhhh");
    }
    return FutureBuilder(
  future: XSerApi.getMyXS(), // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
  builder: (BuildContext context, AsyncSnapshot snapshot) {      //snapshot就是_calculation在时间轴上执行过程的状态快照
    switch (snapshot.connectionState) {
      case ConnectionState.none: 
      return Text("请稍等。。");
      case ConnectionState.waiting:
      return MyXSMain(
        context: context,
            day: "",
            date: "",
            week: "",
            weathericon: "",
            name:"",
            grade:"",
            weather:"0",
            dd90:0,
            balance:0,
            notifications:0
            );
      default:    //如果_calculation执行完毕
        if (snapshot.hasError)    //若_calculation执行出现异常
          return Text('Error: ${snapshot.error}');
        else if(snapshot.data['RealName']=="请先登录"){
          return Container(
            color: Colors.grey[200],
            child: Center(
              child: Text("请先登录"),
            ),
          );
        }else{
          return MyXSMain(
            context: context,
            day:"周日",
            date: "8月25日",
            week: "第一周",
            weathericon: "",
            name: snapshot.data['RealName'],
            grade:snapshot.data['grade'],
            weather:snapshot.data['weather'],
            dd90:snapshot.data['dd90'],
            balance:snapshot.data['balance'],
            notifications: snapshot.data['notifications']
            );
        }   //若_calculation执行正常完成
          
    }
  },
);
  }
Widget dayInf(day,date,week,weathericon,BuildContext context){
  return Container(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    height: 100,
    color: Colors.grey[200],
  child: Center(
    child: Container(
      decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: C.LIGHT_BLUE,

            ),
      height: 100,
      width: MediaQuery.of(context).size.width-20,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 20,
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  day,
                  style: TextStyle(
                      color: Color.fromARGB(210, 255, 255, 255),
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                  ),
                ),
                Text(
                  week,
                  style: TextStyle(
                      color: Color.fromARGB(210, 255, 255, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                  ),
                ),
              ],
            ),
          ),
                    Positioned(
            bottom: 12,
            left: 20,
            child:
                Text(
                  date,
                  style: TextStyle(
                      color: Color.fromARGB(210, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Montserrat",
                  ),
                ),
        
          ),
          Positioned(
            right: 20,
            top:20,
            child: SvgPicture.network(
  'https://yibanapp.hduhelp.com/img/weatherIcons/CLEAR_NIGHT.svg',
  semanticsLabel: 'A shark?!',
  width: 50,
  height: 50,
  color: Colors.yellow,
  placeholderBuilder: (BuildContext context) => new Container(
      padding: const EdgeInsets.all(30.0),
      child: const CircularProgressIndicator()),
),
          ),
        ],
      ),
    ),
  ),
  )
  ;
}

Widget MyXSMain({name,grade,balance,notifications,dd90,weather,day,date,week,weathericon,context}){
  return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Text(
                grade,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          dayInf(day,date,week,weathericon,context),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: gridGroup(balance,notifications,weather,dd90),
            ),
          ),
        ],
      ),
    );
}
  Widget gridGroup(balance,notifications,weather,dd90) {
    return GridView.count(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: <Widget>[
          gridCard(Icons.account_balance_wallet, "一卡通余额", balance.toString(),C.LIGHT_BLUE,Colors.white,route:"/purchase"),
          gridCard(Icons.message, "未读消息", notifications.toString(),Color.fromARGB(255, 216, 67, 21),Colors.white),
          gridCard(Icons.wb_sunny, "天气",weather,Color.fromARGB(255, 106, 27, 154),Colors.white),
          gridCard(Icons.question_answer, "DD90",dd90.toString(),Color.fromARGB(255, 21, 101, 192),Colors.white,route:"/dd90List"),
        ]);
  }
  beginRoute(route){
Routes.router.navigateTo(
  context, 
  route,//跳转路径 get格式
  transition: TransitionType.inFromRight//过场效果
);
  }
  Widget gridCard(IconData icon,String text,String value,Color color,Color bkcolor,{String route}){
    return 
    GestureDetector(
      onTap:route==null?(){}:(){beginRoute(route);},
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: bkcolor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(3, 3),
                    //color: Colors.black,
                    blurRadius: 100,
                    spreadRadius: -50,
                  ),
                ],
              ),
              child:
      Column(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          icon,
                          color: color,
                          size: 25,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          text,
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              fontFamily: "Product Sans"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          value.toString(),
                          style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}
