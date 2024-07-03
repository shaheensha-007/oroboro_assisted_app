import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/mpin/alreadyMpin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Signin/signin_page.dart';
import '../Signup/agent_onbording.dart';




class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override State<Splash_Screen> createState() => _Splash_ScreenState();
}
late List<String> tokenModel;
class _Splash_ScreenState extends State<Splash_Screen> {

  Future<void> checkuserlogin() async {
    final preferences = await SharedPreferences.getInstance();

    Future.delayed(const Duration(seconds: 2), () {
      if (preferences.containsKey('Token')) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) => const Already_mpin()), (route) => true);
      }
      else {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
            builder: (context) => const Signin_page ()), (route) => true);
      }
    });
  }


  @override void initState() {

    checkuserlogin();
  }

  // TODO: implement initState    super.initState();  }
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