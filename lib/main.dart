import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/AadhaarSendotp_bloc/aadhaarsendotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Aadhaarotpverification_bloc/aadhaarotpverification_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Aadhaaruploadfile_bloc/aadhaaruploadfiles_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/CustomerSendotp_bloc/customersendotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/CustomerVerifiyotp_bloc/customerverifiyotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customer_Regsitration_bloc/customer_regsitration_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customercodecreate_bloc/customercodecreate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Emailupdate_bloc/emailupadate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Panverification_blocs/panverification_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Upadateaddress_bloc/upadateaddress_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/personalinformation_bloc/Monthincome_bloc/monthincome_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Forgotpassword_bloc/forgotpassword_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Restpassword_bloc/restpassword_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Userdetalis_bloc/userdetalis_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/refershtoken_bloc/refreshtoken_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/token_bloc/token_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/aadhaar_otp.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/pan_verification.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/personal%20information.dart';
import 'package:oroboro_assisted_app/Ui/Splansh_screen/Splansh_Screen.dart';
import 'Blocs/Signinblocs/Signin_bloc/signin_bloc.dart';
import 'Blocs/Signupblocs/ Mobileagent_bloc/mobileagent_bloc.dart';
import 'Blocs/Signupblocs/AgentKyc_bloc/agentkyc_bloc.dart';
import 'Blocs/Signupblocs/Agentbusiness_bloc/agentbusiness_bloc.dart';
import 'Blocs/Signupblocs/Esign_bloc/esign_bloc.dart';
import 'Blocs/Signupblocs/Ifsc_bloc/ifsc_bloc.dart';
import 'Blocs/Signupblocs/MobileotpVerify_bloc/mobileotpverify_bloc.dart';
import 'Blocs/Signupblocs/bankregstratin_bloc/bankregstration_bloc.dart';
import 'Blocs/Signupblocs/previewdocuments_bloc/previewdocument_bloc.dart';
import 'Blocs/Signupblocs/vetrifypan_bloc/verifypan_bloc.dart';

const String basePath = "https://apidoc.oroboro.in/api/";
const String basepath_1 = "https://gateway.oroboro.in/";
const String tokenpassword =
    "RkQtQTMtRDMtRjctMDktMTItMzItRjQtNDUtQTMtNjItMTMtQUQtQjItQTMtMDY=";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TokenBloc()),
        BlocProvider(create: (context) => MerchartTokenBloc()),
        BlocProvider(create: (context) => RefreshtokenBloc()),
        BlocProvider(create: (context) => VerifypanBloc()),
        BlocProvider(create: (context) => MobileagentBloc()),
        BlocProvider(create: (context) => MobileotpverifyBloc()),
        BlocProvider(create: (context) => AgentkycBloc()),
        BlocProvider(create: (context) => AgentbusinessBloc()),
        BlocProvider(create: (context) => PreviewdocumentBloc()),
        BlocProvider(create: (context) => EsignBloc()),
        BlocProvider(create: (context) => IfscBloc()),
        BlocProvider(create: (context) => BankregstrationBloc()),
        BlocProvider(create: (context) => SigninBloc()),
        BlocProvider(create: (context) => ForgotpasswordBloc()),
        BlocProvider(create: (context) => RestpasswordBloc()),
        BlocProvider(create: (context) => UserdetalisBloc()),
        BlocProvider(create: (context) => CustomercodecreateBloc()),
        BlocProvider(create: (context) => CustomerRegsitrationBloc()),
        BlocProvider(create: (context) => CustomersendotpBloc()),
        BlocProvider(create: (context) => CustomerverifiyotpBloc()),
        BlocProvider(create: (context) => CustomeronbordingBloc()),
        BlocProvider(create: (context) => CustomerupdateBloc()),
        BlocProvider(create: (context) => PanverificationBloc()),
        BlocProvider(create: (context)=> EmailupadateBloc()),
        BlocProvider(create: (context)=>UpadateaddressBloc()),
        BlocProvider(create: (context)=>AadhaarsendotpBloc()),
        BlocProvider(create: (context)=>AadhaarotpverificationBloc()),
        BlocProvider(create: (context)=>AadhaaruploadfilesBloc()),
        BlocProvider(create: (context)=>MonthincomeBloc()),


      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Splash_Screen()),
    );
  }
}
