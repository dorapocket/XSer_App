import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import '../const/const.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import "package:flutter_html/rich_text_parser.dart";
import 'package:flutter_html/image_properties.dart';
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
        body: Container(
          height:MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:SingleChildScrollView (
                        child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _title(title),
                _chips(subtitle),
                SizedBox(height: 10,),
                Divider(),
                _readerContext(),
              ],
            ),
          ),
        ),
      ),
    );
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
  Widget _chips(subtitle){
    return Row(
      children: <Widget>[
        SizedBox(width: 15,),
        Badge(
      badgeColor: C.XS_BLUE,
      shape: BadgeShape.square,
      borderRadius: 20,
      toAnimate: false,
      badgeContent:
          Text('教务处', style: TextStyle(color: Colors.white)),
    ),
    SizedBox(width: 15,),
        Badge(
      badgeColor: C.XS_BLUE,
      shape: BadgeShape.square,
      borderRadius: 20,
      toAnimate: false,
      badgeContent:
          Text('2019/10/24', style: TextStyle(color: Colors.white)),
    ),
      ],
    );
  }
  Widget _readerContext(){
    return Html(
  data:S.testdata,
  //Optional parameters:
  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
  backgroundColor: Colors.white70,
  defaultTextStyle: TextStyle(fontFamily: 'serif'),
  linkStyle: const TextStyle(
    color: Colors.redAccent,
  ),
  onLinkTap: (url) {
    // open url in a webview
  },
  onImageTap: (src) {
    // Display the image in large form.
  },
  useRichText:true,
  //Must have useRichText set to false for this to work.
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