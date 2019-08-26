import 'package:XSer/components/school_inf_more.dart';
import 'package:XSer/utils/commonRequests.dart';
import 'package:XSer/utils/sysNote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:XSer/components/articleReader.dart';
import 'package:async/src/async_memoizer.dart';
class SchoolInf extends StatefulWidget {
  SchoolInf({Key key}) : super(key: key);

  _SchoolInfState createState() => _SchoolInfState();
}
final AsyncMemoizer _memoizer = AsyncMemoizer();
class _SchoolInfState extends State<SchoolInf> {

  SwiperController _swipeController;
  @override
  void initState() {
    _swipeController = SwiperController();
    super.initState();
  }

  @override
  void dispose() {
    _swipeController.dispose();
    super.dispose();
  }

  var _width;
  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            banner(),
            mainFutureBuilder(),
          ],
        ),
      ),
    );
  }
  Future<dynamic> _buildFuture() async{
    return _memoizer.runOnce(() async {
      return await XSerApi.getHomeArticle();
    });
  }
  Widget mainFutureBuilder(){
    return FutureBuilder(
      future: _buildFuture(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {   //snapshot就是_calculation在时间轴上执行过程的状态快照
    switch (snapshot.connectionState) {
      case ConnectionState.none: 
      return Text("请稍等。。");
      case ConnectionState.waiting:
      return NewsPlaceHolder();
      default:    //如果_calculation执行完毕
        if (snapshot.hasError)    //若_calculation执行出现异常
          return Text('Error: ${snapshot.error}');
        if(snapshot.hasData){
          if(snapshot.data.isEmpty || snapshot.data['data'].isEmpty){
            fuToast("啊哦，有点问题，可能是网络未连接", Colors.red[400], context);
            return NewsPlaceHolder();
          }
          return Column(children: <Widget>[
            notifications(snapshot.data['data']['list'][0],snapshot.data['data']['list'][1]),
            news(snapshot.data['data']['list'][2],snapshot.data['data']['list'][3]),
            schoolpublic(snapshot.data['data']['list'][4],snapshot.data['data']['list'][5]),
          ],);}
        }   //若_calculation执行正常完成
          
    });
  }
  Widget generateListTile(String title, String subtitle, {String id}) {
    return ListTile(
      title: new Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ArticleReader(
              title: title, subtitle: subtitle, id: id); //路由到新页面 传值时候写在参数里
        }));
      },
      subtitle: Text(subtitle),
    );
  }

  Widget schoolpublic(Map a,Map b) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      // width: _width-20,
      child: new Card(
        elevation: 15.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))), //设置圆角
        child: new Column(
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              title: new Text('校务公开',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              //subtitle: new Text('子标题'),
              leading: Icon(
                Icons.public,
              ),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SchoolInfMore(type: "校务公开"); //路由到新页面 传值时候写在参数里
                  }));
                },
                child: Text("查看更多"),
              ),
            ),
            new Divider(),
            generateListTile(a['title'], a['time'], id: a['id']),
            new Divider(),
            generateListTile(
                b['title'], b['time'], id: b['id']),
          ],
        ),
      ),
    );
  }

  Widget banner() {
    return Container(
      height: 150.0,
      margin: EdgeInsets.only(top: 10),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(left: 5.0, right: 5.0),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(data[index]['imageUrl']),
                  fit: BoxFit.cover,
                )),
            /*child: Container(
                        padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 2.0),
                        decoration: BoxDecoration(
                            color: colorString(
                                snap.data[index]['titleColor']),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0))),
                        child: Text(
                          snap.data[index]['typeTitle'],
                          style: TextStyle(
                              color: CupertinoColors.white,
                              fontFamily: F.Regular,
                              fontSize: 12.0),
                        ),
                      ),*/
          );
        },
        itemCount: data.length,
        autoplay: true,
        controller: _swipeController,
        autoplayDelay: 5000,
        pagination: SwiperPagination(
          margin: EdgeInsets.all(0.0),
          builder: SwiperPagination(
              margin: EdgeInsets.all(5.0),
              builder: const DotSwiperPaginationBuilder(
                  size: 6.0,
                  activeSize: 6.0,
                  space: 2.5,
                  activeColor: Colors.red,
                  color: Color.fromRGBO(255, 255, 255, 0.8))),
        ),
      ),
    );
  }

  Widget news(Map a,Map b) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      // width: _width-20,
      child: new Card(
        elevation: 15.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))), //设置圆角
        child: new Column(
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              title: new Text('最新文章',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              //subtitle: new Text('子标题'),
              leading: Icon(
                Icons.new_releases,
              ),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SchoolInfMore(type: "最新文章"); //路由到新页面 传值时候写在参数里
                  }));
                },
                child: Text("查看更多"),
              ),
            ),
            new Divider(),
            generateListTile(a['title'], a['time'], id: a['id']),
            new Divider(),
            generateListTile(b['title'], b['time'], id: b['id']),
          ],
        ),
      ),
    );
  }

  Widget notifications(Map a,Map b) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      // width: _width-20,
      child: new Card(
        elevation: 15.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))), //设置圆角
        child: new Column(
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              // contentPadding: EdgeInsets.fromLTRB(15,0,5,0),
              title: new Text('通知公告',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              //subtitle: new Text('子标题'),
              leading: Icon(Icons.notifications),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SchoolInfMore(type: "通知公告"); //路由到新页面 传值时候写在参数里
                  }));
                },
                child: Text("查看更多"),
              ),
            ),
            new Divider(),
            generateListTile(a['title'], a['time'], id: a['id']),
            new Divider(),
            generateListTile(b['title'], b['time'], id: b['id']),
          ],
        ),
      ),
    );
  }
  Widget NewsPlaceHolder(){
    return Column(
      children: <Widget>[
        Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      // width: _width-20,
      child: new Card(
        elevation: 15.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))), //设置圆角
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              // contentPadding: EdgeInsets.fromLTRB(15,0,5,0),
              title: new Text('通知公告',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              //subtitle: new Text('子标题'),
              leading: Icon(Icons.notifications),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SchoolInfMore(type: "通知公告"); //路由到新页面 传值时候写在参数里
                  }));
                },
                child: Text("查看更多"),
              ),
            ),
            new Divider(),
            generatePlaceholder(),
            new Divider(),
            generatePlaceholder(),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      // width: _width-20,
      child: new Card(
        elevation: 15.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))), //设置圆角
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              title: new Text('最新文章',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              //subtitle: new Text('子标题'),
              leading: Icon(
                Icons.new_releases,
              ),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SchoolInfMore(type: "最新文章"); //路由到新页面 传值时候写在参数里
                  }));
                },
                child: Text("查看更多"),
              ),
            ),
            new Divider(),
            generatePlaceholder(),
            new Divider(),
            generatePlaceholder(),
          ],
        ),
      ),
    ),
    Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      // width: _width-20,
      child: new Card(
        elevation: 15.0, //设置阴影
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0))), //设置圆角
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              title: new Text('校务公开',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              //subtitle: new Text('子标题'),
              leading: Icon(
                Icons.public,
              ),
              trailing: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SchoolInfMore(type: "校务公开"); //路由到新页面 传值时候写在参数里
                  }));
                },
                child: Text("查看更多"),
              ),
            ),
            new Divider(),
            generatePlaceholder(),
            new Divider(),
            generatePlaceholder(),
          ],
        ),
      ),
    ),
      ],
    );
  }
  Widget generatePlaceholder(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 8, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 15,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 15,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}









List data = [
  {
    "imageUrl":
        "https://www.nbxiaoshi.net/images/indexfiles/985.300/xiaomen2.jpg"
  },
  {
    "imageUrl":
        "https://www.nbxiaoshi.net/images/indexfiles/985.300/xiaomen.jpg"
  },
  {
    "imageUrl":
        "https://www.nbxiaoshi.net/images/indexfiles/985.300/caochang.jpg"
  },
  {
    "imageUrl":
        "https://www.nbxiaoshi.net/images/indexfiles/985.300/ibstudent.jpg"
  },
];
