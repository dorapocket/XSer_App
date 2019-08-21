import 'package:flutter/material.dart';
import '../const/const.dart';

class Purchase extends StatefulWidget {
  Purchase({Key key}) : super(key: key);

  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  Widget getIcon(String a) {
    if (a.contains("食堂")) {
      return CircleAvatar(
        backgroundColor: Colors.green[400],
        child: Icon(Icons.local_dining, size: 18,color: Colors.white,),
        maxRadius: 15,
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.shopping_cart,
          size: 18,
          color: Colors.white,
        ),
        maxRadius: 15,
      );
    }
  }
  Color getColor(String a){
    if (a.contains("食堂")){
      return Colors.green[400];
    }else{
      return Colors.blue;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("消费记录"),
          backgroundColor: C.XS_BLUE,
        ),
        body: Container(
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child: Column(
            children: <Widget>[
              Container(
                color: C.LIGHT_BLUE,
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "当前余额：",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        data["balance"].toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: data["data"].length,
                  itemBuilder: (content, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                      child: Card(
                        //color: Colors.cyan,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: getIcon(
                                              data["data"][index]["place"]),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              data["data"][index]["place"],
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: getColor(data["data"][index]["place"]),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8),
                                                  child: Text(
                                                    data["data"][index]["time"],
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "- " +
                                          data["data"][index]["consume"]
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "Montserrat",
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Map data = {
  "balance": 102.5,
  "data": [
    {"consume": 10.2, "place": "第二食堂", "time": "2019/8/20 13:14:00"},
    {"consume": 8.3, "place": "第一食堂", "time": "2019/8/20 12:14:33"},
    {"consume": 1.1, "place": "第三食堂", "time": "2019/8/20 11:33:21"},
    {"consume": 12.0, "place": "白杨超市", "time": "2019/8/19 10:23:32"},
    {"consume": 15.4, "place": "白杨超市", "time": "2019/8/18 09:11:44"},
    {"consume": 7.6, "place": "第二食堂", "time": "2019/8/17 08:23:10"},
    {"consume": 4.2, "place": "第一食堂", "time": "2019/8/16 07:43:20"},
    {"consume": 11.9, "place": "第三食堂", "time": "2019/8/15 18:22:03"},
    {"consume": 9.1, "place": "第二食堂", "time": "2019/8/14 17:43:23"},
    {"consume": 20.3, "place": "白杨超市", "time": "2019/8/13 16:23:40"},
    {"consume": 6.6, "place": "第二食堂", "time": "2019/8/12 15:15:54"},
    {"consume": 2.4, "place": "第一食堂", "time": "2019/8/11 14:17:34"},
  ]
};
