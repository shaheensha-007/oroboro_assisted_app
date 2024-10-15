import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/notification.dart';

import '../Customer_onbording/Customer_onbording_mobile.dart';
import '../Emi_ calculater/Emi_calculator.dart';
import '../LOAN/Loan_detalis/loan_detalis.dart';
import '../LOAN/Loan_disbursal/Loandisbursal.dart';
import '../LOAN/Upload_documents/upload_documents.dart';
import '../Ledger/ledger.dart';
import '../Search_customer/Search_Customer.dart';
import '../cash_flow/cash_flow.dart';
import '../lastestcomments/lastestcoments.dart';
import '../mandate status/mandate stauts.dart';
import '../payments/payments.dart';
import '../schedules/schedule.dart';


class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();                       ///expansion add this page
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Drawer(
     child: Container(
      height: mheight,
       width: mwidth,
       color: Colors.white,
       child: SingleChildScrollView(
        child: Column(
            children: [
              SizedBox(
                height: mheight*0.1,
              ),
              GestureDetector(
                    onTap: () {
                     Navigator.of(context).pop();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:EdgeInsets.only(left: mwidth*0.1),
                          child: const Image(image: AssetImage("assets/home icon.png"),color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: mheight * 0.01 ,left: mwidth*0.02),
                          child: const Text(
                            "Home",
                           style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.1),
                child: ExpansionTile(
                  shape: const RoundedRectangleBorder(),
                  title: const Text("Onboarding",
                  style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                ),
                  children: [
                    ListTile(
                      title: const Text("Customer Onboarding",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Customer_onbording_mobile()), (route) => false);
                      },
                    )
                  ],
                              ),
              ),
              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
            Padding(
             padding: EdgeInsets.only(left: mwidth * 0.1),
             child: ExpansionTile(
               shape: const RoundedRectangleBorder(),
               title: const Text(
                 "Loan",
                 style: TextStyle(
                   fontSize: 15,
                   fontFamily: "headers",
                   fontWeight: FontWeight.w800,
                 ),
               ),
               children: <Widget>[
                 // Add your expanded content here
                 ListTile(
                   title: const Text("Loan Detalis",  style: TextStyle(
                     fontSize: 15,
                     fontFamily: "headers",
                     fontWeight: FontWeight.w800,
                   ),),
                   onTap: (){
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Loan_detalis()), (route) => false);
                   },
                 ),
                 ListTile(
                   title: const Text("Upload Documents",  style: TextStyle(
                     fontSize: 15,
                     fontFamily: "headers",
                     fontWeight: FontWeight.w800,
                   ),),
                   onTap: (){
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Upload_document_loan()), (route) => false);
                   },
                 ),
                 ListTile(
                   title: const Text("Loan Disbursal",  style: TextStyle(
                     fontSize: 15,
                     fontFamily: "headers",
                     fontWeight: FontWeight.w800,
                   ),),
                   onTap: (){
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Loan_disbursal()), (route) => false);
                   },
                 ),
               ],
             ),
           ),
         SizedBox(
           height: mheight*0.02,
         ),
         Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.1),
                child: ExpansionTile(
                  shape: const RoundedRectangleBorder(),
                  title:  const Text(
                    "EMI Calculator",
                    style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                  ),
                  children: [
                    ListTile(
                      title: const Text("EMI Calculator",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Emi_calculator()), (route) => false);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
              Padding(
                padding:EdgeInsets.only(left: mwidth*0.1),
                child: ExpansionTile(
                  shape: const RoundedRectangleBorder(),
                  title: const Text(
                    "Ledger",
                    style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                  ),
                  children: [
                    ListTile(
                      title: const Text("Ledger",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Ledger()), (route) => false);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
                 Padding(
                   padding:EdgeInsets.only(left: mwidth*0.1),
                   child: ExpansionTile(
                     shape: const RoundedRectangleBorder(),
                     title: const Text(
                       "Cash Flow",
                       style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                     ),
                     children: [
                       ListTile(
                         title: const Text("Cash Flow",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                         onTap: (){
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Cash_flow()), (route) => false);
                         },
                       ),
                     ],
                   ),
                 ),
              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
                 Padding(
                   padding:EdgeInsets.only(left: mwidth*0.1),
                   child: ExpansionTile(
                     shape: const RoundedRectangleBorder(),
                     title: const Text(
                       "Payment",
                       style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                     ),
                     children: [
                       ListTile(
                         title: const Text("Payment",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                         onTap: (){
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Payments()), (route) => false);
                         },
                       ),
                     ],
                   ),
                 ),
              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
                 Padding(
                   padding:EdgeInsets.only(left: mwidth*0.1),
                   child: ExpansionTile(
                     shape: const RoundedRectangleBorder(),
                     title: const Text(
                       "Schedules",
                       style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                     ),
                     children: [
                       ListTile(
                         title: const Text("Schedules",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                         onTap: (){
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Schedule()), (route) => false);
                         },
                       ),
                     ],
                   ),
                 ),
              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
                 Padding(
                   padding:EdgeInsets.only(left: mwidth*0.1),
                   child: ExpansionTile(
                     shape: const RoundedRectangleBorder(),
                     title: const Text(
                       "Mandate Status",
                       style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                     ),
                     children: [
                       ListTile(
                         title: const Text("Mandate Status",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                         onTap: (){
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Mandate_Status()), (route) => false);
                         },
                       ),
                     ],
                   ),
                 ),
              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.1),
                  child: ExpansionTile(
                    shape: const RoundedRectangleBorder(),
                    title: const Text(
                      "Comments",
                      style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                    ),
                    children: [
                      ListTile(
                        title: const Text("Comments",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                          onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Lastest_comments()), (route) => false);
                          },
                      ),
                    ],
                  ),
                ),
              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
                 Padding(
                   padding:EdgeInsets.only(left: mwidth*0.1),
                   child: ExpansionTile(
                     shape: const RoundedRectangleBorder(),
                     title: const Text(
                       "Notification",
                       style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                     ),
                     children: [
                       ListTile(
                         title: const Text("Notification",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                    onTap: (){
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Notification1()), (route) => false);
                    },
                       ),
                     ],
                   ),
                 ),

              Divider(
                indent: mwidth*0.1,
                endIndent: mwidth*0.15,
              ),
              SizedBox(
                height: mheight*0.02,
              ),
                 Padding(
                   padding:EdgeInsets.only(left: mwidth*0.1),
                   child: ExpansionTile(
                     shape: const RoundedRectangleBorder(),
                     title: const Text(
                       "Search Customer",
                       style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),
                     ),
                     children: [
                       ListTile(
                         title: const Text("Search Customer",style: TextStyle(fontSize: 15,fontFamily:"headers",fontWeight: FontWeight.w800),),
                         onTap: (){
                           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Search_Customers()), (route) => false);
                         },
                       ),
                     ],
                   ),
                 ),
              SizedBox(
                height: mheight*0.02,
              ),
            ],
        ),
       ),
       ),
     );
  }
}
