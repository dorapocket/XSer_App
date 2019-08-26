import 'dart:async';

import 'package:XSer/routers/routes.dart';
import 'package:XSer/utils/commonRequests.dart';
import 'package:XSer/utils/sysNote.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import '../const/const.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
class ArticleReader extends StatelessWidget {
    final String title;
    final String id;
    final String subtitle;
    final Key key;
  const ArticleReader({
    this.key,
    @required this.title,
    @required this.id,
    @required this.subtitle,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "分享",
        currentButton: FloatingActionButton(
          heroTag: "share",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.share),
          onPressed: () {},
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "收藏",
        currentButton: FloatingActionButton(
            onPressed: (){},
            heroTag: "like",
            backgroundColor: Colors.greenAccent,
            mini: true,
            child: Icon(Icons.label))));

    return Container(
      child: Scaffold(
        floatingActionButton: UnicornDialer(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
            parentButtonBackground: C.XS_BLUE,
            orientation: UnicornOrientation.VERTICAL,
            parentButton: Icon(Icons.add),
            childButtons: childButtons),
        appBar: AppBar(
          title: Text(title),
          backgroundColor: C.XS_BLUE,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            },),
        ),
        body: FutureBuilder(
  future: XSerApi.getArticle(id:id), // 用户定义的需要异步执行的代码，类型为Future<String>或者null的变量或函数
  builder: (BuildContext context, AsyncSnapshot snapshot) {      //snapshot就是_calculation在时间轴上执行过程的状态快照
    switch (snapshot.connectionState) {
      case ConnectionState.none: 
      return Text("请稍等。。");
      case ConnectionState.waiting:
      return Center(
        child: CircularProgressIndicator(),
      );
      default:    //如果_calculation执行完毕
        if (snapshot.hasError||!snapshot.hasData)    //若_calculation执行出现异常
          return Text('非常抱歉，出了点问题，请稍后重试吧！');
        if(snapshot.data['content']=="Permission denied!"){
      print("权限文章需要登陆");
      Timer(
                          Duration(milliseconds: 500),
                          (){
                               fuToast("啊呀!这篇文章有权限哦，请登录后服用~", Colors.red[400], context);
                          });
      
    }

          return Container(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:SingleChildScrollView (
                        child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _title(title),
                _chips(date:snapshot.data['time']['year']+'年'+snapshot.data['time']['month']+'月'+snapshot.data['time']['day']+'日',from:snapshot.data['author']),
                SizedBox(height: 10,),
                Divider(),
                _readerContext(snapshot.data['content'],context),
              ],
            ),
          ),
        );
        }   //若_calculation执行正常完成
  },)
));
        
  }

  Widget _title(title){
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
      child:Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
  Widget _chips({date,from}){
    return Row(
      children: <Widget>[
        SizedBox(width: 15,),
        Badge(
      badgeColor: C.XS_BLUE,
      shape: BadgeShape.square,
      borderRadius: 20,
      toAnimate: false,
      badgeContent:
          Text(from, style: TextStyle(color: Colors.white)),
    ),
    SizedBox(width: 15,),
        Badge(
      badgeColor: C.XS_BLUE,
      shape: BadgeShape.square,
      borderRadius: 20,
      toAnimate: false,
      badgeContent:
          Text(date, style: TextStyle(color: Colors.white)),
    ),
      ],
    );
  }
  Widget _readerContext(String htmldata,BuildContext context){
    if(htmldata=="Permission denied!"){
      return Padding(
        padding: const EdgeInsets.only(top:200),
        child: Center(
          child:Column(
            children: <Widget>[
              Text("啊哦，这是权限文章,咱们没有权限TAT"),
              Text("登陆后再来吧~"),
              SizedBox(height: 30,),
              
            ],
          )
        ),
      );
    }
    return Html(
  data:htmldata,
  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
  backgroundColor: Colors.white70,
  defaultTextStyle: TextStyle(fontFamily: 'serif'),
  linkStyle: const TextStyle(
    color: Colors.redAccent,
  ),
  onLinkTap: (url) {
    // 点击url操作 打开webview
  },
  onImageTap: (src) {
    // 点击图片操作
  },
  useRichText:true,
  //richtext为false时候“costom”系函数才工作！！！
  customRender: (node, children) {
    if(node is dom.Element) {
      switch(node.localName) {
        //case "video": return Chewie(...);
        //case "custom_tag": return CustomWidget(...);
      }
    }
  },
  customTextAlign: (dom.Node node) {
    if (node is dom.Element) {
      switch (node.localName) {
        case "p":
          return TextAlign.justify;
      }
    }
  },
  customTextStyle: (dom.Node node, TextStyle baseStyle) {
    if (node is dom.Element) {
      switch (node.localName) {
        case "p":
          return baseStyle.merge(TextStyle(height: 1, fontSize: 18));
      }
    }
    return baseStyle;
  },
);
  }
}