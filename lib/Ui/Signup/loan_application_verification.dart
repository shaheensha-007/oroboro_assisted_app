import 'package:flutter/material.dart';

import '../Signin/signin_page.dart';


class Loan_application_verification extends StatefulWidget {
  const Loan_application_verification({super.key});

  @override
  State<Loan_application_verification> createState() => _Loan_application_verificationState();
}

class _Loan_application_verificationState extends State<Loan_application_verification> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: mheight*0.15,
                  ),
                  const Image(image: AssetImage("assets/success.png")),
                  SizedBox(
                   height: mheight*0.05,
                  ),
                  const Text("Loan Application is out for", style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  const Text("Verification",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: mheight*0.05,
                  ),
                  Container(
                    height: mheight*0.15,
                    width: mwidth*0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Color(0xff41A545),spreadRadius: 1),
                        ],
                        color: const Color(0xffF1FEF1)
                    ),
                    child: const Center(
                      child: Text("Your onboarding journey has been successfully\n completed and under verification stage. Our\n onboarding team will be share your login\n credentials once verification process completed.",
                        textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xff41A545)),),
                    ),
                  ),
                  SizedBox(
                    height: mheight*0.2,
                  ),
                  Center(
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        backgroundColor: const Color(0xff41A545)
                    ),onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Signin_page()), (route) => false);
                    }, child:const Text("Go to Sign In",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
