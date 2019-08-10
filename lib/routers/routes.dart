import 'package:fluro/fluro.dart';
import 'package:xser/components/searchScore.dart';
import 'package:xser/components/bottomBar.dart';

class Routes {
  static Router router;
  static String homePage = '/home';
  static String searchScore = '/go';

  static void configureRoutes(Router router) {
    router.define(homePage,
        handler: Handler(handlerFunc: (context, params) => BottomBar()));
    router.define(searchScore, handler: Handler(handlerFunc: (context, params) {
      var message = params['message']?.first; //取出传参
      var maya = params['maya']?.first; //取出传参
      return SearchScore(message, maya);
    }));
    Routes.router = router;
  }
}
