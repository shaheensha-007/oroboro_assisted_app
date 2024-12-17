import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/Customer_onbording_mobile.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/AadhaarSendotp_bloc/aadhaarsendotp_bloc.dart';
import '../../modeles/customeronboradingModel/AadhaarsendOtpModel/AadhaarsendotpModel.dart';
import 'aadhaar_otp.dart';
import 'aadhar upload.dart';

class Aadhaarnumber extends StatefulWidget {
  const Aadhaarnumber({super.key});

  @override
  State<Aadhaarnumber> createState() => _AadhaarnumberState();
}

late AadhaarsendotpModel sendotpaadhaar;
bool Aadhaaruploadpopition=false;
String? requestid;
TextEditingController aadhaarnumber = TextEditingController();
class _AadhaarnumberState extends State<Aadhaarnumber> {
  final GlobalKey<FormState> aadhaarnumberkey = GlobalKey<FormState>();
  @override
  void initState() {
    // BlocProvider.of<MerchartTokenBloc>(context).add(FetchMerchartToken(
    //     userName: "Test", password: tokenpassword, ctx: context));
    aadhaarnumber.text="";
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                  onPressed: () {
                   NavigationService.push(Customer_onbording_mobile());
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ),
          ])),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.rw(context)),
              child: Form(
                key: aadhaarnumberkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120.rh(context),
                    ),
                     Text(
                      "Aadhaar Verification ",
                      style: TextStyle(
                        fontSize: 28.rf(context),
                        fontFamily: "boldtext",),
                    ),
                    SizedBox(
                      height: 30.rh(context),
                    ),
                     Padding(
                       padding:EdgeInsets.only(right: 10.rw(context)),
                       child: Text(
                        " Enter customer aadhaar number. We’ll send you a verification code for UIDAI verification process.",
                        style: TextStyle(
                            fontSize: 20.rf(context),
                            fontFamily: "regulartext"),
                                           ),
                     ),
                    SizedBox(
                      height: 30.rh(context),
                    ),
                    Container(
                      height: 50.rh(context),
                      width: 300.rw(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.rw(context)),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter  Aadhhaar number';
                            }
                            return null;
                            // if(!RegExp(r'^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}$').hasMatch(value)){
                            //   return 'Please enter a valid  Aadhaar number';
                            // }
                          },
                          style:  TextStyle(
                              fontSize: 14.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: aadhaarnumber,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(15)
                          ],
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Aadhaar",
                            hintStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                          onChanged: (text) {},
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.rh(context),
                    ),
                    Aadhaaruploadpopition
                   ?  Center(child: TextButton(
                        onPressed: () {
                          NavigationService.pushAndRemoveUntil(Aadhaarupload(), (p0) => false);
                        },
                        child: Text("Aadhaar  not linked with Mobile number ?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFC9738)))),
                    ):SizedBox(),

                    SizedBox(
                        width: 300.rw(context),
                        child: BlocListener<AadhaarsendotpBloc,
                            AadhaarsendotpState>(
                          listener: (context, state)async {
                            if (state is AadhaarSendotpblocLoading) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            } else {
                              Navigator.of(context).pop();
                            }
                            if (state is AadhaarSendOtpblocLoaded) {
                              final preferences = await SharedPreferences.getInstance();
                              sendotpaadhaar =state.aadhaarsendotpModel;
                              requestid =
                                  sendotpaadhaar.result?.requestId.toString();
                              preferences.setString("Requestid", requestid.toString());
                              print(preferences);
                              if (sendotpaadhaar.status.toString() ==
                                  "Success") {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => AaadharOtp()),
                                    (route) => false);
                              }
                            }
                            if(state is AadhaarSendOtpblocError){
                              _showErrorSnackBar(state.Errormessage);
                              setState(() {
                                Aadhaaruploadpopition=true;
                              });
                            }
                          },
                          // TODO: implement listener
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  backgroundColor: const Color(0xff284389)),
                              onPressed: () async {
                                if (aadhaarnumberkey.currentState!.validate()) {
                                  final preferences =
                                      await SharedPreferences.getInstance();
                                  BlocProvider.of<AadhaarsendotpBloc>(context)
                                      .add(FetchAadhaarsendotp(
                                    userId: preferences
                                        .getString("Userid")
                                        .toString(),
                                    Customercode: preferences
                                        .getString("CustomerCode")
                                        .toString(),
                                    Aadhaar: aadhaarnumber.text,
                                    applicationId: preferences
                                        .getString("applicationid")
                                        .toString(),
                                    ctx: context,
                                  ));
                                }
                              },
                              child:  Text(
                                "Send OTP",
                                style: TextStyle(
                                    fontSize: 20.rf(context),
                                    color: Colors.white,
                                    fontFamily: "boldtext"),
                              )),
                        ))
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
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set the background color
          contentPadding: EdgeInsets.zero, // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Customize corner radius
          ),
          content: Container(
            constraints: BoxConstraints(
              maxWidth: 300, // Set the maximum width
              minHeight: 150, // Set the minimum height
            ),
            padding: const EdgeInsets.all(16), // Padding for content
            color: Colors.blueGrey[50], // Set the container's background color
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "font2",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff284389),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext",
                        color: Colors.white,
                      ),
                    ), // Button text
                  ),
                ), // Add spacing between text and button
              ],
            ),
          ),
        );
      },
    );
  }
}
