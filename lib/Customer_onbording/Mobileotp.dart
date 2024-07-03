import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Customer_onbording/pan_verification.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Mobileotp extends StatefulWidget {
  const Mobileotp({super.key});

  @override
  State<Mobileotp> createState() => _MobileotpState();
}
TextEditingController onbordingotp=TextEditingController();
class _MobileotpState extends State<Mobileotp> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          Padding(
            padding:EdgeInsets.only(left: mwidth*0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                height: mheight*0.2,
              ),
                Text("Mobile Verification",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                SizedBox(
                  height: mheight*0.01,
                ),
                Text(" Verify your mobile\n number",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                SizedBox(
                  height: mheight*0.1,
                ),
                SizedBox(
                  width: mwidth*0.7,
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth*0.05),
                    child: PinCodeTextField(
                      controller:onbordingotp,
                      pinTheme: PinTheme(shape: PinCodeFieldShape.underline,inactiveColor: Color(0xffC9D2EA),fieldWidth: mwidth*0.15,borderRadius: BorderRadius.circular(5)),
                      appContext: context,onSubmitted: (value){
                    },onCompleted: (vale){
                       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Panverfication()), (route) => false);
                    },
                      length: 4,
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.2),
                  child: Column(
                    children: [
                      Text("Didn’t you  receive any code?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                      TextButton(onPressed: (){}, child: Text("Resend New Code",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFF7C00)),))
                    ],
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
