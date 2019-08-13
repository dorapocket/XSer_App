import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:xser/main.dart';
import 'package:xser/routers/routes.dart';
import 'package:xser/const/const.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'searchScoreStep.dart';

class SearchScore extends StatefulWidget {
  final step;
  const SearchScore(this.step);
  _SearchScoreState createState() => _SearchScoreState(int.parse(step));
}

class _SearchScoreState extends State<SearchScore> {
  int step;
  _SearchScoreState(this.step);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _gettitle(step),
      body: _getbody(step),
    );
  }

  _getbody(step) {
    switch (step) {
      case 0:
        return typeSelect(); //选择查询类别
        break;
      case 1:
        return normalExam(); //普通考试查询
        break;
      case 2:
        return runExam();  //考查课查询
        break;
      case 3:
        return Container();  //查询结果页
        break;
      default:
      typeSelect(); //选择查询类别
        break;
    }
  }

  _gettitle(step) {
    switch (step) {
      case 0:
        return AppBar(
          title: Text("欢迎！"),
          backgroundColor: C.XS_BLUE,
        );
        break;
      case 1:
        return AppBar(
          title: Text("想查哪一次考试？"),
          backgroundColor: Colors.blue,
        );
        break;
      case 2:
        return AppBar(
          title: Text("想查哪一次考试？"),
          backgroundColor: Colors.redAccent,
        );
        break;
      case 3:
        return AppBar(
          title: Text("查询结果"),
          backgroundColor: Colors.green,
        );
        break;
      default:
        return AppBar(
          title: Text("选择考试类别"),
        );
        break;
    }
  }

  Widget typeSelect() {
    final updownSize = 100;
    final betweenSize = 100;
    final lr = 20;
    return Container(
      color: Colors.grey[300],
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("通识课成绩查询");
              var json = Uri.encodeQueryComponent("1");
              Routes.router.navigateTo(
                  context, '${Routes.searchScore}?step=$json', //跳转路径
                  transition: TransitionType.fadeIn);
            },
            child: Container(
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
              width: MediaQuery.of(context).size.width - lr * 2,
              height: (MediaQuery.of(context).size.height -
                      updownSize * 2 -
                      betweenSize) /
                  2,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        "images/exam.png",
                        scale: 15,
                      ),
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
          ),
          SizedBox(height: betweenSize.toDouble()),
          GestureDetector(
            onTap: () {
              var json = Uri.encodeQueryComponent("2");
              Routes.router.navigateTo(
                  context, '${Routes.searchScore}?step=$json', //跳转路径
                  transition: TransitionType.fadeIn);
            },
            child: Container(
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
              width: MediaQuery.of(context).size.width - lr * 2,
              height: (MediaQuery.of(context).size.height -
                      updownSize * 2 -
                      betweenSize) /
                  2,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset("images/run.png", scale: 9),
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
          ),
        ],
      ),
    );
  }

  Widget normalExam() {
    final _exams = [
      "九校联考",
      "十校联考",
      "11校联考",
      "12校联考",
      "13校联考",
      "14校联考",
    ];
    DirectSelectItem<String> getDropDownMenuItem(String value) {
      return DirectSelectItem<String>(
          itemHeight: 56,
          value: value,
          itemBuilder: (context, value) {
            return Text(value);
          });
    }

    _getDslDecoration() {
      return BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(width: 1, color: Colors.black12),
          top: BorderSide(width: 1, color: Colors.black12),
        ),
      );
    }

    final dsl = DirectSelectList<String>(
        values: _exams,
        defaultItemIndex: 3,
        itemBuilder: (String value) => getDropDownMenuItem(value),
        focusedItemDecoration: _getDslDecoration(),
        onItemSelectedListener: (item, index, context) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(item)));
        });
    return DirectSelectContainer(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              height: 250,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Opacity(
                        opacity: 0.4,
                        child: Image.asset(
                          "images/exam.png",
                          scale: 15,
                        )),
                  ),
                  Center(
                    child: Text(
                      "通识课考试成绩查询",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    margin: EdgeInsets.only(left: 4),
                    child: Text(
                      "选择考试",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    margin: EdgeInsets.only(left: 4),
                    child: Text(
                      "长按选项框并上下拖动来选择想要查询的考试",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Card(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                  child: DirectSelectList<String>(
                                      values: _exams,
                                      defaultItemIndex: 0,
                                      itemBuilder: (String value) =>
                                          getDropDownMenuItem(value),
                                      focusedItemDecoration:
                                          _getDslDecoration(),
                                      onItemSelectedListener:
                                          (item, index, context) {
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(content: Text(item)));
                                      }),
                                  padding: EdgeInsets.only(left: 12))),
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.unfold_more,
                              color: Colors.black38,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "查询",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      var json = Uri.encodeQueryComponent("3");
                      Routes.router.navigateTo(
                          context, '${Routes.searchScore}?step=$json', //跳转路径
                          transition: TransitionType.fadeIn);
                    },
                    textColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget runExam() {
    final _exams = [
      "2019学年查课总评",
      "2020学年查课总评",
      "2021学年查课总评",
      "2022学年查课总评",
      "2023学年查课总评",
      "2024学年查课总评",
    ];
    DirectSelectItem<String> getDropDownMenuItem(String value) {
      return DirectSelectItem<String>(
          itemHeight: 56,
          value: value,
          itemBuilder: (context, value) {
            return Text(value);
          });
    }

    _getDslDecoration() {
      return BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(width: 1, color: Colors.black12),
          top: BorderSide(width: 1, color: Colors.black12),
        ),
      );
    }

    final dsl = DirectSelectList<String>(
        values: _exams,
        defaultItemIndex: 3,
        itemBuilder: (String value) => getDropDownMenuItem(value),
        focusedItemDecoration: _getDslDecoration(),
        onItemSelectedListener: (item, index, context) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(item)));
        });
    return DirectSelectContainer(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              height: 250,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Opacity(
                        opacity: 0.4,
                        child: Image.asset(
                          "images/run.png",
                          scale: 8,
                        )),
                  ),
                  Center(
                    child: Text(
                      "考查课考试成绩查询",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    margin: EdgeInsets.only(left: 4),
                    child: Text(
                      "选择考试",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    margin: EdgeInsets.only(left: 4),
                    child: Text(
                      "长按选项框并上下拖动来选择想要查询的考试",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Card(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                  child: DirectSelectList<String>(
                                      values: _exams,
                                      defaultItemIndex: 0,
                                      itemBuilder: (String value) =>
                                          getDropDownMenuItem(value),
                                      focusedItemDecoration:
                                          _getDslDecoration(),
                                      onItemSelectedListener:
                                          (item, index, context) {
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(content: Text(item)));
                                      }),
                                  padding: EdgeInsets.only(left: 12))),
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.unfold_more,
                              color: Colors.black38,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "查询",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    textColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
