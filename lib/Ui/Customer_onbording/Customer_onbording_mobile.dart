import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/pan_verification.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
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
late Customer_regsitrationModel isCustomerregistration;
late CustomersendotpModel isCustomersendotp;
TextEditingController onbordingmobile = TextEditingController();

class _Customer_onbording_mobileState extends State<Customer_onbording_mobile> {
  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context)
        .add(FetchMerchartToken(userName: "Test", password: tokenpassword,ctx: context));
    super.initState();
  }

  @override
  void dispose() {
    onbordingmobile.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        const TextStyle(color: Colors.black, fontSize: 12.0);
    TextStyle linkStyle = const TextStyle(color: Color(0xffFF7C00));

    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const MyAppbar(),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: mwidth * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mheight * 0.2),
                  const Text("Loan Onboarding",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "boldtext",
                          fontWeight: FontWeight.w800)),
                  SizedBox(height: mheight * 0.03),
                  const Text(
                      "Enter Customer mobile number. We’ll send you\n a verification to validate the mobile number",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext")),
                  SizedBox(height: mheight * 0.05),
                  Container(
                    height: mheight * 0.06,
                    width: mwidth * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: mwidth * 0.03),
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            fontFamily: "regulartext"),
                        controller: onbordingmobile,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Mobile",
                          hintStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w200,
                              fontFamily: "regulartext"),
                          errorStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w200,
                              fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mheight * 0.05),
                  SizedBox(
                    width: mwidth * 0.8,
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
                        } else if (mounted) {
                          // Ensure context is valid before dismissing the dialog
                          Navigator.of(context).pop();
                        }
                        if (state is CustomersendotpblocLoaded) {
                          isCustomersendotp =
                              BlocProvider
                                  .of<CustomersendotpBloc>(context)
                                  .isCustomersendotp;
                          if (isCustomersendotp.status.toString() ==
                              "Success") {
                            if (mounted) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => Mobileotp()), (route) => false);
                            }
                          } else {
                            _showErrorSnackBar("Not verified");
                          }

                        }

                        if (state is CustomersendotpblocError) {
                          // Dismissing the loading dialog on error
                          if (Navigator.canPop(context)) {
                            Navigator.pop(
                                context); // Close the dialog if it's open

                            _showErrorSnackBar(
                                'Something went wrong. Please try again.');
                          }
                        }
                      },
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: const Color(0xff284389),
                        ),
                        onPressed: () async {
                          final preferences =
                              await SharedPreferences.getInstance();
                          preferences.setString(
                              "onbordingmobile", onbordingmobile.text);
                          BlocProvider.of<CustomersendotpBloc>(context).add(
                            FetchCustomersendotp(
                              userId:
                                  preferences.getString("Userid").toString(),
                              mobilenumber: onbordingmobile.text, ctx: context,
                            ),
                          );
                        },
                        child: const Text(
                          "Send OTP",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mheight * 0.05),
                  Padding(
                    padding: EdgeInsets.only(right: mwidth * 0.05),
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
          ],
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 12, fontFamily: "font2"),
        ),
      ));
    }
  }
}
