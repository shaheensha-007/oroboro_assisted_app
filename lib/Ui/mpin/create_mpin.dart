import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Ui/mpin/set%20biometrix.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Create_mpin extends StatefulWidget {
  const Create_mpin({super.key});

  @override
  State<Create_mpin> createState() => _Create_mpinState();
}
TextEditingController newpincode = TextEditingController();
TextEditingController confirmpincode=TextEditingController();
class _Create_mpinState extends State<Create_mpin> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child:Column(
              children: [
                SizedBox(
                  height: mheight*0.1,
                ),
                Padding(
                  padding:EdgeInsets.only(right: mwidth*0.5),
                  child: const Text("Create mpin",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800 ),),
                ),
                SizedBox(
                  height: mheight*0.1,
                ),
                Padding(
                  padding:EdgeInsets.only(right: mwidth*0.6),
                  child: const Text("New MPIN",style: TextStyle(fontSize: 12,fontFamily: "boldtext",fontWeight: FontWeight.w800 ),),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
                SizedBox(
                  width: mwidth*0.7,
                  child: PinCodeTextField(
                    controller:newpincode ,
                    pinTheme: PinTheme(shape: PinCodeFieldShape.box,inactiveColor: const Color(0xffC9D2EA),fieldWidth: mwidth*0.15,borderRadius: BorderRadius.circular(5)),
                  appContext: context,onSubmitted: (value){

                  }, length: 4,
                  ),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
                Padding(
                  padding:EdgeInsets.only(right: mwidth*0.6),
                  child: const Text("confirm MPIN",style: TextStyle(fontSize: 12,fontFamily: "boldtext",fontWeight: FontWeight.w800 ),),
                ),
                SizedBox(
                  height: mheight*0.05,
                ),
                SizedBox(
                  width: mwidth*0.7,
                  child: PinCodeTextField(
                    controller: confirmpincode,
                    pinTheme: PinTheme(shape: PinCodeFieldShape.box,inactiveColor: const Color(0xffC9D2EA),fieldWidth: mwidth*0.15,borderRadius: BorderRadius.circular(5)),
                    appContext: context,onSubmitted: (value){

                  }, length: 4,
                  ),
                ),
                SizedBox(
                  height: mheight*0.1,
                ),
                Center(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389)
                  ),onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Set_biometric()), (route) => false);
                  }, child:const Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
