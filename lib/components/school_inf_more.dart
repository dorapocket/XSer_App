import 'package:flutter/material.dart';
import '../const/const.dart';
class SchoolInfMore extends StatefulWidget {
  final String type;
  SchoolInfMore({Key key,this.type}) : super(key: key);

  _SchoolInfMoreState createState() => _SchoolInfMoreState(type:type);
}

class _SchoolInfMoreState extends State<SchoolInfMore> {
  final String type;
  _SchoolInfMoreState({this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text(type),
           backgroundColor: C.XS_BLUE,
         ),
         body: Container(
           child: ListView.builder(
             itemCount: S.readmoredata.length,
             itemBuilder: (context,index){
               return ListTile(
                 title: Text(S.readmoredata[index]["title"],style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,maxLines: 1,),
                 trailing: Text(S.readmoredata[index]["time"]),
               );
             },
           ),
         ),
       ),
    );
  }
}