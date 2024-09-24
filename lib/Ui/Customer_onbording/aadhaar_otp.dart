import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/personal%20information.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'aadhar upload.dart';
import 'addhaar number.dart';

class AaadharOtp extends StatefulWidget {
  const AaadharOtp({super.key, required this.Requestid});
final String Requestid;
  @override
  State<AaadharOtp> createState() => _AaadharOtpState();
}
TextEditingController aadhaarOtp=TextEditingController();
bool Aadhaarshow=false;
class _AaadharOtpState extends State<AaadharOtp> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
            title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:const EdgeInsets.all(5.0),
                    child: IconButton(onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Aadhaarnumber()), (route) => false);
                    }, icon:const Icon(Icons.arrow_back_ios_new)),
                  ),
                ]
            )
        ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding:EdgeInsets.only(left:mwidth*0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mheight*0.2,
                  ),
                  const Text("Aadhaar Verification ",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: mheight*0.01,
                  ),
                  Padding(
                    padding:EdgeInsets.only(right: mwidth*0.1),
                    child: const Text("Verify your Aadhaar number",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                  ),
                  SizedBox(
                    height: mheight*0.05,
                  ),
                  SizedBox(
                    width: mwidth*0.7,
                    child: Padding(
                      padding: EdgeInsets.only(left: mwidth*0.05),
                      child: PinCodeTextField(
                        controller: aadhaarOtp,
                        pinTheme: PinTheme(shape: PinCodeFieldShape.underline,inactiveColor: const Color(0xffC9D2EA),fieldWidth: mwidth*0.15,borderRadius: BorderRadius.circular(5)),
                        appContext: context,onSubmitted: (value){
                      },onCompleted: (vale){
                          setState(() {
                              Aadhaarshow = true;
                             // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Personal_information()), (route) => false);
                          });

                      },
                        length: 4,
                      ),
                    ),
                  ),
                 SizedBox(
                   height: mheight*0.03,
                 ),
                  Padding(
                    padding: EdgeInsets.only(right: mwidth*0.05),
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Didn’t you  receive any code?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                        TextButton(onPressed: (){

                        }, child: const Text("Resend New Code",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFF7C00)),)),
                      SizedBox(
                        height: mheight*0.01,
                      ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          axisAlignment: 1.0,
                          child: child,
                        );
                      },
                      child:Aadhaarshow?
                      Center(child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Aadhaarupload()), (route) => false);
                          },
                          child: Text("Aadhaar  not linked with Mobile number ?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFC9738)))),
                      ):SizedBox(),
                    ),
                                    ],
                                  ),
                  )
          ],
        ),
            )
            ]
        ),
      )
    );
  }
}
