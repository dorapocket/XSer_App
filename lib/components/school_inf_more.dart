import 'package:flutter/material.dart';
import '../const/const.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import '../utils/commonRequests.dart';
import 'articleReader.dart';
class SchoolInfMore extends StatefulWidget {
  final String type;
  SchoolInfMore({Key key,this.type}) : super(key: key);

  _SchoolInfMoreState createState() => _SchoolInfMoreState(type:type);
}

class _SchoolInfMoreState extends State<SchoolInfMore> {
  EasyRefreshController _controller = EasyRefreshController();
  final String type;
  _SchoolInfMoreState({this.type});
  int _page=1;
  int _count = 0;
  List _data=[];
  bool _first=true;
@override
void initState() { 
  refreshList(type);
  super.initState();
}

  refreshList(String type)async{
    Map<String,dynamic> data=await XSerApi.getArticleList(type, _page);
    if(data['data']['cnt']>=0){
      setState(() {
      _count=data['data']['cnt'];
      _data=data['data']['list'];
      _first=false;
      });
    }else{
      setState(() {
              _count=0;
      });
    }
  }
  loadList(String type)async{
    _page+=1;
    Map<String,dynamic> data=await XSerApi.getArticleList(type, _page);
    if(data['data']['cnt']>=0){
      setState(() {
      _count+=data['data']['cnt'];
      _data.addAll(data['data']['list']);
      });
    }else{
      
    }
  }
  @override
  Widget build(BuildContext context) {
    if(_first){
      return Scaffold(
        appBar: AppBar(
        title: Text(type),
        backgroundColor: C.XS_BLUE,
      ),
              body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(type),
        backgroundColor: C.XS_BLUE,
      ),
      body: EasyRefresh.custom(
        controller: _controller,
        header: BezierCircleHeader(),
        footer: BezierBounceFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3), () {
              refreshList(type);
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 3), () {
            setState(() {
              loadList(type);
            });
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListItemBuild(_data[index]['title'],_data[index]['time'],_data[index]['id']);
              },
              childCount: _count,
            ),
          ),
        ],
      ),
    );
  }

  Widget ListItemBuild(title,time,id){
    return GestureDetector(
      onTap:(){
        if(id!="0"){
        	Navigator.of(context).push(
			MaterialPageRoute(
				builder:(BuildContext context){
					return ArticleReader(title:title,subtitle:time,id:id);     //路由到新页面 传值时候写在参数里
      },));
        }
      },
          child: Card(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                time,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}