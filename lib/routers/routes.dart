import 'package:fluro/fluro.dart';
import 'package:xser/components/searchScore.dart';
import 'package:xser/components/bottomBar.dart';
//import '../components/searchScoretest.dart';

class Routes {
  static Router router;
  static String homePage = '/home';
  static String searchScore = '/searchScore';

  static void configureRoutes(Router router) {
    router.define(homePage,
        handler: Handler(handlerFunc: (context, params) => BottomBar()));
    router.define(searchScore, handler: Handler(handlerFunc: (context, params) {
      var step = params['step']?.first; //取出传参
      //var maya = params['maya']?.first; //取出传参
      return SearchScore(step);
    }));
    Routes.router = router;
  }
}
