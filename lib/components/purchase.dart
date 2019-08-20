import 'package:flutter/material.dart';
import '../const/const.dart';
class Purchase extends StatefulWidget {
  Purchase({Key key}) : super(key: key);

  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text("饭卡消费记录"),
           backgroundColor: C.XS_BLUE,
         ),
         body: ListView.builder(
           itemCount: data.length,
           itemBuilder: (content,index){
             return Container(
               
             );
           },
         ),
       ),
    );
  }
}

List data=[
  {
    "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
  {
        "consume":10.2,
    "place":"第二食堂",
    "balance":102,
    "time":"2019/8/20 13:14:00"
  },
];