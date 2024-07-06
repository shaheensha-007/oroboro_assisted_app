import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Apis/refreshtokenApi/refreshtokenApi.dart';
import 'package:oroboro_assisted_app/Blocs/refershtoken_bloc/refreshtoken_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/token_bloc/token_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/vetrifypan_bloc/verifypan_bloc.dart';
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
        BlocProvider(
          create: (context) => TokenBloc(),
        ),
        BlocProvider(
          create: (context) => RefreshtokenBloc(),
        ),
        BlocProvider(create: (context)=> VerifypanBloc(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Splash_Screen()
      ),
    );
  }
}