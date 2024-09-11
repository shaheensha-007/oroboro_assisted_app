import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/CustomerSendotp_bloc/customersendotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customer_Regsitration_bloc/customer_regsitration_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/CustomercodeModel/CustomercodeModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/CustomerverifiyotpModel/CustomerVerifiyotpModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/customer_regsitrationModel/Customer_regsitrationModel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/CustomerVerifiyotp_bloc/customerverifiyotp_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Customercodecreate_bloc/customercodecreate_bloc.dart';
import '../apparbar/myappbar.dart';
import 'Customer_onbording_mobile.dart';

class Mobileotp extends StatefulWidget {
  const Mobileotp({super.key});

  @override
  State<Mobileotp> createState() => _MobileotpState();
}
late CustomerVerifiyotpModel isCustomerverifiy;
late CustomercodecreateModel isCustomercodecheck;
late Customer_regsitrationModel isCustomerregistration;
bool nextnavgation=false;
TextEditingController onbordingotp=TextEditingController();
class _MobileotpState extends State<Mobileotp> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const MyAppbar(),
      ),
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding:EdgeInsets.only(left: mwidth*0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                  height: mheight*0.1,
                ),
                  const Text("Mobile Verification",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: mheight*0.01,
                  ),
                  const Text(" Verify your mobile\n number",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                  SizedBox(
                    height: mheight*0.1,
                  ),
                  SizedBox(
                    width: mwidth*0.7,
                    child: Padding(
                      padding: EdgeInsets.only(left: mwidth*0.05),
                      child: BlocListener<CustomerverifiyotpBloc, CustomerverifiyotpState>(
  listener: (context, state) async{
    final preferences = await SharedPreferences.getInstance();
    if(state is CustomerverifiyotpblocLoading){
      CircularProgressIndicator();
    } if(state is CustomerverifiyotpblocLoaded){
      isCustomerverifiy=BlocProvider.of<CustomerverifiyotpBloc>(context).iscustomerverifiyotp;
      if(isCustomerverifiy.status.toString()=="Success"){
       BlocProvider.of<CustomercodecreateBloc>(context).add(FetchCustomercodecreate(userId: preferences.getString("Userid").toString(), data:onbordingmobile.text));
        setState(() {
          nextnavgation=true;
        });
        //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Panverfication()), (route) => false);
      }else{
        _showErrorSnackBar("Not verified");
      }
    }
    // TODO: implement listener
  },
  child: BlocListener<CustomercodecreateBloc, CustomercodecreateState>(
  listener: (context, state)async {
    final preferences = await SharedPreferences.getInstance();
    if(state is CustomercodecreateblocLoading){
      CircularProgressIndicator();
    }
    if(state is CustomercodecreateblocLoaded){
      isCustomercodecheck=BlocProvider.of<CustomercodecreateBloc>(context).iscreatecustomercode;
      if(isCustomercodecheck.status.toString()=="Success"){
        String customerco=isCustomercodecheck.result!.customerCodes!.first.customerCode.toString();
        preferences.setString("Customercode", customerco);
      }
    }
    // TODO: implement listener
  },
  child: PinCodeTextField(
                        controller:onbordingotp,
                        pinTheme: PinTheme(shape: PinCodeFieldShape.underline,inactiveColor: const Color(0xffC9D2EA),fieldWidth: mwidth*0.15,borderRadius: BorderRadius.circular(5)),
                        appContext: context,onSubmitted: (value){
                      },onCompleted: (value)async{
                       final preferences = await SharedPreferences.getInstance();
                       CircularProgressIndicator();
                       BlocProvider.of<CustomerverifiyotpBloc>(context).add(FetchCustomerVerifiyotp(userId: preferences.getString("Userid").toString(), mobilenumber:onbordingmobile.text, Mobilenumberotp:onbordingotp.text ));
                      },
                        length: 4,
                      ),
),
),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: mwidth*0.2),
                    child: Column(
                      children: [
                        const Text("Didn’t you  receive any code?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                        TextButton(onPressed: ()async{
                          final preferences = await SharedPreferences.getInstance();
                          BlocProvider.of<CustomersendotpBloc>(context).add(FetchCustomersendotp(userId: preferences.getString("Userid").toString(), mobilenumber: onbordingmobile.text));
                        }, child: const Text("Resend New Code",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFF7C00)),))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mheight*0.3,
                  ),
                  nextnavgation
                  ?
                  Padding(
                    padding:EdgeInsets.only(right: mwidth*0.1),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocListener<CustomerRegsitrationBloc, CustomerRegsitrationState>(
  listener: (context, state) {
    if(state is CustomerRegsitrationblocLoading){
      CircularProgressIndicator();
    } if(state is CustomerRegsitrationblocLoaded){
      isCustomerregistration= BlocProvider.of<CustomerRegsitrationBloc>(context).iscustomerregsitration;
    }
    // TODO: implement listener
  },
  child: TextButton(onPressed: ()async{
                          final preferences = await SharedPreferences.getInstance();
                          String? customerstatus = isCustomercodecheck.result?.customerCodes?.first?.status.toString();

                          if(customerstatus == 'true') {  // Compare the string value
                            BlocProvider.of<CustomeronbordingBloc>(context).add(
                              FetchCustomeronbording(
                                userid: preferences.getString("Userid").toString(),
                                Customercode: preferences.getString("Customercode").toString(),
                              ),
                            );
                          } else {
                            BlocProvider.of<CustomerRegsitrationBloc>(context).add(
                              FetchCustomerregistration(
                                userId: preferences.getString("Userid").toString(),
                                data: onbordingmobile.text,
                              ),
                            );
                          }

                        }, child: Text("Next>>>",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Color(0xff284389))),
                        ),
)
                      ],
                    ),
                  ):SizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 12, fontFamily: "font2"),
      ),
    ));
  }
}
