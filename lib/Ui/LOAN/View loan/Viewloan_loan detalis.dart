import 'package:flutter/material.dart';

import 'loan_appbar.dart';

class Viewloan_loandetalis extends StatefulWidget {
  const Viewloan_loandetalis({super.key});

  @override
  State<Viewloan_loandetalis> createState() => _Viewloan_loandetalisState();
}

class _Viewloan_loandetalisState extends State<Viewloan_loandetalis> {
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
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Loan_appbar(),
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
                  child: const Text("Loan Details", style: TextStyle(
                      fontSize: 18, fontFamily: "boldtext", fontWeight: FontWeight.w800),),
                ),
                SizedBox(
                  height: mheight*0.1,
                ),
                  Padding(
                    padding:EdgeInsets.only(left: mwidth*0.05),
                    child: Container(
            height: mheight*0.8,
            width: mwidth * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff2B45A3).withOpacity(0.5),
                  spreadRadius: -4,
                  blurRadius: 11,
                  offset: const Offset(
                      0, 6), // changes position of shadow
                ),
              ],
            ),
            child:  Padding(
              padding:EdgeInsets.only(top: mheight*0.03),
              child: Column(
                  children: [
              Padding(
              padding:EdgeInsets.only(left: mwidth*0.05),
              child: Row(
                children: [
                  const Text("Name",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: mwidth*0.05),
                    child: const Text("MOHAMMED SHAHEEN PK",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                    const Text("PAN",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mwidth*0.05),
                      child: const Text("HSHPP1158J",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                    const Text("Mobile",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mwidth*0.05),
                      child: const Text("+91 8606648604",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                    const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: mwidth*0.05),
                      child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                          const Text("Aadhaar",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                          const Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: mwidth*0.05),
                            child: const Text("250000567893",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mheight*0.02,
                    ),

              ]
              ),
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
