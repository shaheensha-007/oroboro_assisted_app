import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'aadhaar_otp.dart';

class Aadhaarnumber extends StatefulWidget {
  const Aadhaarnumber({super.key});

  @override
  State<Aadhaarnumber> createState() => _AadhaarnumberState();
}
TextEditingController aadhaarnumber=TextEditingController();
class _AadhaarnumberState extends State<Aadhaarnumber> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding:EdgeInsets.only(left:mwidth*0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mheight*0.2,
                ),
                Text("Aadhaar Verification ",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
              SizedBox(
              height: mheight*0.03,
            ),
            Text(" Enter customer aadhaar number .We’ll send \nyou a verification code for UIDAI verification \nprocess.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
            SizedBox(
              height: mheight*0.05,
            ),
            Container(
              height: mheight*0.06,
              width: mwidth*0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey,spreadRadius: 1),
                  ],
                  color: Colors.white
              ),
              child: Padding(
                padding:EdgeInsets.only(left: mwidth*0.03),
                child: TextFormField(
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                  controller: aadhaarnumber,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15)
                  ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    hintText: "Aadhaar",
                    hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                    errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mheight*0.02,
            ),

            Center(child: Text("Aadhaar  not linked with Mobile number ?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFC9738)))),
            SizedBox(
              height: mheight*0.05,
            ),
            SizedBox(
              width: mwidth*0.8,
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  backgroundColor: Color(0xff284389)
              ),onPressed: (){
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>AaadharOtp()), (route) => false);
              }, child:Text("Send OTP",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
            )
              ],
            ),
          )
        ],
      ),
    );
  }
}
