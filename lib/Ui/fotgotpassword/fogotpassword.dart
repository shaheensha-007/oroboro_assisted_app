import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/modeles/FogotpasswordModel/ForgotpasswordModel.dart';
import '../../Blocs/Forgotpassword_bloc/forgotpassword_bloc.dart';
import '../../widgets/tostmessage.dart';
import '../Signin/signin_page.dart';

class Fogotpassword extends StatefulWidget {
  const Fogotpassword({super.key});

  @override
  State<Fogotpassword> createState() => _FogotpasswordState();
}

late ForgotpasswordModel isForgotpassword;
TextEditingController forgotusername = TextEditingController();
TextEditingController forgotmobile = TextEditingController();
final forgotpasswordmobilekey = GlobalKey<FormState>();

class _FogotpasswordState extends State<Fogotpassword> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: mwidth * 0.1),
              child: Form(
                key: forgotpasswordmobilekey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mheight * 0.25,
                    ),
                    const Text(
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "boldtext",
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: mheight * 0.01,
                    ),
                    const Text(
                      "Please enter your Mobile Number. You will receive\na link to create a new Password via email.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "regulartext",
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
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.03),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: forgotusername,
                          keyboardType: TextInputType.text,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username cannot be empty';
                            }
                            if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                              return 'Username must contain only letters and numbers';
                            }
                            return null;
                          },
                        ),
                      ),
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
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.03),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext"),
                          controller: forgotmobile,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mobile number cannot be empty';
                            }
                            if (value.length != 10) {
                              return 'Mobile number must be 10 digits';
                            }
                            if (value.startsWith(RegExp(r'[012]'))) {
                              return 'Mobile number cannot start with 0, 1, or 2';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mheight * 0.05,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: mwidth * 0.1),
                        child: BlocListener<ForgotpasswordBloc, ForgotpasswordState>(
                          listener: (context, state) {
                            if (state is ForgotpasswordblocLoading) {
                              CircularProgressIndicator();
                            }
                            if (state is ForgotpasswordblocLoaded) {
                              isForgotpassword =
                                  BlocProvider.of<ForgotpasswordBloc>(context).isforgotpassword;
                            }
                            if (state is ForgotpasswordblocError) {
                              _showErrorSnackBar("username is empty");
                            }
                          },
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: const Color(0xff284389)),
                            onPressed: () {
                              final forgotpasswordvalid =
                              forgotpasswordmobilekey.currentState?.validate();
                              if (forgotpasswordvalid == true) {
                                BlocProvider.of<ForgotpasswordBloc>(context).add(
                                  FetchForgotpassword(
                                    Username: forgotusername.text,
                                    Mobilenumber: forgotmobile.text, ctx: context,
                                  ),
                                );
                                _showErrorSnackBar(isForgotpassword.responseMessage.toString());
                              } else {
                                _showErrorSnackBar("Validation failed");
                              }
                            },
                            child: const Text(
                              "Send",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontFamily: "regulartext"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mheight * 0.05,
                    ),
                    Center(
                      child: Container(
                        width: mwidth * 0.5,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Signin_page()),
                            );
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_outlined,
                                color: Color(0xff284389),
                              ),
                              Text(
                                "Back to Sign in",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff284389)),
                              )
                            ],
                          ),
                        ),
                      ),
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 12, fontFamily: "font2"),
        ),
      ),
    );
  }
}
