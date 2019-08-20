import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';
import '../const/const.dart';

class ZefyrLogo extends StatelessWidget {
  String title;
  ZefyrLogo(this.title);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        //FlutterLogo(size: 24.0),
        //Text('yr'),
      ],
    );
  }
}

class FullPageEditorScreen extends StatefulWidget {
  String title;
  String type;
  FullPageEditorScreen(this.title,this.type);
  @override
  _FullPageEditorScreenState createState() => new _FullPageEditorScreenState(title,type);
}

final doc =r'[{"insert":"DD90文本编辑器 H1"},{"insert":"\n","attributes":{"heading":1}}]';

Delta getDelta() {
  return Delta.fromJson(json.decode(doc) as List);
}

class _FullPageEditorScreenState extends State<FullPageEditorScreen> {
  String title;
  String type;
  _FullPageEditorScreenState(this.title,this.type);
  final ZefyrController _controller =
      ZefyrController(NotusDocument.fromDelta(getDelta()));
  final FocusNode _focusNode = new FocusNode();
  bool _editing = true;
  StreamSubscription<NotusChange> _sub;

  @override
  void initState() {
    super.initState();
    _sub = _controller.document.changes.listen((change) {
      print('${change.source}: ${change.change}');
    });
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = new ZefyrThemeData(
      cursorColor: Colors.blue,
      toolbarTheme: ZefyrToolbarTheme.fallback(context).copyWith(
        color: Colors.grey.shade800,
        toggleColor: Colors.grey.shade900,
        iconColor: Colors.white,
        disabledIconColor: Colors.grey.shade500,
      ),
    );

    final done = _editing
        ? [new FlatButton(onPressed: _stopEditing, child: Text('提交',style: TextStyle(color: Colors.white),))]
        : [new FlatButton(onPressed: _startEditing, child: Text('继续编辑',style: TextStyle(color: Colors.white),))];
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: C.XS_BLUE,
        brightness: Brightness.light,
        title: ZefyrLogo(title),
        actions: done,
      ),
      body: ZefyrScaffold(
        child: ZefyrTheme(
          data: theme,
          child: ZefyrEditor(
            controller: _controller,
            focusNode: _focusNode,
            enabled: _editing,
            imageDelegate: new CustomImageDelegate(),
          ),
        ),
      ),
    );
  }

  void _startEditing() {
    setState(() {
      _editing = true;
    });
  }

  void _stopEditing() {
    setState(() {
      _editing = false;
    });
  }
}

/// Custom image delegate used by this example to load image from application
/// assets.
///
/// Default image delegate only supports [FileImage]s.
class CustomImageDelegate extends ZefyrDefaultImageDelegate {
  @override
  Widget buildImage(BuildContext context, String imageSource) {
    // We use custom "asset" scheme to distinguish asset images from other files.
    if (imageSource.startsWith('asset://')) {
      final asset = new AssetImage(imageSource.replaceFirst('asset://', ''));
      return new Image(image: asset);
    } else {
      return super.buildImage(context, imageSource);
    }
  }
}