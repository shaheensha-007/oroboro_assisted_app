import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loan_appbar.dart';

class Viewloan_collateraldetalis extends StatefulWidget {
  const Viewloan_collateraldetalis({super.key});

  @override
  State<Viewloan_collateraldetalis> createState() => _Viewloan_collateraldetalisState();
}

class _Viewloan_collateraldetalisState extends State<Viewloan_collateraldetalis> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Loan_appbar(),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mheight*0.1,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.1),
                  child: Text("Collateral Details", style: TextStyle(
                      fontSize: 18, fontFamily: "boldtext", fontWeight: FontWeight.w800),),
                ),
                SizedBox(
                  height: mheight*0.2,
                ),
                  Padding(
                    padding:EdgeInsets.only(left: mwidth*0.1,right: mwidth*0.1),
                    child: Container(
            height: mheight*0.4,
            width: mwidth * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff2B45A3).withOpacity(0.5),
                  spreadRadius: -4,
                  blurRadius: 11,
                  offset: Offset(
                      0, 6), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding:EdgeInsets.only(top: mheight*0.03),
              child: Column(
                  children: [
              Padding(
              padding:EdgeInsets.only(left: mwidth*0.05),
              child: Row(
                children: [
                  Text("Name",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: mwidth*0.05),
                    child: Text("MOHAMMED SHAHEEN PK",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
                  )
                ],
              ),
            ),
              SizedBox(
                height: mheight*0.02,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.05),
                child: Row(
                  children: [
                    Text("PAN",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mwidth*0.05),
                      child: Text("HSHPP1158J",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mheight*0.02,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.05),
                child: Row(
                  children: [
                    Text("Mobile",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mwidth*0.05),
                      child: Text("+91 8606648604",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mheight*0.02,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.05),
                child: Row(
                  children: [
                    Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mwidth*0.05),
                      child: Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mheight*0.02,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.05),
                child: Row(
                  children: [
                    Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mwidth*0.05),
                      child: Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
                    )
                  ],
                ),
              ),
               ]
                  )
            )
                    )
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
