import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../apparbar/myappbar.dart';
import 'Mobileotp.dart';

class Customer_onbording_mobile extends StatefulWidget {
  const Customer_onbording_mobile({super.key});

  @override
  State<Customer_onbording_mobile> createState() => _Customer_onbording_mobileState();
}
TextEditingController onbordingmobile=TextEditingController();
class _Customer_onbording_mobileState extends State<Customer_onbording_mobile> {
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(color: Colors.black, fontSize: 12.0);
    TextStyle linkStyle = const TextStyle(color: Color(0xffFF7C00));
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
     backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const MyAppbar(),
      ),
      body: Stack(
        children: [
          Padding(
            padding:EdgeInsets.only(left: mwidth*0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mheight*0.2,
                ),
                const Text("Loan  Onboarding ",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                SizedBox(
                  height: mheight*0.03,
                ),
                const Text(" Enter Customer mobile number. We’ll send you\n a verification for validate mobile number",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                SizedBox(
                  height: mheight*0.05,
                ),
                Container(
                  height: mheight*0.06,
                  width: mwidth*0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey,spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding:EdgeInsets.only(left: mwidth*0.03),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                      controller: onbordingmobile,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10)
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Mobile",
                        hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
                SizedBox(
                  width: mwidth*0.8,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389)
                  ),onPressed: (){
                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Mobileotp()), (route) => false);
                  }, child:const Text("Send OTP",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ),
         SizedBox(
           height: mheight*0.05,
         ),
                Padding(
                  padding:EdgeInsets.only(right: mwidth*0.05),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: defaultStyle,
                      children: <TextSpan>[
                        const TextSpan(text: 'By providing my mobile number , i hereby agree and accept the '),
                        TextSpan(
                            text: 'Terms of Service',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Terms of Service"');
                              }),
                        const TextSpan(text: ' and'),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Privacy Policy"');
                              }),
                        const TextSpan(text: 'in use of the Oroboro Assisted  app.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
