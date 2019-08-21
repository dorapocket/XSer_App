//要传值的页面这么写：
/*
import 'package:fluro/fluro.dart';
import 'package:XSer/routers/routes.dart';
var json =Uri.encodeQueryComponent("haha"); //传输内容 要encode
var j2=Uri.encodeQueryComponent("我是lgy");
Routes.router.navigateTo(
  context, 
  '${Routes.searchScore}?message=$json&maya=$j2',//跳转路径 get格式
  transition: TransitionType.inFromRight//过场效果
);
*/
//在router.dart里面
/*
static String searchScore = '/go';
router.define(
  searchScore, 
  handler: Handler(handlerFunc: (context, params) {
    var message = params['message']?.first;//取出传参
    var maya = params['maya']?.first;//取出传参
    return SearchScore(message,maya);
  }
  )
);





环境记得把
C:\Users\dorap\AppData\Roaming\Pub\Cache\hosted\pub.flutter-io.cn\jpush_flutter-0.0.13\android
里面android：support删掉 不然会有冲突错误
*/