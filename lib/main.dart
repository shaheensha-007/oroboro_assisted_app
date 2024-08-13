import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/refershtoken_bloc/refreshtoken_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/token_bloc/token_bloc.dart';
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
import 'Ui/Customer_onbording/addhaar number.dart';
import 'Ui/Customer_onbording/personal information.dart';


const String basePath = "https://apidoc.oroboro.in/api/";

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
        BlocProvider(create: (context) => RefreshtokenBloc()),
        BlocProvider(create: (context)=> VerifypanBloc()),
        BlocProvider(create: (context)=>MobileagentBloc()),
        BlocProvider(create: (context)=>MobileotpverifyBloc()),
        BlocProvider(create: (context)=>AgentkycBloc()),
        BlocProvider(create: (context)=>AgentbusinessBloc()),
        BlocProvider(create: (context)=>PreviewdocumentBloc()),
        BlocProvider(create: (context)=>EsignBloc()),
        BlocProvider(create: (context)=>IfscBloc()),
        BlocProvider(create: (context)=>BankregstrationBloc()),
        BlocProvider(create: (context)=>SigninBloc()),

      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Splash_Screen()
      ),
    );
  }
}