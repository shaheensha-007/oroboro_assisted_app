import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> push(Widget page) {
    return navigatorKey.currentState!.push(CustomPageRoute(route: page));
  }

  static Future<dynamic> pushReplacement(Widget page) {
    return navigatorKey.currentState!
        .pushReplacement(CustomPageRoute(route: page));
  }

  static void pop() {
    navigatorKey.currentState!.pop();
  }

  static Future<dynamic> pushAndRemoveUntil(
      Widget page, bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState!
        .pushAndRemoveUntil(CustomPageRoute(route: page), predicate);
  }

  static Future<dynamic> pushMaterialRoute(MaterialPageRoute route) {
    return navigatorKey.currentState!.push(route);
  }
}

class CustomPageRoute extends PageRouteBuilder {
  final Widget route;
  final AxisDirection direction;
  CustomPageRoute({required this.route, this.direction = AxisDirection.right})
      : super(
            transitionDuration: const Duration(microseconds: 1000),
            pageBuilder: (context, animation, secondaryAnimation) => route);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      FadeTransition(
        opacity: animation,
        child: route,
      );
}
