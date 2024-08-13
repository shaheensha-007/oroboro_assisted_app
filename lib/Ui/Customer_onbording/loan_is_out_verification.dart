import 'package:flutter/material.dart';

import '../LOAN/Loan_detalis/loan_detalis.dart';

class Loan_is_verification extends StatefulWidget {
  const Loan_is_verification({super.key});

  @override
  State<Loan_is_verification> createState() => _Loan_is_verificationState();
}

class _Loan_is_verificationState extends State<Loan_is_verification> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: mheight*0.15,
                ),
                const Image(image: AssetImage("assets/success.png")),
                SizedBox(
                  height: mheight*0.05,
                ),
                const Text("Loan is out for Verification ", style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
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
                    child: Text("Loan details Successfully Updated. Amount will Disbursed afther Verification",
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
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Loan_detalis()), (route) => false);
                  }, child:const Text("Go to Loan  Detalis",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
