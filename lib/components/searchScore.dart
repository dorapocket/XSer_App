import 'package:XSer/utils/commonRequests.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:XSer/main.dart';
import 'package:XSer/routers/routes.dart';
import 'package:XSer/const/const.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:async/src/async_memoizer.dart';
class SearchScore extends StatefulWidget {
  final step;
  String id="";
  String name="";
  SearchScore(this.step,{this.id,this.name}){
    print(id);
  }
  _SearchScoreState createState() => _SearchScoreState(int.parse(step),id:id,name:name);
}
final AsyncMemoizer _memoizer = AsyncMemoizer();
String selectExam="";
String selectExamName="";
class _SearchScoreState extends State<SearchScore> {
  String id="";
  String name="";
  List<String> normalexams=["请选择"];
  int step;
  _SearchScoreState(this.step,{this.id,this.name});
  Future<dynamic> _buildFuture() async{
    return _memoizer.runOnce(() async {
      return await XSerApi.getExamList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _gettitle(step),
      body: _getbody(step),
    );
  }

  @override
  void initState() { 
    super.initState();
     //_buildFuture(); 
    
  }
  _getbody(step) {
    switch (step) {
      case 0:
        return typeSelect(); //选择查询类别
        break;
      case 1:
        return FutureBuilder(
          future: _buildFuture(),
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
        return normalExam(snapshot.data['data']);
          }},);

        break;
      case 2:
        return runExam(); //考查课查询
        break;
      case 3:
      print("考试id为：${id}");
              return FutureBuilder(
          future: XSerApi.getExamScore(id),
          builder: (BuildContext context, AsyncSnapshot snapshot) { 
            //print(snapshot.data);     //snapshot就是_calculation在时间轴上执行过程的状态快照
    switch (snapshot.connectionState) {
      case ConnectionState.none: 
      return Text("请稍等。。");
      case ConnectionState.waiting:
      return Center(
        child: CircularProgressIndicator(),
      );
      default:    //如果_calculation执行完毕
        if (snapshot.hasError||!snapshot.hasData){
          if(snapshot.data['data'].isEmpty){
              return Center(
                child: Text(
                  snapshot.data['msg']
                ),
              );
            }
            return Text('非常抱歉，出了点问题，请稍后重试吧！');
        }    //若_calculation执行出现异常
        
          
        return resultPage(snapshot.data['data'],name);
          }},);
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
                      "走班选课成绩查询",
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

  Widget normalExam(List examlist) {
    List<String> exams=[];
    if(examlist.isEmpty){
      return Container();
    }
    examlist.forEach((value){
      exams.add(value['examName']);
    });
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
      selectExam=examlist[0]['examId'];
      selectExamName=examlist[0]['examName'];
    final dsl = DirectSelectList<String>(
        values: exams,
        defaultItemIndex: exams.length,
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
                                      values: exams,
                                      defaultItemIndex: 0,
                                      itemBuilder: (String value) =>
                                          getDropDownMenuItem(value),
                                      focusedItemDecoration:
                                          _getDslDecoration(),
                                      onItemSelectedListener:
                                          (item, index, context) {
                                        selectExam=examlist[index]['examId'];
                                        selectExamName=examlist[index]['examName'];
                                        print(index);
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
                      var examid=Uri.encodeQueryComponent(selectExam);
                      var examname=Uri.encodeQueryComponent(selectExamName);
                      print("路由：${examid}---->${examname}");
                      Routes.router.navigateTo(
                          context, '${Routes.searchScore}?step=$json&examid=$examid&examname=$examname', //跳转路径
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
    final zbxkexams = [
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
        values: zbxkexams,
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
                                      values: zbxkexams,
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

  Widget resultPage(data,name) {
    if(id==""||name==""){
      return Container();
    }
    List<Map> list=[];
    data.forEach((value){
      list.add({
        "subject":value['0'],
        "score":value['1'],
      });
    });
    list.removeAt(0);
    print("生成考试成绩视图");
    print("data:"+list.toString());
    List<Map> getDataList() {
    return list;
  }

  Widget getItemContainer(Map item) {
    return Container(
      decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            item["subject"],
            style: TextStyle(color: C.XS_BLUE, fontSize: 20,fontWeight:FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.all(10),
                      child: Text(
              item["score"].toString(),
              
              style: TextStyle(color: Colors.blue, fontSize: 30,fontWeight:FontWeight.w500,fontFamily: "Montserrat"),
            ),
          ),
        ],
      ),

    );
  }
  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: Colors.grey[200],
    child: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: C.XS_BLUE,
          child: Center(
            child: Text(name,
        style: TextStyle(
          color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
        ),),
          ),
        ),
        Expanded(
                child: GridView.count(
              //水平子Widget之间间距
              crossAxisSpacing: 6.0,
              //垂直子Widget之间间距
              mainAxisSpacing: 6.0,
              //GridView内边距
              padding: EdgeInsets.all(10.0),
              //一行的Widget数量
              crossAxisCount: 3,
              //子Widget宽高比例
              childAspectRatio: 0.7,
              //子Widget列表
              children: getWidgetList(),
            ),
        ),
      ],
    ),
  );
  }
}
