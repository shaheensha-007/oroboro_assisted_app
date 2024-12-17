import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import 'package:oroboro_assisted_app/Ui/homepage/Mainhome_page.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
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
late MerchartTokenModel ismercharttoken;
bool isNewUser = false;
bool _isPasswordVisible = false;
bool isLoading = false;
final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
TextEditingController Signinusername = TextEditingController();
TextEditingController Signinpassword = TextEditingController();

class _Signin_pageState extends State<Signin_page> {
  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context).add(FetchMerchartToken(
        userName: "Test", password: tokenpassword, ctx: context));
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
              }
              if(state is MerchartTokenblocError){
               _showErrorSnackBar(state.Errormessage);
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
                        height: 150.rh(context),
                      ),
                      Image(
                        image: const AssetImage("assets/oroborologo.png"),
                        width: 400.rw(context),
                      ),
                      SizedBox(
                        height: 2.rh(context),
                      ),
                       Text(
                        "Welcome to",
                        style: TextStyle(
                            fontSize: 28.rf(context),
                            fontFamily: "boldtext",
                            ),
                      ),
                      SizedBox(
                        height: 10.rh(context),
                      ),
                       Text(
                        "Merchant Assisted App",
                        style: TextStyle(
                            fontSize: 28.rf(context),
                            fontFamily: "boldtext",
                        ),
                      ),
                      SizedBox(
                        height: 50.rh(context),
                      ),
                      AutofillGroup(
                        child: Column(children: [
                          Container(
                            height: 50.rh(context),
                            width: 300.rw(context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey, spreadRadius: 1),
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.rw(context)),
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username must not be empty';
                                  }
                                  if (!RegExp(
                                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
                                      .hasMatch(value)) {
                                    return 'you must contain only uppercase,lowercase and numbers';
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 14.rf(context),
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext"),
                                controller: Signinusername,
                                decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                      fontSize: 10.rf(context),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                  errorStyle: TextStyle(
                                      fontSize: 10.rf(context),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                ),
                                autofillHints: [AutofillHints.username],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40.rh(context),
                          ),
                          Container(
                            height: 50.rh(context),
                            width: 300.rw(context),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey, spreadRadius: 1),
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.rw(context)),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'please enter your password';
                                        }
                                      },
                                      style: TextStyle(
                                          fontSize: 14.rf(context),
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "regulartext"),
                                      controller: Signinpassword,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(16)
                                      ],
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
                                      obscureText: !_isPasswordVisible,
                                      decoration:  InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: TextStyle(
                                            fontSize: 12.rf(context),
                                            fontWeight: FontWeight.w200,
                                            fontFamily: "regulartext"),
                                        errorStyle: TextStyle(
                                            fontSize: 12.rf(context),
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
                        height: 20.rh(context),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.rw(context)),
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
                             Text(
                              "Remember me",
                              style: TextStyle(
                                  fontSize: 13.rf(context),
                                  fontFamily: "boldtext"),
                            ),
                           Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 30.rw(context)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Fogotpassword()),
                                        (route) => false);
                                  },
                                  child:  Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontSize: 13.rf(context),
                                        fontFamily: "boldtext",
                                        color: Color(0xffFF7C00)),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.rh(context),
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
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            );
                          } else {
                            if(state  is SigninblocLoaded) {
                              Navigator.of(context, rootNavigator: true)
                                  .pop();

                            final isSigninsucess =state.signloginModel;


                              // Check if result is null before proceeding
                              if (isSigninsucess?.result != null) {
                                if (isSigninsucess?.result!.userId != null) {
                                  preferences.setString("Userid",
                                      isSigninsucess?.result!.userId??"");
                                } else {
                                  print("Error: userId is null");
                                }

                                if (isSigninsucess?.result!.name != null) {
                                  preferences.setString("username",
                                      isSigninsucess?.result!.name??"");
                                  _saveUserCredentials();
                                } else {
                                  print("Error: username is null");
                                }
                              } else {
                                print("Error: result is null");
                              }


                              // Handle success or failure based on the status
                              if (isSigninsucess?.status.toString() == "Success") {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Mainhome()),
                                      (route) => false,
                                );
                              }
                            }
                            if(state is SigninblocError){
                              Navigator.of(context, rootNavigator: true)
                                  .pop();
                              _showErrorSnackBar(state.Errormessage);

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
                            final signprocess =
                                signinFormKey.currentState!.validate();
                            if (signprocess) {
                              BlocProvider.of<SigninBloc>(context).add(
                                  FetchSignin(
                                      userName: Signinusername.text,
                                      password: Signinpassword.text,
                                      ctx: context));
                            }
                            signinFormKey.currentState!.save();
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 20.rf(context),
                                color: Colors.white,
                                fontFamily: "boldtext"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.rh(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "No Account ?",
                            style: TextStyle(
                                fontSize: 17.rf(context),
                                fontFamily: "boldtext"),
                          ),
                          TextButton(
                              onPressed: () {
                                _partnercodeshowDialog();
                              },
                              child: Text(
                                "Register now.",
                                style: TextStyle(
                                    fontSize: 17.rf(context),
                                    fontFamily: "boldtext",
                                    color: Color(0xffFF7C00)),
                              ))
                        ],
                      ),
                      SizedBox(height: 200.rh(context)),
                       Text(
                        "Version 1.0.0.1",
                        style: TextStyle(
                            fontSize: 12.rf(context),
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
                      NavigationService.pop();
                      }
                      if (state is TokenblocLoaded) {
                        tokenModel =
                            BlocProvider.of<TokenBloc>(context).tokenModel;
                        final isvalid = partnercodekey.currentState?.validate();
                        if (isvalid == true) {
                          print(isvalid);
                         NavigationService.pushAndRemoveUntil(Agent_onborading(), (Route<dynamic>route) => false);
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

void userInfo(String token, String refreshToken) async {
  final preferences = await SharedPreferences.getInstance();
  await preferences.setString('Token', token);
  await preferences.setString('RefersToken', refreshToken);
}
