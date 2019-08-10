import 'package:flutter/material.dart';
import 'package:xser/main.dart';
import 'package:xser/routers/routes.dart';
import 'package:xser/const/const.dart';
class SearchScore extends StatelessWidget {
  final arguments;
  final maya;
  const SearchScore(this.arguments,this.maya);

  @override
  Widget build(BuildContext context) {
    final updownSize=100;
    final betweenSize=100;
    final lr=20;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "考试成绩查询"
          ),
          backgroundColor: C.XS_BLUE,
        ),
          body: Container(

            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                   color: Colors.blue,
                   borderRadius: BorderRadius.circular(15),
                   boxShadow: [
                BoxShadow(
                  offset: Offset(10, 10),
                  //color: Colors.black,
                  blurRadius: 30,
                  spreadRadius: -10,
                ),
              ],
                ),
                width: MediaQuery.of(context).size.width-lr*2,
                height: (MediaQuery.of(context).size.height-updownSize*2-betweenSize)/2,
                child:Stack(
                  children: <Widget>[
                   
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset("images/exam.png",scale: 15,),
                  ),
                ),
                 Center(
                                  child: Text(
                    "通识课考试成绩查询",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ), 
                  ],
                ),
              ),
              SizedBox(height: betweenSize.toDouble()),
                            Container(
                decoration: BoxDecoration(
                   color: Colors.redAccent,
                   borderRadius: BorderRadius.circular(15),
                   boxShadow: [
                BoxShadow(
                  offset: Offset(10, 10),
                  //color: Colors.black,
                  blurRadius: 30,
                  spreadRadius: -10,
                ),
              ],
                ),
                width: MediaQuery.of(context).size.width-lr*2,
                height: (MediaQuery.of(context).size.height-updownSize*2-betweenSize)/2,
                child:Stack(
                  children: <Widget>[
                   
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset("images/run.png",scale: 9),
                  ),
                ),
                 Center(
                                  child: Text(
                    "考查课考试成绩查询",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ), 
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}