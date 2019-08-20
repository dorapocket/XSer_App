import 'package:flutter/material.dart';
import '../const/const.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluro/fluro.dart';
import 'package:XSer/routers/routes.dart';
class MyXS extends StatefulWidget {
  MyXS({Key key}) : super(key: key);

  _MyXSState createState() => _MyXSState();
}

class _MyXSState extends State<MyXS> {
  @override
  Widget build(BuildContext context) {
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
                "王二狗",
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
                "18届12班 校内学生",
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          dayInf(context),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: gridGroup(),
            ),
          ),
        ],
      ),
    );
  }
Widget dayInf(BuildContext context){
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
                  "周二",
                  style: TextStyle(
                      color: Color.fromARGB(210, 255, 255, 255),
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Montserrat",
                  ),
                ),
                Text(
                  "   第1周",
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
                  "8月6日",
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
  Widget gridGroup() {
    return GridView.count(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: <Widget>[
          gridCard(Icons.account_balance_wallet, "一卡通余额", "28.08",C.LIGHT_BLUE,Colors.white),
          gridCard(Icons.message, "未读消息", "2",Color.fromARGB(255, 216, 67, 21),Colors.white),
          gridCard(Icons.wb_sunny, "天气", "35℃",Color.fromARGB(255, 106, 27, 154),Colors.white),
          gridCard(Icons.question_answer, "DD90", "7",Color.fromARGB(255, 21, 101, 192),Colors.white,route:"/dd90List"),
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
