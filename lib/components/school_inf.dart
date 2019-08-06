import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:xser/components/articleReader.dart';

class SchoolInf extends StatefulWidget {
  SchoolInf({Key key}) : super(key: key);

  _SchoolInfState createState() => _SchoolInfState();
}

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
            notifications(),
            news(),
            schoolpublic(),
          ],
        ),
      ),
    );
  }

Widget generateListTile(String title,String subtitle,{String id}){
   return ListTile(
              title: new Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: (){
                		Navigator.of(context).push(
			MaterialPageRoute(
				builder:(BuildContext context){
					return ArticleReader(title:title,subtitle:subtitle,id:id);     //路由到新页面 传值时候写在参数里
				}
			)
		);

              },
              subtitle: Text(subtitle),
            );
}
Widget schoolpublic(){
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
                onPressed: () {},
                child: Text("查看更多"),
              ),
            ),
            new Divider(),
            generateListTile("20190621东部考务会议点名情况", "2019-8-3 / 教务处",id:'22222'),
            new Divider(),
            generateListTile("2019年 6月17日早上升旗仪式（教工大会）点名汇总表（东部校区）", "2019-8-2 / 教务处",id:'22223'),
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

  Widget news() {
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
                onPressed: () {},
                child: Text("查看更多"),
              ),
            ),
            new Divider(),
        
              generateListTile("感知名校文化    领略科技之光—", "2019-8-3 / 教务处",id:'2235324'),
    
            new Divider(),
            generateListTile("2022届暑期辅导安排", "2019-8-3 / 教务处",id:'2234554'),
          
          ],
        ),
      ),
    );
  }
  Widget notifications() {
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
                onPressed: () {},
                child: Text("查看更多"),
              ),
            ),
            new Divider(),
            generateListTile("2022届暑期辅导安排", "2019-8-3 / 教务处",id:'2234554'),  
            new Divider(),
            generateListTile("2022届数理类特色班选拔和竞赛辅导通知", "2019-7-28 / 教务处",id:'2222354'),
          ],
        ),
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
