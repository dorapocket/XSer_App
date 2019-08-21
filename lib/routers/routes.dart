import 'package:fluro/fluro.dart';
import 'package:XSer/components/searchScore.dart';
import 'package:XSer/components/bottomBar.dart';
//import '../components/searchScoretest.dart';
import 'package:XSer/components/about.dart';
import '../components/dd90_list.dart';
import '../components/editor.dart';
import '../components/dd90_content.dart';
import '../components/purchase.dart';
import '../components/login.dart';
class Routes {
  static Router router;
  static String homePage = '/home';
  static String searchScore = '/searchScore';
  static String about = '/about';
  static String dd90List = '/dd90List';
  static String editor = '/editor';
  static String dd90content = '/dd90content';
  static String purchase = '/purchase';
  static String login='/login';
  static void configureRoutes(Router router) {
    router.define(homePage,
        handler: Handler(handlerFunc: (context, params) => BottomBar()));
        router.define(login,
        handler: Handler(handlerFunc: (context, params) => LoginPage()));
         router.define(purchase,
        handler: Handler(handlerFunc: (context, params) => Purchase()));
        router.define(dd90content,
        handler: Handler(handlerFunc: (context, params) => DD90Content()));
    router.define(dd90List,
        handler: Handler(handlerFunc: (context, params) => DD90List()));
    router.define(about,
        handler: Handler(handlerFunc: (context, params) => About()));
    router.define(searchScore, handler: Handler(handlerFunc: (context, params) {
      var step = params['step']?.first; //取出传参
      //var maya = params['maya']?.first; //取出传参
      return SearchScore(step);
    }));
    router.define(editor, handler: Handler(handlerFunc: (context, params) {
      String title = params['title']?.first; //取出传参

      String type = params['type']?.first; //取出传参
      return FullPageEditorScreen(title, type);
    }));
    Routes.router = router;
  }
}
