import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Customer_onbording/pan_verification.dart';
import 'package:oroboro_assisted_app/LOAN/Loan_detalis/loan_detalis.dart';
import 'package:oroboro_assisted_app/LOAN/Upload_documents/upload_documents.dart';
import 'package:oroboro_assisted_app/LOAN/View%20loan/View%20loan.dart';
import 'package:oroboro_assisted_app/Signin/signin_page.dart';

import 'Customer_onbording/Customer_onbording_mobile.dart';
import 'Customer_onbording/Mobileotp.dart';
import 'Customer_onbording/aadhaar_otp.dart';
import 'Customer_onbording/personal information.dart';
import 'LOAN/Loan_disbursal/Loandisbursal.dart';
import 'Signup/upload the face.dart';
import 'homepage/Mainhome_page.dart';
import 'Signup/agent_onbording.dart';
import 'Splansh_screen/Splansh_Screen.dart';
import 'lastestcomments/lastestcoments.dart';
import 'mpin/alreadyMpin.dart';
import 'notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Mainhome()
    );
  }
}