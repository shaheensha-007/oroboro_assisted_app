import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/apparbar/myappbar.dart';

class Lastest_comments extends StatefulWidget {
  const Lastest_comments({super.key});

  @override
  State<Lastest_comments> createState() => _Lastest_commentsState();
}

class _Lastest_commentsState extends State<Lastest_comments> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
     appBar: AppBar(
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
                child: Text("Lastest Comments", style: TextStyle(
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
