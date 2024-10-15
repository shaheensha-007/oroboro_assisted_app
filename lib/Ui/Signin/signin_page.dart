import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import 'package:oroboro_assisted_app/Ui/homepage/Mainhome_page.dart';
import 'package:oroboro_assisted_app/modeles/SigninModel/SignloginModel/SignloginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Signinblocs/Signin_bloc/signin_bloc.dart';
import '../../Blocs/token_bloc/token_bloc.dart';
import '../../main.dart';
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
bool isNewUser = false;
bool _isPasswordVisible = false;
bool isLoading = false;
final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
TextEditingController Signinusername = TextEditingController();
TextEditingController Signinpassword = TextEditingController();

class _Signin_pageState extends State<Signin_page> {
  // String validateEmail(String? name) {
  //   if (name!.isEmpty) {
  //     return 'Username must not be empty';
  //   }
  //   String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$';
  //   RegExp regExp = RegExp(pattern);
  //   if (!regExp.hasMatch(name)) {
  //     return 'you must contain only uppercase,lowercase and numbers';
  //   }
  //   return 'invalid name';
  // }

  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context)
        .add(FetchMerchartToken(userName: "Test", password: tokenpassword,ctx: context));
    // TODO: implement initState
    super.initState();
    _loadUserCredentials();
  }

  void _loadUserCredentials() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey("rememberMe") &&
        preferences.getBool("rememberMe") == true) {
      setState(() {
        Signinusername.text = preferences.getString("savedUsername") ?? "";
        Signinpassword.text = preferences.getString("savedPassword") ?? "";
        isNewUser = true;
      });
    }
  }

  void _saveUserCredentials() async {
    final preferences = await SharedPreferences.getInstance();
    if (isNewUser) {
      preferences.setBool("rememberMe", true);
      preferences.setString("savedUsername", Signinusername.text);
      preferences.setString("savedPassword", Signinpassword.text);
    } else {
      preferences.setBool("rememberMe", false);
      preferences.remove("savedUsername");
      preferences.remove("savedPassword");
    }
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
               setState(() {
                  isLoading = true;
               });
              }
              if (state is MerchartTokenblocLoaded) {

                ismercharttoken = BlocProvider.of<MerchartTokenBloc>(context)
                    .mercharttokenmodel;
                setState(() {
                  isLoading = false;
                });
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
                      AutofillGroup(
                        child: Column(children: [
                          Container(
                            height: mheight * 0.06,
                            width: mwidth * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey, spreadRadius: 1),
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: mwidth * 0.03),
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                validator: (value){
                                  if(value!.isEmpty){
                                    return'Username must not be empty';
                                  }
                                  if(!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$').hasMatch(value)){
                                    return'you must contain only uppercase,lowercase and numbers';
                                  }
                                },
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
                                autofillHints: [AutofillHints.username],
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
                                  BoxShadow(
                                      color: Colors.grey, spreadRadius: 1),
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: mwidth * 0.03),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'please enter your password';
                                        }
                                      },
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "regulartext"),
                                      controller: Signinpassword,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(8)
                                      ],
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
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
                        ]),
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
                                  value: isNewUser,
                                  shape: const RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.grey)),
                                  onChanged: (bool? newvalue) {
                                    setState(() {
                                      isNewUser = newvalue ?? false;
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
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Fogotpassword()),
                                        (route) => false);
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
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          } else {
                            Navigator.of(context).pop();

                            isSigninsucess =
                                BlocProvider.of<SigninBloc>(context).isvalid;

                            if (isSigninsucess.result != null) {
                              if (isSigninsucess.result!.userId != null) {
                                preferences.setString("Userid",
                                    isSigninsucess.result!.userId.toString());
                              } else {
                                print("Error: userId is null");
                              }
                              if (isSigninsucess.result!.name != null) {
                                preferences.setString("username",
                                    isSigninsucess.result!.name.toString());
                                _saveUserCredentials();
                              } else {
                                print("Error: username is null");
                              }
                            } else {
                              print("Error: result is null");
                            }

                            if (isSigninsucess.status.toString() == "Success") {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Mainhome()),
                                  (route) => false);
                            } else {
                              String errormessage =
                                  isSigninsucess.status.toString();
                              _showErrorSnackBar(errormessage);
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
                            final signprocess = signinFormKey.currentState!
                                .validate();
                            if (signprocess) {
                              BlocProvider.of<SigninBloc>(context).add(
                                  FetchSignin(
                                      userName: Signinusername.text,
                                      password: Signinpassword.text, ctx: context));
                            }
                            signinFormKey.currentState!.save();
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontFamily: "regulartext"),
                          ),
                        ),
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
    isNewUser = false;
    Signinusername.clear();
    Signinpassword.clear();
    // TODO: implement dispose
    super.dispose();
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message,
          style: const TextStyle(fontSize: 12, fontFamily: "font2")),
      duration: Duration(milliseconds: 2000),
    ));
  }
}

void userInfo(String token, String refreshToken) async {
  final preferences = await SharedPreferences.getInstance();
  await preferences.setString('Token', token);
  await preferences.setString('RefersToken', refreshToken);
}
