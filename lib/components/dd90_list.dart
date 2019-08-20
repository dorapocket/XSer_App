import 'package:flutter/material.dart';
import 'package:XSer/const/const.dart';
import 'package:badges/badges.dart';
import 'package:fluro/fluro.dart';
import 'package:XSer/routers/routes.dart';
class DD90List extends StatefulWidget {
  DD90List({Key key}) : super(key: key);

  _DD90ListState createState() => _DD90ListState();
}

class _DD90ListState extends State<DD90List> {
  Color getChipColors(String data) {
    switch (data) {
      case "语文":
        return Colors.indigo;
        break;
      case "数学":
        return Colors.purple;
        break;
      case "英语":
        return Colors.pink;
        break;
      case "物理":
        return Colors.blue;
        break;
      case "化学":
        return Colors.lime;
        break;
      case "生物":
        return Colors.green;
        break;
      case "政治":
        return Colors.teal;
        break;
      case "历史":
        return Colors.orange;
        break;
      case "地理":
        return Colors.blueGrey;
        break;
      case "高一":
        return Colors.blue;
        break;
      case "高二":
        return Colors.cyan;
        break;
      case "高三":
        return Colors.red;
        break;
      default:
        return Colors.grey[400];
        break;
    }
  }

  Widget _getList() {
    return ListView.builder(
      itemCount: S.dd90data.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: (){
          Routes.router.navigateTo(
  context, 
  '/dd90content',//跳转路径 get格式
  transition: TransitionType.inFromBottom,
);    
            },
                      child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          S.dd90data[index]["title"],
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.person, color: Colors.grey),
                              Text(S.dd90data[index]["teacher"],
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                        child: Badge(
                          badgeColor: getChipColors(S.dd90data[index]["grade"]),
                          shape: BadgeShape.square,
                          borderRadius: 20,
                          toAnimate: false,
                          badgeContent: Text(S.dd90data[index]["grade"],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Badge(
                          badgeColor: getChipColors(S.dd90data[index]["subject"]),
                          shape: BadgeShape.square,
                          borderRadius: 20,
                          toAnimate: false,
                          badgeContent: Text(S.dd90data[index]["subject"],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      S.dd90data[index]["content"],
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          S.dd90data[index]["reply"].toString() +
                              "答复" +
                              " · " +
                              S.dd90data[index]["click"].toString() +
                              "点击",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: Colors.grey,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DD90学科问题集",
        ),
        backgroundColor: C.XS_BLUE,
      ),
      body: Container(
        color: Colors.grey[200],
        child: _getList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        onPressed: (){
          var title =Uri.encodeQueryComponent("提问"); //传输内容 要encode
var type=Uri.encodeQueryComponent("dd90_ask");
Routes.router.navigateTo(
  context, 
  '/editor?title=$title&type=$type',//跳转路径 get格式
  transition: TransitionType.inFromBottom,
);
        },
        backgroundColor: Colors.grey[900],
      ),
    );
  }
}
