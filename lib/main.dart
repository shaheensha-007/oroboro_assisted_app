import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Apis/refreshtokenApi/refreshtokenApi.dart';
import 'package:oroboro_assisted_app/Blocs/%20Mobileagent_bloc/mobileagent_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/AgentKyc_bloc/agentkyc_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Agentbusiness_bloc/agentbusiness_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Esign_bloc/esign_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Ifsc_bloc/ifsc_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/MobileotpVerify_bloc/mobileotpverify_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/refershtoken_bloc/refreshtoken_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/token_bloc/token_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/vetrifypan_bloc/verifypan_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Signin/signin_page.dart';
import 'package:oroboro_assisted_app/Ui/Signup/Draw_in_signature.dart';
import 'Blocs/previewdocuments_bloc/previewdocument_bloc.dart';
import 'Ui/Splansh_screen/Splansh_Screen.dart';

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
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Signin_page()
      ),
    );
  }
}