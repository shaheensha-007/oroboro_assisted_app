import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/AgentKyc_bloc/agentkyc_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/vetrifypan_bloc/verifypan_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Signin/signin_page.dart';
import 'package:oroboro_assisted_app/Ui/Signup/Preview_document/Preview_of%20documents.dart';
import 'package:oroboro_assisted_app/Ui/Signup/bank_registration.dart';
import 'package:oroboro_assisted_app/Ui/Signup/loan_application_verification.dart';
import 'package:oroboro_assisted_app/modeles/AgentKycModel/AgentKycModel.dart';
import 'package:oroboro_assisted_app/modeles/mobile_agentModel/mobileagentmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Blocs/ Mobileagent_bloc/mobileagent_bloc.dart';
import '../../../Blocs/MobileotpVerify_bloc/mobileotpverify_bloc.dart';
import '../../../Blocs/token_bloc/token_bloc.dart';
import '../../../modeles/MobileOtpVerifyModel/MobileOtpverifyModel.dart';
import '../../../modeles/verifly_pan_model/Veriflypanmodel.dart';
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
final pankey1 = GlobalKey<FormState>();
final mobilekey = GlobalKey<FormState>();
final mobileotpkey = GlobalKey<FormState>();
final emailkey=GlobalKey<FormState>();
TextEditingController Pannumber=TextEditingController();
TextEditingController mobilenumber=TextEditingController();
TextEditingController mobileotp=TextEditingController();
TextEditingController email=TextEditingController();

bool showItems = false;
bool resendotp=false;

String verifypanname="";
String verifypanDOB="";
class _Enter_panState extends State<Enter_pan> {

  String? validatePAN(value) {
    // Define a regular expression for PAN format
    RegExp panRegex = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$');

    if (!panRegex.hasMatch(value)) {
      return 'Invalid PAN format. It should be like "ABCDE1234F"';
    }

    return null; // Return null if the format is valid
  } /// validatiion of PAN NUMBER


  String? validateMobile(num) {
// Indian Mobile number are of 10 digit only
    if (num.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }/// validation of number


  String? validateEmail(emailvalue) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(emailvalue))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;



    /// enter the pan number
    return Column(
          children: [
            BlocListener<VerifypanBloc, VerifypanState>(
    listener: (ctx, state) {
      if(state is VerifypanblocLoading){
        CircularProgressIndicator();
      }
      if(state is VerifypanblocLoaded){
        isverification=BlocProvider.of<VerifypanBloc>(context).isverifypan;
        print("value${isverification}");

        if (isverification.result.innerResult != null) {
          verifypanname = isverification.result.innerResult!.name.toString();
          verifypanDOB = isverification.result.innerResult!.dob.toString();

          if (verifypanDOB != null && verifypanDOB.isNotEmpty) {
            try {
              DateTime dobDateTime = DateTime.parse(verifypanDOB);
              // Date parsed successfully, you can use dobDateTime here
            } catch (e) {
              // Handle parsing error
              print('Error parsing date: $e');
            }
          } else {
            // Handle case where verifypanDOB is null or empty
            print('Error: verifypanDOB is null or empty');
          }
        } else {
          // Handle the case when innerResult is null
          // For example, set verifypanname and verifypanDOB to some default value
          print('innerResult is null');
        }
        final verifynextprocess = isverification.result.nextprocess.toString();
        if (verifynextprocess != null) {
          if (verifynextprocess == "/AgentOnboarding/BusinessRegistration") {
           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Agent_business_onboarding()), (route) => false);
          }
           else if (verifynextprocess == "/AgentOnboarding/ESign") {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Preview_of_documents()));
           } else if (verifynextprocess == "/AgentOnboarding/BankVerification") {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bank_registration()));
           } else if (verifynextprocess == "/AgentOnboarding/Success") {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Loan_application_verification()));
           }
        }
      }

      // TODO: implement listener
    },
    child: Form(
                    key: pankey1,
                    child: Container(
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
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: Pannumber,
                                validator:validatePAN,
                                onChanged: (text){
                                 Pannumber.text=text.toUpperCase();
                                 Pannumber.selection=TextSelection.fromPosition(TextPosition(offset: Pannumber.text.length));
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),

                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: "PAN",
                                  hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                                  errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mheight * 0.06,
                              width: mwidth*0.3,
                              child: BlocListener<TokenBloc, TokenState>(
  listener: (context, state) {
    if (state is TokenblocLoading) {
      CircularProgressIndicator();
    }
    if (state is TokenblocLoaded) {
      print("loaded");
      tokenModel =
          BlocProvider.of<TokenBloc>(context).tokenModel;
      print("access" + tokenModel[0]);
      print("refresh" + tokenModel[1]);
      final isvaild = pankey1.currentState?.validate();
      if (isvaild == true) {
        pankey1.currentState?.save();
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
        userInfo(
            tokenModel[0],
            tokenModel[1]
          // true,
        );

      } else {
        Container();
      }
    }
    // TODO: implement listener
  },
  child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: Color(0xff284389),
                                ),
                                onPressed: () {
                                  TextInput.finishAutofillContext();
                                  BlocProvider.of<TokenBloc>(context).add(FetchToken(
                                      passwordInBase64: "ASBTRYIMNYER654",
                                      userName: "OroboroTestClient",
                                      ctx: context));
                                },
                                child: Text(
                                  "verify",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
    ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: child,
                  axisAlignment: 1.0,
                );
              },
              child: showItems
                  ? Padding(
      padding: EdgeInsets.only(right: mwidth * 0.2),
      child: BlocBuilder<VerifypanBloc, VerifypanState>(
  builder: (context, state) {
    if (state is VerifypanblocLoading) {
      CircularProgressIndicator();
    }
    if (state is VerifypanblocLoaded) {
      // final verifypanname = isverification.result?.innerResult?.name ?? "N/A";
      // final verifypanDOB= isverification.result?.innerResult?.dob ?? "N/A";

      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mheight * 0.02,
            ),
            Center(child: Text(verifypanname, style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w200,
                fontFamily: "regulartext"))),
            Center(child: Text(verifypanDOB, style: TextStyle(fontSize: 14,
                fontWeight: FontWeight.w200,
                fontFamily: "regulartext"))),
          ]
      );
    }if(state is VerifypanblocError){
      return SizedBox();
    }else{
      return SizedBox();
    }
  }
)
      )
                  : SizedBox(),
            ),

            /// enter monbile number registrtion
            SizedBox(
              height: mheight*0.04,
            ),
            BlocListener<MobileagentBloc, MobileagentState>(
  listener: (context, state) {
    if(state is MobileagentblocLoading){
      CircularProgressIndicator();
    }
    if(state is MobileagentblocError){
      _showErrorSnackBar("Not Send OTP");
    }
    if(state is VerifypanblocLoaded){
      isverificationmobile=BlocProvider.of<MobileagentBloc>(context).ismobile;
    }
    // TODO: implement listener
  },
  child: Form(
              key:mobilekey,
              child: Container(
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
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: mobilenumber,
                          validator: validateMobile,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Mobile",
                            hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                            errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mheight * 0.06,
                        width: mwidth*0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Color(0xff284389),
                          ),
                          onPressed: () async{
                            final SharedPreferences preferences = await SharedPreferences.getInstance();
                            final ismobilevalid = mobilekey.currentState?.validate();
                            if (ismobilevalid == true) {
                              BlocProvider.of<MobileagentBloc>(context).add(FetchMobileagent(clientId: MainclientId, mobile:mobilenumber.text , OnboardingFor: "Agent", ctx: context));
                              preferences.setString("MOBILENUMBER", mobilenumber.text);
                              mobilekey.currentState?.save();
                              setState(() {
                                showItems=false;
                                resendotp=true;
                              });
                            }
                          },
                          child: Text(
                            "OTP",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: child,
                  axisAlignment: 1.0,
                );
              },
              child: resendotp
              ?  Column(
                children: [
                  SizedBox(
                    height: mheight*0.04,
                  ),
                  BlocListener<MobileotpverifyBloc, MobileotpverifyState>(
  listener: (context, state) {
    if(state is MobileotpverifyblocLoading){
      CircularProgressIndicator();
    }
    if(state is MobileotpverifyblocError){
      _showErrorSnackBar("Not validate OTP");
    }
    if(state is MobileotpverifyblocLoaded){
    final otpverification= BlocProvider.of<MobileotpverifyBloc>(context).ismobileOtp;
      if(otpverification.result!.activityStatus=="VERIFIED"){
        _showErrorSnackBar("OTP VERIFIED");
      }
    }
    // TODO: implement listener
  },
  child: Form(
                    key: mobileotpkey,
                    child: Container(
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
                          keyboardType: TextInputType.number,
                          controller:mobileotp,
                          onEditingComplete: () {
                            final isvalidmobileotp = mobileotpkey.currentState
                                ?.validate();
                            if (isvalidmobileotp == true) {
                              BlocProvider.of<MobileotpverifyBloc>(context).add(FetchMobileotpverify(clientId: MainclientId, Mobile: mobilenumber.text, Otp:mobileotp.text, OnboardingFor:"Agent", ctx: context));
                              print(mobileotpkey);
                            }
                          },
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "OTP",
                            hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                            errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          ),
                        ),
                      ),
                    ),
                  ),
),
                  SizedBox(
                    height: mheight*0.02,
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: mwidth*0.1),
                    child: Row(
                      children: [
                        Text("Did't Receive the Verification OTP",style:TextStyle(fontSize: 12,fontWeight: FontWeight.w200,fontFamily: "regulartext"),),
                        TextButton(onPressed: (){}, child: Text("Resend OTP",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w200,fontFamily: "regulartext",color: Color(0xffFF7C00)),))
                      ],
                    ),
                  )
                ],
              ) :SizedBox(),
            ),

            SizedBox(
              height: mheight*0.04,
            ),
            Form(
              key:emailkey,
              child: Container(
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
                    controller: email,
                    validator: validateEmail,
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                      errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mheight*0.04,
            ),
            BlocListener<AgentkycBloc, AgentkycState>(
  listener: (context, state) {
    if(state is AgentKycblocLoading){
      CircularProgressIndicator();
    }
    if(state is AgentKycblocError){
      _showErrorSnackBar("internal server issue");
    }
    if(state is AgentKycblocLoaded){
      isverificationAgentkyc=BlocProvider.of<AgentkycBloc>(context).isagentkyccompleted;
      if(isverificationAgentkyc.result!.activityStatus=="SUCCESS"){
        _showErrorSnackBar("Agent is Completed");
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Agent_business_onboarding()), (route) => false);
      }else{
        _showErrorSnackBar("Agent not Completed");
      }
    }
    // TODO: implement listener
  },
  child: ElevatedButton(style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Color(0xff284389)
        ),onPressed: ()async{
        final isvalidmobileotp = emailkey.currentState
            ?.validate();
        if (isvalidmobileotp == true) {
          final SharedPreferences preferences = await SharedPreferences.getInstance();
          BlocProvider.of<AgentkycBloc>(context).add(FetchAgentKyc(clientId: MainclientId, PartnerCode:preferences.getString("partnercode").toString() , PAN:Pannumber.text, Mobile: mobilenumber.text, Email:email.text, OnboardingFor:"Agent", ctx:context));
        emailkey.currentState?.save();

        print(mobileotpkey);
        }
        }, child:Text("Next",style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              fontFamily: "regulartext",
              color: Colors.white,
            ),)),
),
          ],
    );
  }
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message,style: TextStyle(fontSize: 12,fontFamily: "font2"),),));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

void userInfo(String token, String refreshToken) async {
  final preferences = await SharedPreferences.getInstance();
  await preferences.setString('Token', token);
  await preferences.setString('RefersToken', refreshToken);
}
