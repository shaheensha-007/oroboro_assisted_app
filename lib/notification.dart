import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Ui/apparbar/myappbar.dart';


class Notification1 extends StatefulWidget {
  const Notification1({super.key});

  @override
  State<Notification1> createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {

  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: MyAppbar(),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mheight*0.1,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.1),
                child: Text("Notification", style: TextStyle(
                    fontSize: 18, fontFamily: "boldtext", fontWeight: FontWeight.w800),),
              ),
              SizedBox(
                height: mheight*0.1,
              ),
              Expanded(
                child: ListView.builder(itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:EdgeInsets.only(left: mwidth*0.05),
                          child: Text("Customers KYC Registration-Done by SHA \n Mobiles13-09-2023",style: TextStyle(fontSize: 14, fontFamily: "boldtext", fontWeight: FontWeight.w200,color: Color(0xff6F788E)),),
                        ),
                        Divider(
                          color: Color(0xff6F788E),
                          indent: mwidth*0.05,
                          endIndent: mwidth*0.05,
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}