import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/vetrifypan_bloc/verifypan_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Signin/signin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Blocs/token_bloc/token_bloc.dart';
import '../../../modeles/verifly_pan_model/Veriflypanmodel.dart';
import '../../Splansh_screen/Splansh_Screen.dart';
import 'enter_business.dart';

class Enter_pan extends StatefulWidget {
  const Enter_pan({super.key});

  @override
  State<Enter_pan> createState() => _Enter_panState();
}
late VerifypanModel isverification;
final pankey1 = GlobalKey<FormState>();
final mobilekey = GlobalKey<FormState>();
final mobileotpkey = GlobalKey<FormState>();
final emailkey=GlobalKey<FormState>();
TextEditingController pannumber=TextEditingController();
TextEditingController mobilenumber=TextEditingController();
TextEditingController mobileotp=TextEditingController();
TextEditingController email=TextEditingController();

bool showItems = false;
bool resendotp=false;
bool buttonenable=false;
bool nextprocess=false;
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
      }
      if(state is VerifypanblocError){
      return null;
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
                                controller: pannumber,
                                validator:validatePAN,
                                onChanged: (text){
                                 pannumber.text=text.toUpperCase();
                                 pannumber.selection=TextSelection.fromPosition(TextPosition(offset: pannumber.text.length));
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
          PAN: pannumber.text,
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
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(
      height: mheight * 0.02,
      ),
      Center(child: Text("Name", style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w200,
      fontFamily: "regulartext"))),
      Center(child: Text("DOB", style: TextStyle(fontSize: 14,
      fontWeight: FontWeight.w200,
      fontFamily: "regulartext"))),
      ]
      )
      )
                  : SizedBox(),
            ),
            SizedBox(
              height: mheight*0.04,
            ),
            Form(
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
                          onPressed: () {
                            final ismobilevalid = mobilekey.currentState?.validate();
                            if (ismobilevalid == true) {
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
                  Form(
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
                              mobileotpkey.currentState?.save();
                              setState(() {
                                resendotp = false;
                              });
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
            ElevatedButton(style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: Color(0xff284389)
        ),onPressed: (){
        final isvalidmobileotp = emailkey.currentState
            ?.validate();
        if (isvalidmobileotp == true) {
        emailkey.currentState?.save();
        setState(() {
        buttonenable = true;
        });
        print(mobileotpkey);
        }
        }, child:Text("Next",style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              fontFamily: "regulartext",
              color: Colors.white,
            ),)),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: child,
                  axisAlignment: 1.0,
                );
              },
          child: buttonenable
          ?Enter_businessdetalis()
          :SizedBox(),
        ),
          ],
        );
  }
}
void userInfo(String token, String refreshToken) async {
  final preferences = await SharedPreferences.getInstance();
  await preferences.setString('Token', token);
  await preferences.setString('RefersToken', refreshToken);
}