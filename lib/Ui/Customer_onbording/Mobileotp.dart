
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/CustomerSendotp_bloc/customersendotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customer_Regsitration_bloc/customer_regsitration_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/addhaar%20number.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/bank_detalis.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/loan_eligiblity_%20Approved.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/pan_verification.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/personal%20information.dart';
import 'package:oroboro_assisted_app/modeles/UserdetalisModel/UserdetalisModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingStatusModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/CustomercodeModel/CustomercodeModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/CustomerverifiyotpModel/CustomerVerifiyotpModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/customer_regsitrationModel/Customer_regsitrationModel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/CustomerVerifiyotp_bloc/customerverifiyotp_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Customercodecreate_bloc/customercodecreate_bloc.dart';
import '../../Blocs/Userdetalis_bloc/userdetalis_bloc.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import '../apparbar/myappbar.dart';

class Mobileotp extends StatefulWidget {
  const Mobileotp({super.key});

  @override
  State<Mobileotp> createState() => _MobileotpState();
}
late CustomerVerifiyotpModel isCustomerverifiy;
late CustomercodecreateModel isCustomercodecheck;
late Customer_regsitrationModel isCustomerregistration;
late CustomeronbordingstatusModel iscustomerstatuts;
late UpadatenextprocessModel isupadatenextprocess;
late UserdetalisModel isuserdetalis;
late CustomeronbordingstatusModel ismutiplestatus;
bool nextnavgation=false;
bool isLoading = false;
String? customercodeLook;
String? Customercoderegistration;
String? Partnercode;
String? Flowid;
String? Pageorder;
String? pagename;
TextEditingController onbordingotp=TextEditingController();
class _MobileotpState extends State<Mobileotp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onbordingotp=TextEditingController();
  }
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
        child: BlocListener<UserdetalisBloc, UserdetalisState>(
          listener: (context, state)async{
            final preferences = await SharedPreferences.getInstance();
            if(state is UserdetalisblocLoading){
              CircularProgressIndicator();
            }
            if(state is UserdetalisblocLoaded){
              isuserdetalis=BlocProvider.of<UserdetalisBloc>(context).isuser;
              Partnercode=isuserdetalis.result!.first.partnerCodes.toString();
              preferences.setString("partnercode",Partnercode.toString());
            }
            // TODO: implement listener
          },
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
                                BlocProvider.of<CustomercodecreateBloc>(context).add(FetchCustomercodecreate(userId: preferences.getString("Userid").toString(), data:preferences.getString("onbordingmobile").toString()));
                                BlocProvider.of<UserdetalisBloc>(context).add(FetchUserdetalis(userId:  preferences.getString("Userid").toString(), Identity:  preferences.getString("Userid").toString(),
                                )
                                );
                                setState(() {
                                  nextnavgation=true;
                                });
                              }else{
                                _showErrorSnackBar("Not verified");
                              }
                            }
                            // TODO: implement listener
                          },
                          child: BlocListener<CustomercodecreateBloc, CustomercodecreateState>(
                            listener: (context, state) {
                              if(state is CustomercodecreateblocLoading){
                                CircularProgressIndicator();
                              }
                              if(state is CustomercodecreateblocLoaded){
                                isCustomercodecheck=BlocProvider.of<CustomercodecreateBloc>(context).iscreatecustomercode;
                                if(isCustomercodecheck.status.toString()=="Success"){
                                  customercodeLook=isCustomercodecheck.result!.customerCodes!.first.customerCode.toString();

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
                              BlocProvider.of<CustomerverifiyotpBloc>(context).add(FetchCustomerVerifiyotp(userId: preferences.getString("Userid").toString(), mobilenumber:preferences.getString("onbordingmobile").toString(), Mobilenumberotp:onbordingotp.text ));
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
                            BlocProvider.of<CustomersendotpBloc>(context).add(FetchCustomersendotp(userId: preferences.getString("Userid").toString(), mobilenumber: preferences.getString("onbordingmobile").toString()));
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
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BlocListener<CustomerRegsitrationBloc, CustomerRegsitrationState>(
                              listener: (context, state) async {
                                if (state is CustomerRegsitrationblocLoading) {
                                  CircularProgressIndicator();
                                }
                                if (state is CustomerRegsitrationblocLoaded) {

                                  isCustomerregistration = BlocProvider.of<CustomerRegsitrationBloc>(context).iscustomerregsitration;
                                  if (isCustomerregistration.status.toString() == "Success") {
                                    Customercoderegistration = isCustomerregistration.result!.customerCode.toString();
                                  } else {
                                    _showErrorSnackBar(isCustomerregistration.errorMessage.toString());
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Mobileotp()));
                                    return; // Stop further execution on failure
                                  }
                                }
                              },
                              child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
                                listener: (context, state) async {
                                  if (state is CustomeronbordingblocLoading) {
                                    CircularProgressIndicator();
                                  }
                                  if (state is CustomeronbordingblocLoaded) {
                                    iscustomerstatuts = BlocProvider.of<CustomeronbordingBloc>(context).isCustomeronbording;
                                    if (iscustomerstatuts.status.toString() == "Success") {
                                      Pageorder = iscustomerstatuts.result!.pageOrder.toString();
                                      Flowid = iscustomerstatuts.result!.flowId.toString();
                                      pagename=iscustomerstatuts.result!.pageName.toString();
                                    } else {
                                      _showErrorSnackBar(iscustomerstatuts.errorMessage.toString());
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Mobileotp()));
                                      return; // Stop further execution on failure
                                    }
                                  }
                                },
                                child: BlocListener<CustomerupdateBloc, CustomerupdateState>(
                                  listener: (context, state) async {
                                    if (state is CustomerupdateblocLoading) {
                                      CircularProgressIndicator();
                                    }
                                    if (state is CustomerupadateblocLoaded) {
                                      isupadatenextprocess = BlocProvider.of<CustomerupdateBloc>(context).iscustomerupadate;
                                      if (isupadatenextprocess.status.toString() == "Success") {
                                        // Success, continue the flow
                                      } else {
                                        _showErrorSnackBar(isupadatenextprocess.errorMessage.toString());
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Mobileotp()));
                                        return; // Stop further execution on failure
                                      }
                                    }
                                  },
                                  child: TextButton(
                                    onPressed: () async {
                                      final preferences = await SharedPreferences.getInstance();
                                      bool apiErrorOccurred = false; // Flag to track errors
                                       setState(() {
                                         isLoading=true;
                                       });
                                      try {
                                        if (customercodeLook != null) {
                                          // Customer Onboarding Bloc
                                          try {
                                            await Future.delayed(const Duration(seconds: 2));
                                            BlocProvider.of<CustomeronbordingBloc>(context).add(
                                              FetchCustomeronbording(
                                                userid: preferences.getString("Userid").toString(),
                                                Customercode: customercodeLook.toString(),
                                              ),
                                            );
                                          } catch (e) {
                                            _showErrorSnackBar(e.toString());
                                            apiErrorOccurred = true; // Error encountered
                                            return; // Stop execution on error
                                          }

                                          // Customer Update Bloc
                                          if (!apiErrorOccurred) {
                                            try {
                                              await Future.delayed(const Duration(seconds: 2));
                                              BlocProvider.of<CustomerupdateBloc>(context).add(
                                                FetchCustomerupdate(
                                                  userid: preferences.getString("Userid").toString(),
                                                  Customercode: customercodeLook.toString(),
                                                  PartnerCode: Partnercode.toString(),
                                                  FlowId: Flowid.toString(),
                                                  PageOrder: Pageorder.toString(),
                                                ),
                                              );
                                            } catch (e) {
                                              _showErrorSnackBar(e.toString());
                                              apiErrorOccurred = true;
                                              return; // Stop execution on error
                                            }
                                          }

                                          // Final call if all succeed
                                          if (!apiErrorOccurred) {
                                            await Future.delayed(const Duration(seconds: 5));
                                            BlocProvider.of<CustomeronbordingBloc>(context).add(
                                              FetchCustomeronbording(
                                                userid: preferences.getString("Userid").toString(),
                                                Customercode: customercodeLook.toString(),
                                              ),
                                            );

                                          }

                                        } else {
                                          // Customer Registration Bloc
                                          try {
                                            await Future.delayed(const Duration(seconds: 2));
                                            BlocProvider.of<CustomerRegsitrationBloc>(context).add(
                                              FetchCustomerregistration(
                                                userId: preferences.getString("Userid").toString(),
                                                data: preferences.getString("onbordingmobile").toString(),
                                              ),
                                            );
                                          } catch (e) {
                                            _showErrorSnackBar(e.toString());
                                            apiErrorOccurred = true;
                                            return; // Stop execution on error
                                          }

                                          // Customer Onboarding Bloc
                                          if (!apiErrorOccurred) {
                                            try {
                                              await Future.delayed(const Duration(seconds: 2));
                                              BlocProvider.of<CustomeronbordingBloc>(context).add(
                                                FetchCustomeronbording(
                                                  userid: preferences.getString("Userid").toString(),
                                                  Customercode: Customercoderegistration.toString(),
                                                ),
                                              );
                                            } catch (e) {
                                              _showErrorSnackBar(e.toString());
                                              apiErrorOccurred = true;
                                              return; // Stop execution on error
                                            }
                                          }

                                          // Customer Update Bloc
                                          if (!apiErrorOccurred) {
                                            try {
                                              await Future.delayed(const Duration(seconds: 2));
                                              BlocProvider.of<CustomerupdateBloc>(context).add(
                                                FetchCustomerupdate(
                                                  userid: preferences.getString("Userid").toString(),
                                                  Customercode: Customercoderegistration.toString(),
                                                  PartnerCode: Partnercode.toString(),
                                                  FlowId: Flowid.toString(),
                                                  PageOrder: Pageorder.toString(),
                                                ),
                                              );
                                            } catch (e) {
                                              _showErrorSnackBar(e.toString());
                                              apiErrorOccurred = true;
                                              return; // Stop execution on error
                                            }
                                          }
                                        }

                                        // Save SharedPreferences if no errors
                                        if (!apiErrorOccurred) {
                                          await Future.delayed(
                                              const Duration(seconds: 5));
                                          if (customercodeLook != null &&
                                              Customercoderegistration !=
                                                  null) {
                                            preferences.setString(
                                                "CustomerCode",
                                                customercodeLook.toString());
                                          } else if (customercodeLook != null) {
                                            preferences.setString(
                                                "CustomerCode",
                                                customercodeLook.toString());
                                          } else if (Customercoderegistration !=
                                              null) {
                                            preferences.setString(
                                                "CustomerCode",
                                                Customercoderegistration
                                                    .toString());
                                          }

                                          switch (pagename) {
                                            case"CustomerRegistration":
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Panverfication())).then((value) => setState(() {
                                                onbordingotp.dispose();
                                              }));
                                              break;
                                            case"AadhaarIdentityAuthentication" :
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Aadhaarnumber()));
                                              break;
                                            case"BusinessRegistration" :
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Personal_information()));
                                              break;
                                            case"KYC_REGISTRATION":
                                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Loan_eligibility_Approved()));
                                               break;
                                            case"FinancialAnalysis":
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bank_details()));
                                              break;
                                            case "ReviewPortal":
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Loan_eligibility_Approved()));
                                          }
                                        }
                                      } catch (error) {
                                        setState(() {
                                          isLoading=false;
                                        });
                                        _showErrorSnackBar(error.toString());
                                      }
                                    },
                                    child: Text(
                                      "Next>>>",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xff284389)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                    ):SizedBox(),
                  ],
                ),
              )
            ],
          ),
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
@override
  void dispose() {
  onbordingotp.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}