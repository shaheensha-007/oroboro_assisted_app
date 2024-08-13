import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../homepage/Mainhome_page.dart';

class Set_biometric extends StatefulWidget {
  const Set_biometric({super.key});

  @override
  State<Set_biometric> createState() => _Set_biometricState();
}

class _Set_biometricState extends State<Set_biometric> {
  bool? _hasBiometricSensor;
  final LocalAuthentication authentication = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    _checkForBiometric();
  }

  Future<void> _checkForBiometric() async {
    try {
      _hasBiometricSensor = await authentication.canCheckBiometrics;
      setState(() {});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> getAuth() async {
    bool isAuth = false;
    try {
      isAuth = await authentication.authenticate(
        localizedReason: "Scan your fingerprint to access",
      );
      if (isAuth) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Mainhome()));
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: mheight * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(right: mwidth * 0.5),
                  child: const Text(
                    "Set Biometric",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "boldtext",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.05),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  const Image(
                                      image: AssetImage(
                                          "assets/face_capuring-removebg-preview 1.png")),
                                  SizedBox(
                                    height: mheight * 0.02,
                                  ),
                                  const Text(
                                    "Face ID for LoanDart\nplease put your phone in front of\nyour face to login",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mheight * 0.3,
                          child: const VerticalDivider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          width: mwidth * 0.05,
                        ),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  const Image(
                                      image: AssetImage("assets/FINGER.png")),
                                  SizedBox(
                                    height: mheight * 0.02,
                                  ),
                                  const Text(
                                    "Touch ID for LoanDart\nplease put your finger on the home\nbutton to login",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight * 0.05,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389),
                    ),
                    onPressed: () {
                      getAuth();
                      _checkForBiometric();
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontFamily: "regulartext",
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
