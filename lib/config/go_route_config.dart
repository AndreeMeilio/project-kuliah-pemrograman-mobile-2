
import 'package:go_router/go_router.dart';
import 'package:navigation_routing_practice/pages/detail_page.dart';
import 'package:navigation_routing_practice/pages/home_page.dart';
import 'package:navigation_routing_practice/pages/profile_page.dart';

GoRouter routeConfig(){
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: RoutePath.home,
        builder: (context, state) => HomePage(),
        routes: <RouteBase>[
          GoRoute(
            path: RoutePath.detail,
            builder: (context, state) => DetailPage()
          ),
          GoRoute(
            path: RoutePath.profile,
            builder: (context, state) => ProfilePage()
          ),
        ]
      )
    ]
  );
}

class RoutePath{
  static const String home = "/";
  static const String detail = "detail";
  static const String profile = "profile";
}