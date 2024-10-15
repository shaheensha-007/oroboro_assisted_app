import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    height: mheight*0.05,
                  ),
                  const Image(image: AssetImage("assets/Not approved case.png")),
                  SizedBox(
                    height: mheight*0.05,
                  ),
                  const Text("Loan Eligibility Not Approved ", style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: mheight*0.05,
                  ),
                  Container(
                    height: mheight*0.15,
                    width: mwidth*0.8,
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
                    height: mheight*0.1,
                  ),
                  Center(
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        backgroundColor: const Color(0xff41A545)
                    ),onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Customer_onbording_mobile()), (route) => false);
                    }, child:const Text("Go to Sign In",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
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
