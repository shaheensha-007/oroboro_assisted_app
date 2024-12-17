import 'dart:async';
import 'package:flutter/material.dart';

import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Signin/signin_page.dart';
import '../mpin/alreadyMpin.dart';




class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override State<Splash_Screen> createState() => _Splash_ScreenState();
}
late List<String> tokenModel;
class _Splash_ScreenState extends State<Splash_Screen> {

  Future<void> checkuserlogin() async {
    final preferences = await SharedPreferences.getInstance();

    Future.delayed(const Duration(seconds: 2), () {
      if (preferences.containsKey('success')) {
      NavigationService.pushAndRemoveUntil(Already_mpin(), (Route<dynamic>route) => false);
      }
      else {
      NavigationService.pushAndRemoveUntil(Signin_page(), (Route<dynamic>route) => false);
      }
    });
  }


  @override void initState() {

    checkuserlogin();
  }

  // TODO: implement initState    super.initState();  }
  @override
  Widget build(BuildContext context) {
    var mwidth = MediaQuery
        .of(context)
        .size
        .width;
    var mheight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Center(
        child: Image.asset('assets/Splansh image.png',)),);
  }

  @override void dispose() {
    super.dispose();
  }

}