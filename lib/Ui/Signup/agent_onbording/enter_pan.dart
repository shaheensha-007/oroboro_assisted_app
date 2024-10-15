import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:oroboro_assisted_app/Ui/Signin/signin_page.dart';
import 'package:oroboro_assisted_app/Ui/Signup/Preview_document/Preview_of%20documents.dart';
import 'package:oroboro_assisted_app/Ui/Signup/bank_registration.dart';
import 'package:oroboro_assisted_app/Ui/Signup/loan_application_verification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Blocs/Signupblocs/ Mobileagent_bloc/mobileagent_bloc.dart';
import '../../../Blocs/Signupblocs/AgentKyc_bloc/agentkyc_bloc.dart';
import '../../../Blocs/Signupblocs/MobileotpVerify_bloc/mobileotpverify_bloc.dart';
import '../../../Blocs/Signupblocs/vetrifypan_bloc/verifypan_bloc.dart';
import '../../../Blocs/token_bloc/token_bloc.dart';
import '../../../modeles/signupModelclass/AgentKycModel/AgentKycModel.dart';
import '../../../modeles/signupModelclass/MobileOtpVerifyModel/MobileOtpverifyModel.dart';
import '../../../modeles/signupModelclass/mobile_agentModel/mobileagentmodel.dart';
import '../../../modeles/signupModelclass/verifly_pan_model/Veriflypanmodel.dart';
import '../../Splansh_screen/Splansh_Screen.dart';
import '../agentbusiness_onborading.dart';

class Enter_pan extends StatefulWidget {
  const Enter_pan({super.key});

  @override
  State<Enter_pan> createState() => _Enter_panState();
}

late VerifypanModel isverification;
late MobileagentModel isverificationmobile;
late MobileOtpverifyModel isverificationOTP;
late AgentKycModel isverificationAgentkyc;
final GlobalKey<FormState> kycregistrationkey = GlobalKey<FormState>();
TextEditingController Pannumber = TextEditingController();
TextEditingController mobilenumber = TextEditingController();
TextEditingController mobileotp = TextEditingController();
TextEditingController email = TextEditingController();

bool showItems = false;
bool resendotp = false;
bool pansmallbutton = false;
bool mobilesmallbutton=false;
bool otpsmallbutton=false;
String verifypanname = "";
String verifypanDOB = "";
bool isLoading = false;

class _Enter_panState extends State<Enter_pan> {
  String? validatePAN(value) {
    // Define a regular expression for PAN format
    RegExp panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');

    if (!panRegex.hasMatch(value)) {
      return 'Invalid PAN format. It should be like "ABCDE1234F"';
    }

    return null; // Return null if the format is valid
  }

  /// validatiion of PAN NUMBER

  String? validateMobile(String? number) {
  if (number == null || number.isEmpty) {
  return 'Mobile Number must not be empty';
  }

  if (number.length != 10) {
  return 'Mobile Number must be of 10 digits';
  }

  if (!RegExp(r'^\d+$').hasMatch(number)) {
  return 'Mobile Number must contain only digits';
  }
  if (number.startsWith('0') || number.startsWith('1') || number.startsWith('2')) {
  return 'Mobile Number cannot start with 0, 1, or 2';
  }

  return null;
  }

  /// validation of number

  String? validateEmail(emailvalue) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(emailvalue)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;

    /// enter the pan number
    return Column(
      children: [
        BlocListener<VerifypanBloc, VerifypanState>(
          listener: (ctx, state) {
            if (state is VerifypanblocLoading) {
            setState(() {
               isLoading = true;
            });
            }
            if (state is VerifypanblocLoaded) {
              setState(() {
                 isLoading = false;
              });
              isverification =
                  BlocProvider.of<VerifypanBloc>(context).isverifypan;
              print("value$isverification");

              // Check if result and innerResult are not null
              if (isverification.result?.innerResult != null) {
                verifypanname = isverification.result!.innerResult!.name ?? "";
                verifypanDOB = isverification.result!.innerResult!.dob ?? "";

                if (verifypanDOB.isNotEmpty) {
                  try {
                    DateTime dobDateTime = DateTime.parse(verifypanDOB);
                    // Date parsed successfully
                    print('Parsed Date: $dobDateTime');
                  } catch (e) {
                    // Handle parsing error
                    print('Error parsing date: $e');
                  }
                } else {
                  // Handle case where verifypanDOB is empty
                  print('Error: verifypanDOB is empty');
                }
              } else {
                // Handle the case when innerResult is null
                verifypanname = "";
                verifypanDOB = "";
                print('innerResult is null');
              }

              // Handle the next process and navigation logic
              final verifynextprocess =
                  isverification.result?.nextprocess.toString() ?? "";
              switch (verifynextprocess) {
                case "/AgentOnboarding/BusinessRegistration":
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            const Agent_business_onboarding()),
                    (route) => false,
                  );
                  break;

                case "/AgentOnboarding/ESign":
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const Preview_of_documents()),
                  );
                  break;

                case "/AgentOnboarding/BankVerification":
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const Bank_registration()),
                  );
                  break;

                case "/AgentOnboarding/Success":
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            const Loan_application_verification()),
                  );
                  break;

                default:
                  print('Unknown next process: $verifynextprocess');
              }
            }

            // TODO: implement listener
          },
          child: Container(
            height: mheight * 0.06,
            width: mwidth * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                ],
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(left: mwidth * 0.03),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: Pannumber,
                      validator: (value) => validatePAN(value ?? ''),
                      onChanged: (text) {
                        setState(() {
                          // Convert the text to uppercase
                          Pannumber.text = text.toUpperCase();
                          Pannumber.selection = TextSelection.fromPosition(
                            TextPosition(offset: Pannumber.text.length),
                          );

                          // Enable the IconButton when 10 characters are entered
                          pansmallbutton = Pannumber.text.length == 10;
                        });
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext",
                      ),
                      decoration: InputDecoration(
                        // Removed const here
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "PAN",
                        hintStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext",
                        ),
                        errorStyle: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext",
                        ),
                        suffixIcon: pansmallbutton
                            ? BlocListener<TokenBloc, TokenState>(
                                listener: (context, state) {
                                  if (state is TokenblocLoading) {
                                    const CircularProgressIndicator();
                                  }
                                  if (state is TokenblocLoaded) {
                                    print("loaded");
                                    tokenModel =
                                        BlocProvider.of<TokenBloc>(context).tokenModel;
                                    print("access${tokenModel[0]}");
                                    print("refresh${tokenModel[1]}");
                                      TextInput.finishAutofillContext();
                                      BlocProvider.of<VerifypanBloc>(context)
                                          .add(FetchVerifypan(
                                        clientId: MainclientId,
                                        PAN: Pannumber.text,
                                        OnboardingFor: "Agent",
                                        ctx: context,
                                      ));
                                      setState(() {
                                        showItems = true;
                                      });
                                      userInfo(tokenModel[0], tokenModel[1]
                                        // true,
                                      );
                                    } else {
                                      Container();
                                    }
                                  // TODO: implement listener
                                },
                                child: IconButton(
                                  onPressed: () {
                                    TextInput.finishAutofillContext();
                                    BlocProvider.of<TokenBloc>(context)
                                        .add(FetchToken(
                                      passwordInBase64: "ASBTRYIMNYER654",
                                      userName: "OroboroTestClient",
                                      ctx: context,
                                    ));
                                  },
                                  icon: const Icon(Icons.arrow_forward,color: Colors.blue,),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isLoading)
          Center(
            child: CircularProgressIndicator(),
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
          child: showItems
              ? Padding(
                  padding: EdgeInsets.only(right: mwidth * 0.1),
                  child: BlocBuilder<VerifypanBloc, VerifypanState>(
                      builder: (context, state) {
                    if (state is VerifypanblocLoading) {
                      CircularProgressIndicator();
                    }
                    if (state is VerifypanblocLoaded) {
                      isverification =
                          BlocProvider.of<VerifypanBloc>(context).isverifypan;
                      String verifypanname =
                          isverification.result.innerResult?.name ?? "N/A";
                      String verifypanDOB =
                          isverification.result.innerResult?.dob ?? "N/A";
                      if (verifypanDOB != "N/A") {
                        DateTime parsedDate = DateTime.parse(verifypanDOB);
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(parsedDate);
                        verifypanDOB = formattedDate;
                      }
                      print(verifypanname.toString());
                      return Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.1),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: mheight * 0.02,
                              ),
                              Text(verifypanname,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext")),
                              Center(
                                child: Text(verifypanDOB,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "regulartext")),
                              ),
                            ]),
                      );
                    }
                    if (state is VerifypanblocError) {
                      return const SizedBox();
                    } else {
                      return const SizedBox();
                    }
                  })
          )
              : const SizedBox(),
        ),

        /// enter monbile number registrtion
        SizedBox(
          height: mheight * 0.04,
        ),
        BlocListener<MobileagentBloc, MobileagentState>(
          listener: (context, state) {
            if (state is MobileagentblocLoading) {
            }
            if (state is MobileagentblocError) {
              _showErrorSnackBar("Not Send OTP");
            }
            if (state is VerifypanblocLoaded) {
              isverificationmobile =
                  BlocProvider.of<MobileagentBloc>(context).ismobile;
            }
            // TODO: implement listener
          },
          child: Container(
            height: mheight * 0.06,
            width: mwidth * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                ],
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(left: mwidth * 0.03),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: mobilenumber,
                      validator: validateMobile,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      decoration:  InputDecoration(
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
                        suffixIcon: mobilesmallbutton
                          ?IconButton(onPressed: ()async{
                          final SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                            BlocProvider.of<MobileagentBloc>(context).add(
                                FetchMobileagent(
                                    clientId: MainclientId,
                                    mobile: mobilenumber.text,
                                    OnboardingFor: "Agent",
                                    ctx: context));
                            preferences.setString(
                                "MOBILENUMBER", mobilenumber.text);
                            setState(() {
                              showItems = false;
                              resendotp = true;
                            });

                        },
                            icon: Icon(Icons.arrow_forward,color: Colors.blue,)
                        )
                            :null
                      ),
                      onChanged: (value){
                       if(mobilenumber.text.length==10){
                         setState(() {
                           mobilesmallbutton=true;
                         });
                       }else{
                         setState(() {
                           mobilesmallbutton=false;
                         });
                       }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
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
          child: resendotp
              ? Column(
                  children: [
                    SizedBox(
                      height: mheight * 0.04,
                    ),
                    BlocListener<MobileotpverifyBloc, MobileotpverifyState>(
                      listener: (context, state) {
                        if (state is MobileotpverifyblocLoading) {
                          const CircularProgressIndicator();
                        }
                        if (state is MobileotpverifyblocError) {
                          _showErrorSnackBar("Not validate OTP");
                        }
                        if (state is MobileotpverifyblocLoaded) {
                          final otpverification =
                              BlocProvider.of<MobileotpverifyBloc>(context)
                                  .ismobileOtp;
                          if (otpverification.result!.activityStatus ==
                              "VERIFIED") {
                            _showErrorSnackBar("OTP VERIFIED");
                          }
                        }
                        // TODO: implement listener
                      },
                      child: Container(
                        height: mheight * 0.06,
                        width: mwidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, spreadRadius: 1),
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(left: mwidth * 0.03),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(5),
                            ],
                            controller: mobileotp,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext"),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText: "OTP",
                              hintStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "regulartext"),
                              errorStyle: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "regulartext"),
                              suffixIcon: otpsmallbutton
                              ?IconButton(onPressed: (){

                                  BlocProvider.of<MobileotpverifyBloc>(context)
                                      .add(FetchMobileotpverify(
                                      clientId: MainclientId,
                                      Mobile: mobilenumber.text,
                                      Otp: mobileotp.text,
                                      OnboardingFor: "Agent",
                                      ctx: context));
                              }, icon:Icon(Icons.arrow_forward,color: Colors.blue,)
                              )
                                  :null
                            ),
                            onChanged: (value){
                              if(mobileotp.text.length <= 5){
                                setState(() {
                                  otpsmallbutton=true;
                                });
                              }else{
                                setState(() {
                                  otpsmallbutton=false;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mheight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: mwidth * 0.1),
                      child: Row(
                        children: [
                          const Text(
                            "Did't Receive the Verification OTP",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                          TextButton(
                              onPressed: () {
                                  BlocProvider.of<MobileotpverifyBloc>(context)
                                      .add(FetchMobileotpverify(
                                      clientId: MainclientId,
                                      Mobile: mobilenumber.text,
                                      Otp: mobileotp.text,
                                      OnboardingFor: "Agent",
                                      ctx: context));
                              },
                              child: const Text(
                                "Resend OTP",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext",
                                    color: Color(0xffFF7C00)),
                              ))
                        ],
                      ),
                    )
                  ],
                )
              : const SizedBox(),
        ),

        SizedBox(
          height: mheight * 0.04,
        ),
        Container(
          height: mheight * 0.06,
          width: mwidth * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(color: Colors.grey, spreadRadius: 1),
              ],
              color: Colors.white),
          child: Padding(
            padding: EdgeInsets.only(left: mwidth * 0.03),
            child: TextFormField(
              controller: email,
              validator: validateEmail,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  fontFamily: "regulartext"),
              decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: "Email",
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
        SizedBox(
          height: mheight * 0.04,
        ),
        BlocListener<AgentkycBloc, AgentkycState>(
          listener: (context, state) {
            if (state is AgentKycblocLoading) {
              const CircularProgressIndicator();
            }
            if (state is AgentKycblocError) {
              _showErrorSnackBar("internal server issue");
            }
            if (state is AgentKycblocLoaded) {
              isverificationAgentkyc =
                  BlocProvider.of<AgentkycBloc>(context).isagentkyccompleted;
              if (isverificationAgentkyc.result!.activityStatus == "SUCCESS") {
                final kyccompleted=isverificationAgentkyc.message.toString();
                _showErrorSnackBar(kyccompleted);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            const Agent_business_onboarding()),
                    (route) => false);
              } else {
                _showErrorSnackBar("Agent not Completed");
              }
            }
            // TODO: implement listener
          },
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  backgroundColor: const Color(0xff284389)),
              onPressed: () async {
                final isvalidmobileotp = kycregistrationkey.currentState?.validate();
                if (isvalidmobileotp == true) {
                  final SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  BlocProvider.of<AgentkycBloc>(context).add(FetchAgentKyc(
                      clientId: MainclientId,
                      PartnerCode:
                          preferences.getString("partnercode").toString(),
                      PAN: Pannumber.text,
                      Mobile: mobilenumber.text,
                      Email: email.text,
                      OnboardingFor: "Agent",
                      ctx: context));
                  kycregistrationkey.currentState!.save();
                }
              },
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  fontFamily: "regulartext",
                  color: Colors.white,
                ),
              )),
        ),
      ],
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
    showItems = false;
     resendotp = false;
     pansmallbutton = false;
     mobilesmallbutton=false;
     otpsmallbutton=false;

    // TODO: implement dispose
    super.dispose();
  }

  void userInfo(String token, String refreshToken) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('Token', token);
    await preferences.setString('RefersToken', refreshToken);
  }
}
