import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Ui/LOAN/View%20loan/personal_Detalis.dart';

import 'View loan_collateraldetails.dart';
import 'Viewloan_Activities and Comments.dart';
import 'Viewloan_bankdetalis.dart';
import 'Viewloan_loan detalis.dart';
import 'Viewloan_perviousloandetalis.dart';
import 'Viewloan_supporting documents.dart';
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
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title:const Loan_appbar(),
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
                  child: const Text("View loan",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                ),
                SizedBox(
                  height: mheight*0.03,
                ),
                 Padding(
                   padding: EdgeInsets.only(left: mwidth*0.05),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      const Text("Loan Number",style: TextStyle(fontSize:12,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                       SizedBox(
                         width: mwidth*0.02,
                       ),
                       const Text("ORO003A11-9009",style: TextStyle(fontSize:12,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Color(0xff6F788E),)),
                        SizedBox(
                          width: mwidth*0.1,
                        ),
                       const Text("Loan Amount",style: TextStyle(fontSize:12,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                       SizedBox(
                         width: mwidth*0.02,
                       ),
                       const Text("7639",style: TextStyle(fontSize:12,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Color(0xff6F788E),))
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
                      const Text("RequestDate",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200),),
                      SizedBox(
                        height: mheight*0.02,
                      ),
                      const Text("23-08-2000",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200,color: Color(0xff6F788E),)),
                      SizedBox(
                        width: mwidth*0.02,
                      ),
                      const Text("Agreement Date",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200),),
                      SizedBox(
                        width: mwidth*0.02,
                      ),
                      const Text("23-09-2004",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200,color: Color(0xff6F788E),)),
                      SizedBox(
                        width: mwidth*0.02,
                      ),
                      const Text("Disbursal Date",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200),),
                      SizedBox(
                        width: mwidth*0.02,
                      ),
                      const Text("23-09-2004",style: TextStyle(fontSize:10,fontFamily: "regulartext",fontWeight: FontWeight.w200,color: Color(0xff6F788E),))
            
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
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: const Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          const Text("Personal Details",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Personal_details()), (route) => false);
                          }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
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
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: const Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          const Text("Bank Details",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Viewloan_bankdetalis()), (route) => false);
                          }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
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
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: const Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          const Text("Loan Details",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Viewloan_loandetalis()), (route) => false);
                          }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
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
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: const Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          const Text("Supporting Documents",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Viewloan_supportingdocument()), (route) => false);
                          }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
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
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: const Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          const Text("Collateral Details",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Viewloan_collateraldetalis()), (route) => false);
                          }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
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
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: const Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          const Text("Activities and Comments",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Viewloan_Activitiesandcomments()), (route) => false);
                          }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
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
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xffC9D2EA), spreadRadius: 1),
                        ],
                        color: const Color(0xff284389)),
                    child: Padding(
                      padding:EdgeInsets.only(left: mwidth*0.1),
                      child: Row(
                        children: [
                          const Text("Previous Loan Details ",style: TextStyle(fontSize:16,fontFamily: "boldtext",fontWeight: FontWeight.w800,color: Colors.white),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Viewloan_previousloandetails()), (route) => false);
                          }, icon: const Icon(Icons.arrow_forward_ios,color: Colors.white,)),
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
