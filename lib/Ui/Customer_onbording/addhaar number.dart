import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/pan_verification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/AadhaarSendotp_bloc/aadhaarsendotp_bloc.dart';
import '../../modeles/customeronboradingModel/AadhaarsendOtpModel/AadhaarsendotpModel.dart';
import '../apparbar/myappbar.dart';
import 'aadhaar_otp.dart';

class Aadhaarnumber extends StatefulWidget {
  const Aadhaarnumber({super.key});

  @override
  State<Aadhaarnumber> createState() => _AadhaarnumberState();
}
late AadhaarsendotpModel sendotpaadhaar;
String? requestid;
TextEditingController aadhaarnumber=TextEditingController();

class _AadhaarnumberState extends State<Aadhaarnumber> {
  final GlobalKey<FormState> Aadhaarnumberkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:const EdgeInsets.all(5.0),
                  child: IconButton(onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Panverfication()), (route) => false);
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
              child: Form(
                key:Aadhaarnumberkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mheight*0.2,
                    ),
                    const Text("Aadhaar Verification ",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  SizedBox(
                  height: mheight*0.03,
                ),
                const Text(" Enter customer aadhaar number .We’ll send \nyou a verification code for UIDAI verification \nprocess.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
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
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter  Aadhhaar number';
                        }
                       // if(!RegExp(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$').hasMatch(value)){
                       //   return 'Please enter a valid  Aadhaar number';
                       // }
                      },
                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                      controller: aadhaarnumber,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(15)
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Aadhaar",
                        hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                      ),
                      onChanged: (text){

                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.04,
                ),
                //
                //  Center(child: TextButton(
                //     onPressed: () {
                //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Aadhaarupload()), (route) => false);
                //     },
                //     child: Text("Aadhaar  not linked with Mobile number ?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFC9738)))),
                // ),
                SizedBox(
                  width: mwidth*0.8,
                  child:
                  BlocListener<AadhaarsendotpBloc, AadhaarsendotpState>(
                    listener: (context, state) {
                      if(state is AadhaarSendotpblocLoading){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      }else{
                        Navigator.of(context).pop();
                      }
                      if(state is AadhaarSendOtpblocLoaded) {
                        sendotpaadhaar = BlocProvider
                            .of<AadhaarsendotpBloc>(context)
                            .isaadhaarsendotp;
                        requestid=sendotpaadhaar.result?.requestId.toString();
                        if (sendotpaadhaar.status.toString() == "Success") {
                          print(requestid);
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                              builder: (context) => AaadharOtp(Requestid: requestid.toString(),)), (route) => false);
                        } else {
                          _showErrorSnackBar(sendotpaadhaar.errorMessage.toString());
                        }
                      }
                    },
                    // TODO: implement listener
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389)
                  ),onPressed: ()async{
                    if(Aadhaarnumberkey.currentState!.validate()){
                      final preferences = await SharedPreferences.getInstance();
                     BlocProvider.of<AadhaarsendotpBloc>(context).add(FetchAadhaarsendotp(userId: preferences.getString("Userid").toString(), Customercode: preferences
                         .getString("CustomerCode")
                         .toString(), Aadhaar: aadhaarnumber.text, ctx: context)
                     );
                    }
                  }, child:const Text("Send OTP",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                )
                )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
void _showErrorSnackBar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(fontSize: 12, fontFamily: "font2"),
    ),
  ));
}
@override
  void dispose() {
  aadhaarnumber.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
