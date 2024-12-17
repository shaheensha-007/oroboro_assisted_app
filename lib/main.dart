import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/AadhaarSendotp_bloc/aadhaarsendotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Aadhaarotpverification_bloc/aadhaarotpverification_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Aadhaaruploadfile_Blocs/Aadhaarfile_back_bloc/aadhaarfile_back_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Aadhaaruploadfile_Blocs/Aadhaarfile_front_blocs/aadhaarfile_front_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/CustomerSendotp_bloc/customersendotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/CustomerVerifiyotp_bloc/customerverifiyotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customer_Regsitration_bloc/customer_regsitration_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customercodecreate_bloc/customercodecreate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Emailupdate_bloc/emailupadate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Emicalculator_blocs/Emitenuresendotp_bloc/emitenuresendotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Emicalculator_blocs/Loanbooking_bloc/loanbooking_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Emicalculator_blocs/calculatoremi_bloc/calculatoremi_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/LoanEligable_blocs/Maxloancap_bloc/maxloan_cap_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/LoanEligable_blocs/loan_eligable_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Loanmessage_bloc/loanmessage_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Panverification_blocs/Cilbilscore_Bloc/cibilscore_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Panverification_blocs/Statecode_bloc/statecode_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Panverification_blocs/panverification_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Upadateaddress_bloc/upadateaddress_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/bank_verification_bloc/bank_update_bloc/bankupdate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/bank_verification_bloc/ifsc_verification_bloc/ifscverification_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/product_detalis_blocs/Productdetalis_bloc/productdetalis_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/product_detalis_blocs/productCollateral_blocs/productcollateral_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Forgotpassword_bloc/forgotpassword_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Restpassword_bloc/restpassword_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Userdetalis_bloc/userdetalis_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/refershtoken_bloc/refreshtoken_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/token_bloc/token_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Splansh_screen/Splansh_Screen.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'Blocs/Customeronbording_blocs/personalinformation_blocs/Co_borrower_Bloc/co_borrower_bloc.dart';
import 'Blocs/Customeronbording_blocs/personalinformation_blocs/Customerdocu_bloc/customerdocu_bloc.dart';
import 'Blocs/Customeronbording_blocs/personalinformation_blocs/Monthincome_bloc/monthincome_bloc.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
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
        BlocProvider(create: (context)=>Customeronbording2Bloc()),
        BlocProvider(create: (context) => CustomerupdatenextBloc()),
        BlocProvider(create: (context) => PanverificationBloc()),
        BlocProvider(create: (context)=> EmailupadateBloc()),
        BlocProvider(create: (context)=>StatecodeBloc()),
        BlocProvider(create: (context)=>UpadateaddressBloc()),
        BlocProvider(create: (context)=>CibilscoreBloc()),
        BlocProvider(create: (context)=>AadhaarsendotpBloc()),
        BlocProvider(create: (context)=>AadhaarotpverificationBloc()),
        BlocProvider(create: (context)=>AadhaarfileFrontBloc()),
        BlocProvider(create: (context)=>AadhaarfileBackBloc()),
        BlocProvider(create: (context)=>MonthincomeBloc()),
        BlocProvider(create: (context)=>CoBorrowerBloc()),
        BlocProvider(create: (context)=>IfscverificationBloc()),
        BlocProvider(create: (context)=>CustomerdocuBloc()),
        BlocProvider(create: (context)=>MaxloanCapBloc()),
        BlocProvider(create: (context)=>LoanEligableBloc()),
        BlocProvider(create: (context)=>ProductdetalisBloc()),
        BlocProvider(create: (context)=>ProductcollateralBloc()),
        BlocProvider(create: (context)=>CalculatoremiBloc()),
        BlocProvider(create: (context)=>EmitenuresendotpBloc()),
        BlocProvider(create: (context)=>BankupdateBloc()),
        BlocProvider(create: (context)=>LoanbookingBloc()),
        BlocProvider(create: (context)=>LoanmessageBloc())




      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          navigatorKey: NavigationService.navigatorKey,
          home: Splash_Screen()),
    );
  }
}
