import 'package:flutter/material.dart';

class SearchScore extends StatelessWidget {
  final arguments;
  const SearchScore({Key key,this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        child: Row(
          children: <Widget>[
            Container(
              child:Text(
                arguments['inf'],
              ),
            ),
            Container(
              child: Text(
                "考查课成绩查询"
              ),
            ),
          ],
        ),
      ),
    );
  }
}