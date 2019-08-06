import 'package:flutter/material.dart';
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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            },),
        ),
        body: Container(),
      ),
    );
  }
}