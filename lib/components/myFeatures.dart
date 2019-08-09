import 'package:flutter/material.dart';
import 'dart:math';
class MyFeatures extends StatefulWidget {
  MyFeatures({Key key}) : super(key: key);

  _MyFeaturesState createState() => _MyFeaturesState();
}

class _MyFeaturesState extends State<MyFeatures> {
  List<Map> featureInfo=[
    {
      "icon":Icons.build,
      "blockName":"常用功能",
      "color":Colors.blue,
      "item":[
        {
          "itemIcon":Icons.score,
          "itemName":"成绩查询",
          "routeName":"/go",
        },
        {
          "itemIcon":Icons.exit_to_app,
          "itemName":"出入校",
          "routeName":"/",
        },
        {
          "itemIcon":Icons.notifications,
          "itemName":"缴费查询",
          "routeName":"/",
        },
        {
          "itemIcon":Icons.payment,
          "itemName":"饭卡充值",
          "routeName":"/",
        },
        {
          "itemIcon":Icons.notification_important,
          "itemName":"选课通知",
          "routeName":"/",
        },
        {
          "itemIcon":Icons.school,
          "itemName":"成绩分析",
          "routeName":"/",
        },
        {
          "itemIcon":Icons.web_asset,
          "itemName":"课本资源",
          "routeName":"/",
        },
      ]
    },
    {
      "icon":Icons.school,
      "blockName":"毕业生",
      "color":Colors.blue,
      "item":[
        {
          "itemIcon":Icons.library_books,
          "itemName":"通讯录",
          "routeName":"/",
        },
        {
          "itemIcon":Icons.home,
          "itemName":"班级主页",
          "routeName":"/",
        },
      ]
    },
    {
      "icon":Icons.apps,
      "blockName":"设置",
      "color":Colors.blue,
      "item":[
        {
          "itemIcon":Icons.update,
          "itemName":"软件更新",
          "routeName":"/",
        },
        {
          "itemIcon":Icons.done,
          "itemName":"关于",
          "routeName":"/",
        },
      ]
    }
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> _block=[];
    for(int i=0;i<featureInfo.length;i++){
      _block.add(itemBlock(context, featureInfo[i]["blockName"], featureInfo[i]["icon"], featureInfo[i]["color"],featureInfo[i]["item"]));
    }
    return Container(
      
      color: Colors.grey[200],
       child:SingleChildScrollView(
         child: Column(
           children:_block,
         ),
       ),
    );
  }
  Widget itemBlock(BuildContext context,String title,IconData icon,Color color,List item){
    var screenWidth=MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: screenWidth - 20,
            margin: const EdgeInsets.only(top: 30.0, bottom: 0.0),
            decoration: BoxDecoration(
               boxShadow: [
                BoxShadow(
                  offset: Offset(10, 10),
                  //color: Colors.black,
                  blurRadius: 30,
                  spreadRadius: -20,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: <Widget>[
                Container(
                 width: screenWidth - 20,
                  padding: const EdgeInsets.only(left: 65.0, top: 3.0),
                  height: 30.0,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: color,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Container(
      padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
      /*decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/paimaiLogo.png'),
          alignment: Alignment.bottomRight
        ),
      ),*/
      child: Container(
        height: 80*(1+((item.length)/4).floor()).toDouble(),
        padding: EdgeInsets.only(left:10,right:10),
        child:Column(
          children:_buildWidgetContainer(context, item),
        ),
      ),
    ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  height: 46.0,
                  width: 46.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  List<Widget> _buildWidgetContainer(BuildContext context,List item) {
    List<Widget> _features=[];
          List<Widget> _rows=[];
          int a=0;
    for(int i=0;i<item.length;i++){
      _rows.add(featureTab(context,item[i]["itemIcon"],item[i]["itemName"],item[i]["routeName"]));
      a++;
      if(a==4){
        a=0;
        _features.add(Row(children: _rows,));
        _rows=[];
      }
    }
    if(a!=0){
       _features.add(Row(children: _rows,));
        _rows=[];
    }
    /*if (this._firstChildList.length == 0) {
      return Container();
    }*/
    return _features;
  }
  Widget featureTab(BuildContext context,IconData icon,String title,String route){
    return  GestureDetector(
              onTap: (){print(title+" is tapped!");
                Navigator.pushNamed(context, "/go",arguments:{"inf":"hhhhhh"});
              },
                          child: Container(
                height: 80,
                width: (MediaQuery.of(context).size.width-40)/4,
                child:Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(icon,size: 30,),
                      Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
                    ],
                  ),
                ),
              ),
            );
  }
}