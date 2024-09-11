import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import 'package:oroboro_assisted_app/Ui/homepage/Mainhome_page.dart';
import 'package:oroboro_assisted_app/modeles/SigninModel/SignloginModel/SignloginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Signinblocs/Signin_bloc/signin_bloc.dart';
import '../../Blocs/token_bloc/token_bloc.dart';
import '../../modeles/MerchartTokenModel/MerchartTokenModel.dart';
import '../Signup/agent_onbording/agent_onbording.dart';
import '../fotgotpassword/fogotpassword.dart';

const String MainclientId = "OroboroTestClient";

class Signin_page extends StatefulWidget {
  const Signin_page({super.key});

  @override
  State<Signin_page> createState() => _Signin_pageState();
}

late SignloginModel isSigninsucess;
late MerchartTokenModel ismercharttoken;
bool remberingcheck = false;
bool _isPasswordVisible = false;
final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
TextEditingController Signinusername = TextEditingController();
TextEditingController Signinpassword = TextEditingController();

class _Signin_pageState extends State<Signin_page> {
  String validateEmail(String? name) {
    if (name!.isEmpty) {
      return 'Name is must not e empty';
    }
    String pattern = '([a-zA-Z])';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(name)) {
      return 'invalid name';
    }
    return '';
  }

  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context).add(FetchMerchartToken(
        userName: "Test",
        password:
            "RkQtQTMtRDMtRjctMDktMTItMzItRjQtNDUtQTMtNjItMTMtQUQtQjItQTMtMDY="));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: BlocListener<MerchartTokenBloc, MerchartTokenState>(
            listener: (context, state) async {
              if (state is MerchartTokenblocLoading) {
                const CircularProgressIndicator();
              }
              if (state is MerchartTokenblocLoaded) {
                ismercharttoken = BlocProvider.of<MerchartTokenBloc>(context)
                    .mercharttokenmodel;
                final preferences = await SharedPreferences.getInstance();

                String jwttoken = ismercharttoken.jwtToken.toString();
                preferences.setString("jwttoken", jwttoken);
                print("shaheen pk$jwttoken");
              } else {
                Container();
              }
              // TODO: implement listener
            },
            child: Stack(
              children: [
                Form(
                  key: signinFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: mheight * 0.2,
                      ),
                      Image(
                        image: const AssetImage("assets/oroborologo.png"),
                        width: mwidth * 0.4,
                      ),
                      SizedBox(
                        height: mheight * 0.01,
                      ),
                      const Text(
                        "Welcome to",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "boldtext",
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: mheight * 0.02,
                      ),
                      const Text(
                        "Merchant Assisted App",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "boldtext",
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: mheight * 0.05,
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
                            validator: validateEmail,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext"),
                            controller: Signinusername,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText: "Username",
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
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext"),
                                  controller: Signinpassword,
                                  autofillHints: const [AutofillHints.password],
                                  obscureText: !_isPasswordVisible,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "regulartext"),
                                    errorStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "regulartext"),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(_isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible =
                                        !_isPasswordVisible; // Toggle password visibility
                                  });
                                },
                              )
                            ],
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
                            Transform.scale(
                              scale: 1,
                              child: Checkbox(
                                  value: remberingcheck,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.grey)),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      remberingcheck = value ?? false;
                                    });
                                  }),
                            ),
                            const Text(
                              "Remember me",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: mwidth * 0.08),
                              child: TextButton(
                                  onPressed: () {
                                    if (remberingcheck == true) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Fogotpassword()),
                                          (route) => false);
                                    }
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "regulartext",
                                        color: Color(0xffFF7C00)),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: mheight * 0.05,
                      ),
                      BlocListener<SigninBloc, SigninState>(
                        listener: (context, state) async {
                          final preferences =
                          await SharedPreferences.getInstance();
                          if (state is SigninblocLoading) {
                            const CircularProgressIndicator();
                          }
                          if (state is SigninblocLoaded) {
                             isSigninsucess =
                                 BlocProvider
                                     .of<SigninBloc>(context)
                                     .isvalid;
                             preferences.setString("Userid", isSigninsucess.result!.userId.toString());
                             preferences.setString("username", isSigninsucess.result!.name.toString());
                             if(isSigninsucess.status.toString()=="Success"){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mainhome()));
                             }else {
                               String errormessage=isSigninsucess.status.toString();
                               _showErrorSnackBar(errormessage);
                             }

                      // TODO: implement listener
                      }

                        },
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: const Color(0xff284389)),
                            onPressed: () async {
                                BlocProvider.of<SigninBloc>(context).add(FetchSignin(userName: Signinusername.text, password:Signinpassword.text));
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontFamily: "regulartext"),
                            )),
                      ),
                      SizedBox(
                        height: mheight * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "No Account ?",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext"),
                          ),
                          TextButton(
                              onPressed: () {
                                _partnercodeshowDialog();
                              },
                              child: const Text(
                                "Register now.",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext",
                                    color: Color(0xffFF7C00)),
                              ))
                        ],
                      ),
                      SizedBox(height: mheight * 0.2),
                      const Text(
                        "Version 1.0.0.1",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            fontFamily: "regulartext"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _partnercodeshowDialog() {
    late List<String> tokenModel;
    final partnercodekey = GlobalKey<FormState>();
    String? selectedPartnerCode;
    List<String> partnerCodes = ["ORO003"];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var mheight = MediaQuery.of(context).size.height;
        var mwidth = MediaQuery.of(context).size.width;
        return Dialog(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: mwidth * 0.8, // Set your desired width
            height: mheight * 0.5, // Set your desired height
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: partnercodekey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose your Partner Code',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "boldtext"),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: mheight * 0.02,
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
                      child: DropdownButtonFormField<String>(
                        value: selectedPartnerCode,
                        // The currently selected value
                        items: partnerCodes.map((String code) {
                          return DropdownMenuItem<String>(
                            value: code,
                            child: Text(
                              code,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext",
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPartnerCode = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please choose a Partnercode';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "__choose__",
                          hintStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext",
                          ),
                          errorStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  BlocListener<TokenBloc, TokenState>(
                    listener: (context, state) {
                      if (state is TokenblocLoading) {
                        const CircularProgressIndicator();
                      }
                      if (state is TokenblocError) {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const Signin_page()),
                            (route) => false);
                      }
                      if (state is TokenblocLoaded) {
                        tokenModel =
                            BlocProvider.of<TokenBloc>(context).tokenModel;
                        final isvalid = partnercodekey.currentState?.validate();
                        if (isvalid == true) {
                          print(isvalid);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Agent_onborading()),
                              (route) => false);
                        }
                      }
                      // TODO: implement listener
                    },
                    child: Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              backgroundColor: const Color(0xff284389)),
                          onPressed: () async {
                            final SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            preferences.setString(
                                "partnercode", selectedPartnerCode.toString());
                            TextInput.finishAutofillContext();
                            BlocProvider.of<TokenBloc>(context).add(FetchToken(
                                passwordInBase64: "ASBTRYIMNYER654",
                                userName: "OroboroTestClient",
                                ctx: context));
                            //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Agent_onborading()), (route) => false);
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontFamily: "regulartext"),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    remberingcheck = false;
    Signinusername.clear();
    Signinpassword.clear();
    // TODO: implement dispose
    super.dispose();
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 12, fontFamily: "font2"),
      ),
    ));
  }
}

void userInfo(String token, String refreshToken) async {
  final preferences = await SharedPreferences.getInstance();
  await preferences.setString('Token', token);
  await preferences.setString('RefersToken', refreshToken);
}