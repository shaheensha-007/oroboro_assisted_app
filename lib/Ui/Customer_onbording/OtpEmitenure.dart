import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/bank_detalis.dart';
import 'package:oroboro_assisted_app/modeles/EmicalculatorModels/LoanbookingModel/LoanbookingModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/CustomerVerifiyotp_bloc/customerverifiyotp_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Emicalculator_blocs/Loanbooking_bloc/loanbooking_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';

class OtpEmitenure extends StatefulWidget {
  const OtpEmitenure({super.key});

  @override
  State<OtpEmitenure> createState() => _OtpEmitenureState();
}
LoanbookingModel? Loanbookingdata;
CustomeronbordingstatusModel? Emicustomeronbording;
UpadatenextprocessModel? emiupadatenextprocessModel;
Customeronbording2Model? emiCustomeronbording2;




TextEditingController Emitenureotp=TextEditingController();
bool emiisLoading=false;
bool Eminextprocess=false;

int?emiPageorder;

String?emipagename;
class _OtpEmitenureState extends State<OtpEmitenure> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Emitenureotp = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding:EdgeInsets.only(left: 50.rw(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:  150.rh(context),
                  ),
                  Text("Mobile Verification",style: TextStyle(fontSize: 28.rf(context),
                      fontFamily: "boldtext",
                      fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: 30.rh(context)
                  ),
                  Text(" Verify your mobile\n number",style: TextStyle(fontSize: 22.rf(context),
                      fontWeight: FontWeight.w200,
                      fontFamily: "regulartext"),),
                  SizedBox(
                    height: 80.rh(context)
                  ),
                  SizedBox(
                    width: 260.rw(context),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.rw(context)),
                      child: BlocListener<CustomerverifiyotpBloc, CustomerverifiyotpState>(
                            listener: (context, state) {
                              if(state is CustomerverifiyotpblocLoading){
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return const Center(
                                        child:
                                        CircularProgressIndicator());
                                  },
                                );
                              }
                              if(state is CustomerverifiyotpblocLoaded){
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                final Emiverifiy=state.customerVerifiyotpModel;
                                if(Emiverifiy.status=="Success"){
                                  _showErrorSnackBar(Emiverifiy.responseMessage.toString());
                                  setState(() {
                                    Eminextprocess=true;
                                  });
                                }
                              }if(state is CustomerverifiyotpblocError){
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                             _showErrorSnackBar(state.Errormessage);
                              }
                        // TODO: implement listener
                         },
                         child: PinCodeTextField(
                        controller:Emitenureotp,
                        pinTheme: PinTheme(shape: PinCodeFieldShape.underline,inactiveColor: Color(0xffC9D2EA),fieldWidth: 50.rw(context),borderRadius: BorderRadius.circular(5)),
                        appContext: context,onSubmitted: (value){
                      },onCompleted: (vale)async{
                           final preferences = await SharedPreferences.getInstance();
                           BlocProvider.of<CustomerverifiyotpBloc>(context).add(FetchCustomerVerifiyotp(
                               userId: preferences.getString("Userid").toString(),
                               mobilenumber: preferences.getString("onbordingmobile").toString(),
                               Mobilenumberotp: Emitenureotp.text,
                               ctx: context));
                      },
                        length: 4,
                      ),
        ),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: 10.rw(context)),
                    child: Column(
                      children: [
                        Text("Didn’t you  receive any code?",style: TextStyle(fontSize: 20.rf(context),
                            fontFamily: "regulartext"),),
                        TextButton(onPressed: (){}, child: Text("Resend New Code",style: TextStyle( fontSize: 20.rf(context),
                            fontFamily: "regulartext",
                            color: Color(0xffFF7C00)),))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200.rh(context),
                  ),
                  Eminextprocess
                 ? Padding(
                    padding:
                    EdgeInsets.only(right: 30.rw(context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BlocListener<LoanbookingBloc, LoanbookingState>(
                        listener: (context, state)async {
                          final preferences = await SharedPreferences
                              .getInstance();
                          if (state is LoanbookingblocLoading) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const Center(
                                    child:
                                    CircularProgressIndicator());
                              },
                            );
                          }
                          if (state is LoanbookingblocLoaded) {
                            Navigator.of(context, rootNavigator: true)
                                .pop();
                             Loanbookingdata = state.loanbookingModel;
                            if (Loanbookingdata?.status == "Success") {

                              final loanid = Loanbookingdata?.result?.loanID??"";
                              preferences.setString("LoanId", loanid);
                              ///Customeronbording Apies
                              BlocProvider.of<CustomeronbordingBloc>(context).add(FetchCustomeronbording(
                                  userid: preferences.getString("Userid").toString(),
                                  Customercode: preferences.getString("CustomerCode").toString(),
                                  partnercode: preferences.getString("partnercode").toString(),
                                  agentcode: preferences.getString("agentcode").toString(),
                                  ctx: context));
                            }
                          }
                          if(state is LoanbookingblocError){
                            Navigator.of(context, rootNavigator: true).pop();
                            _showErrorSnackBar(state.Errormessage);
                          }
                        },
                      child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
                      listener: (context, state) async{
                        final preferences = await SharedPreferences.getInstance();
                        if(state is CustomeronbordingblocLoading){
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return const Center(
                                  child:
                                  CircularProgressIndicator());
                            },
                          );
                        }

                        if(state is CustomeronbordingblocLoaded){
                          Navigator.of(context, rootNavigator: true)
                              .pop();
                           Emicustomeronbording=state.customeronbordingstatusModel;
                          if(Emicustomeronbording?.status=="Success"){
                            emiPageorder=Emicustomeronbording?.result?.pageOrder;
                            ///CustomerupdatecustomerApi
                            BlocProvider.of<CustomerupdatenextBloc>(context).add(FetchCustomerupdate(
                                userid: preferences.getString("Userid").toString(),
                                Customercode: preferences.getString("CustomerCode").toString(),
                                PartnerCode: preferences.getString("partnercode").toString(),
                                FlowId: preferences.getString("Flowid")??"",
                                PageOrder: emiPageorder.toString(),
                                ApplicationId: preferences.getString("applicationid").toString(),
                                PageType: preferences.getString("pagetype")??"",
                                ctx: context));
                          }

                        }
                        if(state is CustomeronbordingblocError){
                          Navigator.of(context, rootNavigator: true)
                              .pop();
                          _showErrorSnackBar(state.Errormessage);
                        }
                         // TODO: implement listener
                          },
                           child: BlocListener<CustomerupdatenextBloc, CustomerupdatenextState>(
                            listener: (context, state) async{
                              log("Customer Customerupdate state => $state");
                              final preferences = await SharedPreferences.getInstance();
                              if(state is CustomerupdatenextblocLoading){
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return const Center(
                                        child:
                                        CircularProgressIndicator());
                                  },
                                );
                              }
                              if(state is CustomerupdatenextblocLoaded){
                                Navigator.of(context, rootNavigator: true).pop();
                                emiupadatenextprocessModel=state.upadatenextprocessModel;
                                if(emiupadatenextprocessModel?.status=="Success"){
                                  BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
                                      userid: preferences.getString("Userid").toString(),
                                      Customercode: preferences.getString("CustomerCode").toString(),
                                      partnercode: preferences.getString("partnercode").toString(),
                                      agentcode: preferences.getString("agentcode").toString(),
                                      ctx: context));
                                }
                              }

                              if(state is CustomerupdatenextblocError){
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                                _showErrorSnackBar(state.Errormessage);
                              }
                              },
                               child: BlocListener<Customeronbording2Bloc, Customeronbording2State>(
                                listener: (context, state) {
                                  if(state is Customeronbording2blocLoading){
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return const Center(
                                            child:
                                            CircularProgressIndicator());
                                      },
                                    );
                                  } else {
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  }
                                  if(state is Customeronbording2blocLoaded){
                                     emiCustomeronbording2=state.customeronbording2model;
                                    if(emiCustomeronbording2?.status=="Success"){
                                      emipagename=emiCustomeronbording2?.result!.pageName.toString();
                                      if(emipagename=="BankDetails"){
                                        NavigationService.pushAndRemoveUntil(Bank_details(), (Route<dynamic>route) => false);
                                      }else{
                                        _showErrorSnackBar("Not Fetch page");
                                      }
                                    }
                                  }
                                  if(state is Customeronbording2blocError){
                                    _showErrorSnackBar(state.Errormessage);
                                  }
                                    },
                             child: TextButton(
                                 onPressed: () async {
                              final preferences = await SharedPreferences.getInstance();
                              BlocProvider.of<LoanbookingBloc>(context).add(FetchLoanbooking(
                                  userid:preferences.getString("Userid").toString() ,
                                  Customercode: preferences.getString("CustomerCode").toString(),
                                  ApplicationId:  preferences.getString("applicationid").toString(),
                                  partnercode: preferences.getString("partnercode").toString(),
                                  agentcode: preferences.getString("agentcode").toString(),
                                  ProductId: preferences.getString("Emiproductid").toString(),
                                  Tenure:preferences.getString("tenurevalue").toString() ,
                                  EmiAmount: preferences.getString("Emimonuthly").toString(),
                                  Frequency: preferences.getString("frequency").toString(),
                                  Loanamout: preferences.getString("loanamout").toString(),
                                  ctx: context));
                                                         },
                                                         child: Text(
                              "Next>>>>",
                              style: TextStyle(
                                  fontSize:
                                  20.rf(context),
                                  fontFamily:
                                  "regulartext"),
                                                         )),
),
),
),
),
                ],
              ),
        
            ):SizedBox(),
          ],
        ),
            )
            ]
            ),
      )
    );
  }
  void _showErrorSnackBar(String message) {
    // Check if the widget is still mounted before showing the dialog
    if (!mounted) return;

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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
