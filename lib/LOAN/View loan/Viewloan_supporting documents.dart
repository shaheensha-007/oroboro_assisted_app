import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/LOAN/View%20loan/loan_appbar.dart';

class Viewloan_supportingdocument extends StatefulWidget {
  const Viewloan_supportingdocument({super.key});

  @override
  State<Viewloan_supportingdocument> createState() => _Viewloan_supportingdocumentState();
}

class _Viewloan_supportingdocumentState extends State<Viewloan_supportingdocument> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery
        .of(context)
        .size
        .height;
    var mwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Loan_appbar(),
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
                child: Text("Supporting  Documents", style: TextStyle(
                    fontSize: 18, fontFamily: "boldtext", fontWeight: FontWeight.w800),),
              ),
              SizedBox(
                height: mheight*0.1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
