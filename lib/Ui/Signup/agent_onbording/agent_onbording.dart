import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Ui/Signup/upload%20the%20face.dart';
import 'enter_pan.dart';

class Agent_onborading extends StatelessWidget {
  const Agent_onborading({super.key});

  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: mheight * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(right: mwidth * 0.2),
                  child: Text(
                    "Let’s Start Your\nAgent  Onboarding  Journey",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "boldtext",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight * 0.05,
                ),
                Enter_pan(),
                SizedBox(
                  height: mheight * 0.03,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}