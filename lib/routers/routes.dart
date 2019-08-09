import 'package:flutter/material.dart';
import 'package:xser/components/searchScore.dart';
import 'package:xser/components/bottomBar.dart';
final routes={
  '/home':(context)=>BottomBar(),
  '/go':(context,{arguments})=>SearchScore(arguments:arguments),

};

Route<dynamic> myonGenerateRoute(RouteSettings settings){
		final String name=settings.name;
		final Function pageContentBuilder=routes[name];
		if(pageContentBuilder!=null){
			if(settings.arguments!=null){
				final Route route=MaterialPageRoute(
					builder:(context)=>
						pageContentBuilder(context,arguments:settings.arguments)
				);
				return route;
			}else{
				final Route route=MaterialPageRoute(
					builder:(context)=>pageContentBuilder(context)
				);
				return route;
			}
		}
}
