import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../homepage/Mainhome_page.dart';

class Already_mpin extends StatefulWidget {
  const Already_mpin({super.key});

  @override
  State<Already_mpin> createState() => _Already_mpinState();
}
TextEditingController Alreadypincode=TextEditingController();
class _Already_mpinState extends State<Already_mpin> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery
        .of(context)
        .size
        .height;
    var mwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: mheight * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: mwidth * 0.5),
                    child: const Text("Enter your MPIN", style: TextStyle(fontSize: 20,
                        fontFamily: "boldtext",
                        fontWeight: FontWeight.w800),),
                  ),
                  SizedBox(
                    height: mheight*0.2,
                  ),
                  SizedBox(
                    width: mwidth*0.7,
                    child: PinCodeTextField(
                      controller: Alreadypincode,
                      pinTheme: PinTheme(shape: PinCodeFieldShape.box,inactiveColor: const Color(0xffC9D2EA),fieldWidth: mwidth*0.15,borderRadius: BorderRadius.circular(5)),
                      appContext: context,onSubmitted: (value){
                    },onCompleted: (vale){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Mainhome()), (route) => false);
                    },
                      length: 4,
                    ),
                  ),
                  SizedBox(
                    height: mheight*0.1,
                  ),
                  SizedBox(height: mheight*0.1,
                      child: GestureDetector(onTap: (){
                        
                      },
                          child: const Image(image: AssetImage("assets/FINGER.png")))),
                  SizedBox(
                    height: mheight*0.02,
                  ),
                  const Text("Log In  Using  Your Biometric",style: TextStyle(fontSize: 12,fontFamily: "regulartext",fontWeight: FontWeight.w800),),
                  const Text("Credential",style: TextStyle(fontSize: 12,fontFamily: "regulartext",fontWeight: FontWeight.w800),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}