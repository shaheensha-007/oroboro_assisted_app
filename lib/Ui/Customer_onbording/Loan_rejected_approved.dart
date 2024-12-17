import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';

import 'Customer_onbording_mobile.dart';

class Loan_rejected_approved extends StatefulWidget {
  const Loan_rejected_approved({super.key});

  @override
  State<Loan_rejected_approved> createState() => _Loan_rejected_approvedState();
}

class _Loan_rejected_approvedState extends State<Loan_rejected_approved> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                   height: 150.rh(context),
                  ),
                   Image(image: AssetImage("assets/Not approved case.png"),
                     height: 200.rh(context),
                   ),
                  SizedBox(
                    height: 50.rh(context),
                  ),
                  Text("Loan Eligibility Not Approved ", style: TextStyle(fontSize: 28.rf(context),fontFamily: "boldtext"),),
                  SizedBox(
                    height: 50.rh(context),
                  ),
                  Container(
                      height: 50.rh(context),
                      width: 300.rw(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Color(0xd3ff0500),spreadRadius: 1),
                        ],
                        color: const Color(0xFFFCDD2)
                    ),
                    child: const Center(
                      child: Text("You  Loan  enquiry  has been Rejected ",
                        textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(
                            0xd3ffffff)),),
                    ),
                  ),
                  SizedBox(
                    height: 50.rh(context),
                  ),
                  Center(
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        backgroundColor: const Color(0xff41A545)
                    ),onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Customer_onbording_mobile()), (route) => false);
                    }, child: Text("Go to Sign In",style: TextStyle(fontSize: 20.rf(context),color: Colors.white,fontFamily: "boldtext"),)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
