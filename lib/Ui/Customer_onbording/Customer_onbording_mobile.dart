import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/CustomerSendotp_bloc/customersendotp_bloc.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../main.dart';
import '../../modeles/customeronboradingModel/CustomercodeModel/CustomercodeModel.dart';
import '../../modeles/customeronboradingModel/CustomersendotpModel/CustomersendotpModel.dart';
import '../../modeles/customeronboradingModel/customer_regsitrationModel/Customer_regsitrationModel.dart';
import '../apparbar/myappbar.dart';
import 'Mobileotp.dart';

class Customer_onbording_mobile extends StatefulWidget {
  const Customer_onbording_mobile({super.key});

  @override
  State<Customer_onbording_mobile> createState() =>
      _Customer_onbording_mobileState();
}

late CustomercodecreateModel iscustomercreate;
late CustomerRegsitrationModel isCustomerregistration;
late CustomersendotpModel isCustomersendotp;
TextEditingController onbordingmobile = TextEditingController();

class _Customer_onbording_mobileState extends State<Customer_onbording_mobile> {
  @override
  void initState() {
      BlocProvider.of<MerchartTokenBloc>(context)
          .add(FetchMerchartToken(userName: "Test", password: tokenpassword,ctx: context));
      print("ummchi and uppechi");
      if(mounted) {
        onbordingmobile.text = "";
        super.initState();
      }
  }
  final GlobalKey<FormState> Mobileverificationkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        const TextStyle(color: Colors.black, fontSize: 12.0);
    TextStyle linkStyle = const TextStyle(color: Color(0xffFF7C00));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const MyAppbar(),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 33.rw(context)),
              child: Form(
                key: Mobileverificationkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100.rh(context)),
                     Text("Loan Onboarding",
                        style: TextStyle(
                            fontSize: 28.rf(context),
                            fontFamily: "boldtext",
                        )),
                    SizedBox(height: 30.rh(context)),
                    Text(
                        "Enter Customer mobile number. We’ll send you a verification to validate the mobile number",
                        style: TextStyle(
                            fontSize: 19.rf(context),
                            fontFamily: "regulartext")),
                    SizedBox(height: 50.rh(context)),
                    Container(
                      height: 60.rh(context),
                      width: 300.rw(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, spreadRadius: 2),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.rw(context)),
                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "please enter your number";
                            }
                            if (value.length != 10) {
                              return "Mobile number must be 10 digits";
                            }
                            return null;
                          },
                          style:  TextStyle(
                              fontSize: 14.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: onbordingmobile,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Mobile",
                            hintStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(
                                fontSize: 10.rf(context),
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.rf(context)),
                    SizedBox(
                      width:300.rw(context),
                      child:
                          BlocListener<CustomersendotpBloc, CustomersendotpState>(
                        listener: (context, state) async {
                          if (state is CustomersendotpblocLoading) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const Center(child: CircularProgressIndicator());
                              },
                            );
                          }
                          if (state is CustomersendotpblocLoaded) {
                            Navigator.of(context,rootNavigator: true).pop();
                            isCustomersendotp =state.customersendotpModel;
                            if (isCustomersendotp.status.toString() == "Success") {
                              NavigationService.pushAndRemoveUntil(Mobileotp(), (Route<dynamic>route) => false);
                            }
                          }

                          if (state is CustomersendotpblocError) {
                            _showErrorSnackBar(state.Errormessage);
                            }
                        },
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0xff284389),
                          ),
                          onPressed: () async {
                            final preferences = await SharedPreferences
                                .getInstance();
                            if (Mobileverificationkey.currentState!.validate()) {
                              preferences.setString("onbordingmobile", onbordingmobile.text);
                              BlocProvider.of<CustomersendotpBloc>(context).add(
                                FetchCustomersendotp(
                                  userId:
                                  preferences.getString("Userid").toString(),
                                  mobilenumber: onbordingmobile.text,
                                  ctx: context,
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Send OTP",
                            style: TextStyle(
                                fontSize: 20.rf(context),
                                color: Colors.white,
                                fontFamily: "boldtext"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.rh(context)),
                    Padding(
                      padding: EdgeInsets.only(right: 15.rw(context)),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: defaultStyle,
                          children: <TextSpan>[
                            const TextSpan(
                                text:
                                    'By providing my mobile number, I hereby agree and accept the '),
                            TextSpan(
                              text: 'Terms of Service',
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('Terms of Service'),
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('Privacy Policy'),
                            ),
                            const TextSpan(
                                text: ' in use of the Oroboro Assisted app.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                  style:  TextStyle(
                    fontSize: 12.rf(context),
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
                    child: const Text("OK", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      fontFamily: "regulartext",
                      color: Colors.white,
                    ),), // Button text
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
