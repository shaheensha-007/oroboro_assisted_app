import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/homepage/Mainhome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../Blocs/Restpassword_bloc/restpassword_bloc.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({super.key});

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController ConfirmpasswordController = TextEditingController();
  final restkey = GlobalKey<FormState>();

  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      title: const Text(
        'Change password',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          fontFamily: "regulartext",
        ),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Form(
          key: restkey,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03),
                  child: TextFormField(
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     _errorMessage = 'Please enter a password';
                    //   } else {
                    //     // Regular expression for password validation
                    //     String pattern =
                    //         r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$';
                    //     RegExp regex = RegExp(pattern);
                    //     if (!regex.hasMatch(value)) {
                    //       _errorMessage =
                    //       'password is with an uppercase letter, a number, and a special character.';
                    //     } else {
                    //       _errorMessage = ''; // Clear the error message if validation passes
                    //     }
                    //   }
                    //   return _errorMessage;
                    // },
                    controller: newpasswordcontroller,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      fontFamily: "regulartext",
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: "New Password",
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
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.03),
                  child: TextFormField(
                    controller: ConfirmpasswordController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      fontFamily: "regulartext",
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: "Confirm Password",
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
            ],
          ),
        ),
      ),
      actions: <Widget>[
        BlocListener<RestpasswordBloc, RestpasswordState>(
  listener: (context, state) {
    if (state is RestpasswordblocLoading) {
      CircularProgressIndicator();
    }
    if (state is RestpasswordblocLoaded) {
      final restpasswordvalid =state.restpasswordModel;
      if (restpasswordvalid.status.toString()=="Success") {
        _showErrorSnackBar(restpasswordvalid.responseMessage.toString());
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Mainhome()));
      }
    }
      if (state is RestpasswordblocError) {
        _showErrorSnackBar(state.invalidmessage);

      }
    // TODO: implement listener
    // TODO: implement listener
  },
  child: GestureDetector(
          onTap: ()async {
            final preferences =
            await SharedPreferences.getInstance();
            String UserID=preferences.getString("Userid").toString();
            print(UserID);
              if (restkey.currentState!.validate()) {
                BlocProvider.of<RestpasswordBloc>(context).add(
                    FetchRestpassword(
                        userId:UserID,
                        password: ConfirmpasswordController.text, ctx: context,
                    ));
                // _showErrorText(context, 'Passwords is matched.');
              }
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 1,
                ),
              ],
              color: const Color(0xff284389),
            ),
            child: const Center(
              child: Text(
                "Submit",
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
),
      ],
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