import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/product_value.dart';

class Loan_eligibility_Approved extends StatefulWidget {
  const Loan_eligibility_Approved({super.key});

  @override
  State<Loan_eligibility_Approved> createState() => _Loan_eligibility_ApprovedState();
}

class _Loan_eligibility_ApprovedState extends State<Loan_eligibility_Approved> {
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
                const Text("Loan Eligibility Approved ", style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
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
                    child: Text("You  Loan  enquiry  has been  approved  please  Continue",
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
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Product_value()), (route) => false);
                  }, child:const Text("Go to Sign In",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
