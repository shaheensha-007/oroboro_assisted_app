import 'package:flutter/material.dart';

import 'loan_appbar.dart';

class Personal_details extends StatefulWidget {
  const Personal_details({super.key});

  @override
  State<Personal_details> createState() => _Personal_detailsState();
}

class _Personal_detailsState extends State<Personal_details> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
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
                  child: const Text("Personal Details",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                ),
                SizedBox(
                  height: mheight*0.03,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.05),
                  child: Container(
                    height: mheight*0.85 ,
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
                    child: Padding(
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
                                const Text("Name(Aadhaar)",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: mwidth*0.05),
                                  child: const Text("MOHAMMED SHAHEEN pervankuzhil",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                        const Text("Date of Birth",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: mwidth*0.05),
                          child: const Text("30-09-2000",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                        const Text("Gender",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: mwidth*0.05),
                          child: const Text("Male",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                        const Text("Perment Address",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: mwidth*0.05),
                          child: const Text("pervankuzhil (H)",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                        const Text("Email Address",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: mwidth*0.05),
                          child: const Text("shaheenshaheenpk@2900.com",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                        const Text("Employee Stauts",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: mwidth*0.05),
                          child: const Text("flutter developer",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                        const Text("Income",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: mwidth*0.05),
                          child: const Text("Existing EMI IN(rs)",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                        const Text("Residence Type",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: mwidth*0.05),
                          child: const Text("dfsdfdfdfffd",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                        const Text("Oroboro Score",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: mwidth*0.05),
                          child: const Text("345",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                                const Text("CIBIL Score",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: mwidth*0.05),
                                  child: const Text("752",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
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
                                const Text("Reference 1",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: mwidth*0.05),
                                  child: const Text(" xgxhsbsbgsnz",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
                                ),
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
                                const Text("Reference 2",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ,),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: mwidth*0.05),
                                  child: const Text("uppchi",style: TextStyle(fontSize:14,fontFamily: "boldtext",fontWeight: FontWeight.w800) ),
                                )
                              ],
                            ),
                          ),
            
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
