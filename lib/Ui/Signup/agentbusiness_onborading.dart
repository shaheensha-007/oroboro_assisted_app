import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Draw_in_signature.dart';

class Agent_business_onboarding extends StatefulWidget {
  const Agent_business_onboarding({super.key});

  @override
  State<Agent_business_onboarding> createState() =>
      _Agent_business_onboardingState();
}

TextEditingController gstnumber = TextEditingController();
TextEditingController ownername = TextEditingController();
TextEditingController shopname = TextEditingController();
TextEditingController tannumber = TextEditingController();
bool gstSmallButton = false;
bool ownersmallbutton = false;
bool shopsmallbutton = false;
bool tansmallbutton = false;
bool ownernameshow = false;
bool shopnameshow = false;
bool tannumbershow = false;
bool bussinessnbigbutton = false;
final GlobalKey<FormState> businessregistrationkey = GlobalKey<FormState>();

class _Agent_business_onboardingState extends State<Agent_business_onboarding> {
  String gstPattern =
      r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';

  String? validateGST(String gstNumber) {
    RegExp regExp = RegExp(gstPattern);
    if (gstNumber.isEmpty) {
      return 'GST number is required';
    } else if (!regExp.hasMatch(gstNumber)) {
      return 'Invalid GST number format';
    }
    return null; // Return null if GST number is valid
  }

  /// validation of Gst number

  String? validateTAN(String value) {
    // Regex pattern for TAN
    String pattern = r'^[A-Z]{4}[0-9]{5}[A-Z]{1}$';
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'TAN is required';
    } else if (!regExp.hasMatch(value)) {
      return 'Invalid TAN format';
    }
    return null; // Return null if validation is successful
  }

  /// validation of tan numbers
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: businessregistrationkey,
              child: Column(
                children: [
                  SizedBox(
                    height: mheight * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: mwidth * 0.2),
                    child: const Text(
                      "Let’s Start Your\nAgent  Business  Journey",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "boldtext",
                        fontWeight: FontWeight.w800,
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
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(left: mwidth * 0.03),
                      child: TextFormField(
                        validator: (value) => validateGST(value ?? ''),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15),
                        ],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext",
                        ),
                        controller: gstnumber,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "GST",
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
                          // Button inside the text form field when length is 15
                          suffixIcon: gstSmallButton
                              ? IconButton(
                                  icon: const Icon(Icons.check),
                                  onPressed: () {
                                    // Perform GST validation when the button is clicked
                                    if (validateGST(gstnumber.text) == null) {
                                      // GST number is valid
                                      setState(() {
                                        ownernameshow = true;
                                      });
                                    } else {
                                      setState(() {
                                        ownernameshow = false;
                                      });
                                      _showErrorSnackBar('Invalid GST number format!');
                                    }
                                  },
                                )
                              : null,
                        ),
                        onChanged: (value) {
                          // Enable the button when the length of GST number reaches 15
                          if (value.length == 15) {
                            setState(() {
                              gstSmallButton = true;
                            });
                          } else {
                            setState(() {
                              gstSmallButton = false;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.03,
                  ),
                  ownernameshow
                      ? Container(
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
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "regulartext"),
                              controller: ownername,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "Shop owner name",
                                hintStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                errorStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                // Display the suffix icon only when ownersmallbutton is true
                                suffixIcon: ownersmallbutton
                                    ? IconButton(
                                        icon: const Icon(Icons.check),
                                        onPressed: () {
                                          setState(() {
                                            shopnameshow =
                                                true; // Move to the next step
                                          });
                                        },
                                      )
                                    : null,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // Set ownersmallbutton to true when the input is not empty
                                  ownersmallbutton = value.isNotEmpty;
                                });
                              },
                            ),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: mheight * 0.03,
                  ),
                  shopnameshow
                      ? Container(
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
                                fontFamily: "regulartext",
                              ),
                              controller: shopname,
                              // Remove const from the InputDecoration
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "Shop name",
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
                                // Display suffixIcon when shopsmallbutton is true
                                suffixIcon: shopsmallbutton
                                    ? IconButton(
                                        icon: const Icon(Icons.check),
                                        onPressed: () {
                                          setState(() {
                                            tannumbershow = true;
                                          });
                                        },
                                      )
                                    : null,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  // Set shopsmallbutton to true when the input is not empty
                                  shopsmallbutton = value.isNotEmpty;
                                });
                              },
                            ),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: mheight * 0.03,
                  ),
                  tannumbershow
                      ? Container(
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
                              controller: tannumber,
                              validator: (value) => validateTAN(value ?? ''),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext",
                              ),
                              decoration: InputDecoration(
                                // Remove const here
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                hintText: "TAN",
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
                                suffixIcon: tansmallbutton
                                    ? IconButton(
                                        icon: const Icon(Icons.check),
                                        onPressed: () {
                                          if (validateTAN(tannumber.text) ==
                                              null) {
                                            setState(() {
                                              bussinessnbigbutton = true;
                                            });
                                          } else {
                                            setState(() {
                                              bussinessnbigbutton = false;
                                            });
                                            _showErrorSnackBar('Invalid TAN number format!');
                                          }
                                        },
                                      )
                                    : null,
                              ),
                              onChanged: (value) {
                                if (value.length == 10) {
                                  setState(() {
                                    tansmallbutton = true;
                                  });
                                } else {
                                  setState(() {
                                    tansmallbutton = false;
                                  });
                                }
                              },
                            ),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: mheight * 0.05,
                  ),
                  Center(
                    child: bussinessnbigbutton
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: const Color(0xff284389)),
                            onPressed: () {
                              final isvalidtan = businessregistrationkey
                                  .currentState
                                  ?.validate();
                              if (isvalidtan == true) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Draw_in_signature()),
                                    (route) => false);
                                businessregistrationkey.currentState?.save();
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontFamily: "regulartext"),
                            ))
                        : const SizedBox(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    setState(() {
      ownernameshow = false;
      shopnameshow = false;
      tannumbershow = false;
      gstSmallButton = false;
      ownersmallbutton = false;
      shopsmallbutton = false;
      tansmallbutton = false;
      bussinessnbigbutton = false;
    });
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
