import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Customer_onbording/bank_detalis.dart';
import 'package:oroboro_assisted_app/LOAN/View%20loan/View%20loan_collateraldetails.dart';
import 'package:oroboro_assisted_app/LOAN/View%20loan/Viewloan_Activities%20and%20Comments.dart';
import 'package:oroboro_assisted_app/LOAN/View%20loan/Viewloan_loan%20detalis.dart';
import 'package:oroboro_assisted_app/LOAN/View%20loan/Viewloan_perviousloandetalis.dart';
import 'package:oroboro_assisted_app/LOAN/View%20loan/Viewloan_supporting%20documents.dart';
import 'package:oroboro_assisted_app/LOAN/View%20loan/personal_Detalis.dart';

import 'Viewloan_bankdetalis.dart';
import 'loan_appbar.dart';

class View_loan extends StatefulWidget {
  const View_loan({super.key});

  @override
  State<View_loan> createState() => _View_loanState();
}

class _View_loanState extends State<View_loan> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        title:Loan_appbar(),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mheight*0.1,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.1),
                  child: Text("View loan",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                ),
                SizedBox(
                  height: mheight*0.03,
                ),
                 Padding(
                   padding: EdgeInsets.only(left: mwidth*0.05),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      Text("Loan Number",style: TextStyle(fontSize:12,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                       SizedBox(
                         width: mwidth*0.02,
                       ),
                       Text("ORO003A11-9009",style: TextStyle(fontSize:12,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Color(0xff6F788E),)),
                        SizedBox(
                          width: mwidth*0.1,
                        ),
                       Text("Loan Amount",style: TextStyle(fontSize:12,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                       SizedBox(
                         width: mwidth*0.02,
                       ),
                       Text("7639",style: TextStyle(fontSize:12,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Color(0xff6F788E),))
                     ],
                   ),
                 ),
                SizedBox(
                  height: mheight*0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(left: mwidth*0.03),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("RequestDate",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200),),
                      SizedBox(
                        height: mheight*0.02,
                      ),
                      Text("23-08-2000",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200,color: Color(0xff6F788E),)),
                      SizedBox(
                        width: mwidth*0.02,
                      ),
                      Text("Agreement Date",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200),),
                      SizedBox(
                        width: mwidth*0.02,
                      ),
                      Text("23-09-2004",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200,color: Color(0xff6F788E),)),
                      SizedBox(
                        width: mwidth*0.02,
                      ),
                      Text("Disbursal Date",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200),),
                      SizedBox(
                        width: mwidth*0.02,
                      ),
                      Text("23-09-2004",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200,color: Color(0xff6F788E),))
            
                    ],
                  ),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
            
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.05),
                  child: Container(
                    height: mheight*0.06,
                    width: mwidth*0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          Text("Personal Details",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Personal_details()), (route) => false);
                          }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.05),
                  child: Container(
                    height: mheight*0.06,
                    width: mwidth*0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          Text("Bank Details",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Viewloan_bankdetalis()), (route) => false);
                          }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
            
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.05),
                  child: Container(
                    height: mheight*0.06,
                    width: mwidth*0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          Text("Loan Details",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Viewloan_loandetalis()), (route) => false);
                          }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
            
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.05),
                  child: Container(
                    height: mheight*0.06,
                    width: mwidth*0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          Text("Supporting Documents",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Viewloan_supportingdocument()), (route) => false);
                          }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
            
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.05),
                  child: Container(
                    height: mheight*0.06,
                    width: mwidth*0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          Text("Collateral Details",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Viewloan_collateraldetalis()), (route) => false);
                          }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
            
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.05),
                  child: Container(
                    height: mheight*0.06,
                    width: mwidth*0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          Text("Activities and Comments",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Viewloan_Activitiesandcomments()), (route) => false);
                          }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
            
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.05),
                  child: Container(
                    height: mheight*0.06,
                    width: mwidth*0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          Text("Previous Loan Details ",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Viewloan_previousloandetails()), (route) => false);
                          }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
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
