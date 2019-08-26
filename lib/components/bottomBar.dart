import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import '../const/const.dart';
import 'school_inf.dart';
import 'myxs.dart';
import 'myFeatures.dart';
class BottomBar extends StatefulWidget {
  int pagea=0;
  BottomBar({Key key}) : super(key: key);
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedPos = 0;
  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.info, "校园要闻", C.XS_BLUE),
    new TabItem(Icons.school, "我的效实", C.XS_BLUE),
    new TabItem(Icons.settings, "功能列表", C.XS_BLUE),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }
 double cheight=0;
 double cwidth=0;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    cheight=size.height-bottomNavBarHeight;
    cwidth=size.width;
    return Scaffold(
      appBar: AppBar(
        title:Image.asset("images/xsxh.png",scale: 10,),
        centerTitle: true,
        backgroundColor: C.XS_BLUE,
        /*actions:<Widget>[IconButton(icon: Icon(Icons.notifications_active),onPressed: (){},)],*/
      ),
      body: Stack(
        children: <Widget>[
          Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Color selectedColor = tabItems[selectedPos].color;
    Widget tabpages;
    switch (selectedPos) {
      case 0:
        tabpages = SchoolInf();
        break;
      case 1:
        tabpages = MyXS();
        break;
      case 2:
        tabpages = MyFeatures();
        break;
    }

    return Container(
        width: cwidth,
        height: cheight,
        color: selectedColor,
        child: Container(
          child:tabpages
        ),
      );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}