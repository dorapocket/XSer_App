import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import '../const/const.dart';
import 'package:unicorndial/unicorndial.dart';
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
    return Padding(
      padding: EdgeInsets.all(20),
          child: RichText(
        text: TextSpan(
          style: TextStyle(color: Colors.black),
          text:'''
          Text组件也是日常开发中最常用的基础组件之一，我们通常用它来展示文本信息。来看下其构造函数（已省略不常用属性）：

const Text(
  this.data, {
  Key key,
  this.style,
  this.textAlign,
  this.softWrap,
  this.overflow,
  this.maxLines,
})
data: 显示的文本信息；
style: 文本样式，Flutter提供了一个TextStyle类，最常用的fontSize，fontWeight，color，backgroundColor和shadows等属性都是通过它设置的；
textAlign: 文字对齐方式，常用可选值有TextAlign的left，right，center和justify；
softWrap: 文字是否换行；
overflow: 当文字溢出的时候，以何种方式处理（默认直接截断）。可选值有TextOverflow的clip，fade，ellipsis和visible；
maxLines: 当文字超过最大行数还没显示完的时候，就会根据overflow属性决定如何截断处理。
Flutter的Text组件足够灵活，提供了各种属性让我们定制，不过一般情况下，我们更多地只需下方几行代码就足够了：

Text(
  '这是测试文本',
  style: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Color(0xFF999999),
  ),
)
除了上述的应用场景外，有时我们还会遇到富文本的需求（即一段文本中，可能需要不同的字体样式）。比如在一些UI设计中经常会遇到表示价格的时候，￥符号比金额的字号小点。对于此类需求，我们可以用Flutter提供的Text.rich构造函数来创建相应的文本组件：
'''
        ),
      ),
    );
  }
}