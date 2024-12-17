import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/personal%20information.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/AadhaarSendotp_bloc/aadhaarsendotp_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Aadhaarotpverification_bloc/aadhaarotpverification_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../main.dart';
import '../../modeles/customeronboradingModel/AadhaarOtpVerificationModel/AadhaarOtpVerificationModel.dart';
import 'aadhar upload.dart';
import 'addhaar number.dart';

class AaadharOtp extends StatefulWidget {
  const AaadharOtp({super.key,});
  @override
  State<AaadharOtp> createState() => _AaadharOtpState();
}

AadhaarOtpVerificationModel? isotpaadhaarverification;
TextEditingController aadhaarOtp = TextEditingController();
bool isLoading=false;
bool Aadhaarshow = false;
bool nextaadhaar = false;
String? Flowid3;
String? Pageorder3;
String? pagetype3;
String?pagename3;

class _AaadharOtpState extends State<AaadharOtp> {
  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context).add(FetchMerchartToken(
        userName: "Test", password: tokenpassword, ctx: context));
    aadhaarOtp.text="";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const Aadhaarnumber()),
                      (route) => false);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
        ])),
        body: SingleChildScrollView(
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(left: 30.rw(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120.rh(context),
                  ),
                   Text(
                    "Aadhaar Verification ",
                    style: TextStyle(
                        fontSize: 28.rf(context),
                        fontFamily: "boldtext"),
                  ),
                  SizedBox(
                    height: 10.rh(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.rw(context)),
                    child:  Text(
                      "Verify your Aadhaar number",
                      style: TextStyle(
                          fontSize: 20.rf(context),
                          fontFamily: "regulartext"),
                    ),
                  ),
                  SizedBox(
                    height: 50.rh(context),
                  ),
                  SizedBox(
                    width: 300.rw(context),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.rw(context)),
                      child: BlocListener<AadhaarotpverificationBloc,
                              AadhaarotpverificationState>(
                          listener: (context, state) {
                            if (state is AadhaarotpverificationblocLoading) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );
                            } else {
                            Navigator.of(context).pop();
                             }
                            if (state is AadhaarotpvetrificationblocLoaded) {
                              isotpaadhaarverification =state.aadhaarOtpVerificationModel;
                              if (isotpaadhaarverification?.status.toString() == "Success") {
                                setState(() {
                                  nextaadhaar = true;
                                });
                              }
                            }
                            if(state is AadhaarotpverificationblocError){
                              _showErrorSnackBar(state.Errormessage);
                              setState(() {
                                Aadhaarshow = true;
                              });
                            }
                            // TODO: implement listener
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: PinCodeTextField(
                                  controller: aadhaarOtp,
                                  appContext: context,
                                  length: 6,
                                  onChanged:
                                      (value) {}, // Optional: Action on text change
                                  onCompleted: (value) async {
                                    final preferences =
                                        await SharedPreferences.getInstance();
                                    BlocProvider.of<AadhaarotpverificationBloc>(
                                            context)
                                        .add(
                                      FetchAadhaarotpverification(
                                        userId:
                                            preferences.getString("Userid") ??
                                                '',
                                        Customercode: preferences
                                                .getString("CustomerCode") ??
                                            '',
                                        Aadhaarotp: aadhaarOtp.text,
                                        Requestid: preferences.getString("Requestid").toString(),
                                        applicationId: preferences
                                            .getString("applicationid")
                                            .toString(),
                                        ctx: context,
                                      ),
                                    );
                                  },
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.underline,
                                    inactiveColor: const Color(0xffC9D2EA),
                                    fieldWidth:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    height:30.rh(context),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 40.rw(context)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              "Didn’t you  receive any code?",
                              style: TextStyle(
                                  fontSize: 20.rf(context),
                                  fontFamily: "regulartext"),
                            ),
                            BlocListener<AadhaarsendotpBloc, AadhaarsendotpState>(
                              listener: (context, state)async {
                                if(state is AadhaarSendotpblocLoading){
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
                                if(state is AadhaarSendOtpblocLoaded){
                                  final preferences = await SharedPreferences.getInstance();
                                  final Aaadhaarotpresend=BlocProvider.of<AadhaarsendotpBloc>(context).isaadhaarsendotp;
                                  if(Aaadhaarotpresend.status=="Success"){
                                    final requestidotp=Aaadhaarotpresend.result!.requestId.toString();
                                    preferences.setString("Requestid", requestidotp);
                                  }
                                }
                              // TODO: implement listener
                               },
                                 child: TextButton(
                                onPressed: ()async {
                                  final preferences =
                                  await SharedPreferences.getInstance();
                                  BlocProvider.of<AadhaarsendotpBloc>(context)
                                      .add(FetchAadhaarsendotp(
                                    userId: preferences
                                        .getString("Userid")
                                        .toString(),
                                    Customercode: preferences
                                        .getString("CustomerCode")
                                        .toString(),
                                    Aadhaar: aadhaarnumber.text,
                                    applicationId: preferences
                                        .getString("applicationid")
                                        .toString(),
                                    ctx: context,
                                  ));
                                },
                                child:  Text(
                                  "Resend New Code",
                                  style: TextStyle(
                                      fontSize: 20.rf(context),
                                      fontFamily: "regulartext",
                                      color: Color(0xffFF7C00)),
                                )),
),
                            SizedBox(
                              height: 10.rh(context),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return SizeTransition(
                                  sizeFactor: animation,
                                  axisAlignment: 1.0,
                                  child: child,
                                );
                              },
                              child: Aadhaarshow
                                  ? Center(
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Aadhaarupload()),
                                                    (route) => false);
                                          },
                                          child: Text(
                                              "Aadhaar  not linked with Mobile number ?",
                                              style: TextStyle(
                                                  fontSize: 12.rf(context),
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: "regulartext",
                                                  color: Color(0xffFC9738)))),
                                    )
                                  : SizedBox(),
                            ),
                            SizedBox(
                              height:200.rh(context) ,
                            ),
                            nextaadhaar
                                ?Padding(
                                    padding:
                                        EdgeInsets.only(right: 5 .rw(context)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        BlocListener<CustomeronbordingBloc,
                                            CustomeronbordingState>(
                                          listener: (context, state) async {
                                            final preferences = await SharedPreferences.getInstance();
                                            if (state is CustomeronbordingblocLoading) {
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
                                            if (state is CustomeronbordingblocLoaded) {
                                             final iscustomerstatuts = BlocProvider.of<CustomeronbordingBloc>(context).isCustomeronbording;
                                              if (iscustomerstatuts.status.toString() == "Success") {
                                                Pageorder3 = iscustomerstatuts.result!.pageOrder.toString();

                                                BlocProvider.of<CustomerupdatenextBloc>(context).add(FetchCustomerupdate(
                                                  userid: preferences.getString("Userid") ?? "",
                                                  Customercode: preferences.getString("CustomerCode") ?? "",
                                                  PartnerCode: preferences.getString("partnercode") ?? "",
                                                  FlowId: preferences.getString("Flowid")??"",
                                                  PageOrder: Pageorder3.toString(),
                                                  ApplicationId: preferences.getString("applicationid") ?? "",
                                                  PageType: preferences.getString("pagetype")??"",
                                                  ctx: context,
                                                ));
                                              } else
                                                _showErrorSnackBar(
                                                    iscustomerstatuts.errorMessage.toString());
                                             // NavigationService.pushAndRemoveUntil(AaadharOtp(Requestid: Requestid), (Route<dynamic>route) => false);
                                            }
                                            // TODO: implement listener
                                          },
                                          child: BlocListener<CustomerupdatenextBloc, CustomerupdatenextState>(
                                            listener: (context, state)async {
                                              final preferences = await SharedPreferences.getInstance();
                                              if (state is CustomerupdatenextblocLoading) {
                                                CircularProgressIndicator();
                                              }
                                              if (state is CustomerupdatenextblocLoaded) {
                                               final isupadatenextprocess = BlocProvider.of<CustomerupdatenextBloc>(context).iscustomerupadate;
                                                if (isupadatenextprocess.status.toString() == "Success") {
                                                  BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
                                                    userid: preferences.getString("Userid") ?? "",
                                                    Customercode: preferences.getString("CustomerCode") ?? "",
                                                    partnercode: preferences.getString("partnercode") ?? "",
                                                    agentcode: preferences.getString("agentcode") ?? "",
                                                    ctx: context,
                                                  ));

                                                }else{
                                                  _showErrorSnackBar(isupadatenextprocess.responseMessage.toString());
                                                }
                                              }
                                              // TODO: implement listener
                                            },
                                            child: BlocListener<Customeronbording2Bloc, Customeronbording2State>(
                                             listener: (context, state)async {
                                               if(state is Customeronbording2blocLoading){
                                                 CircularProgressIndicator();
                                               }
                                               if(state  is Customeronbording2blocLoaded){
                                                 final Customeronbordingvalue=BlocProvider.of<Customeronbording2Bloc>(context).iscustomeronbordingstatusModel2;
                                                 if(Customeronbordingvalue.status.toString()=="Success"){
                                                   pagename3=Customeronbordingvalue.result!.pageName.toString();
                                                   if(pagename3=="PersonalInfo"){
                                                   NavigationService.pushAndRemoveUntil(Personal_information(), (Route<dynamic>route) => false);
                                                   }else{
                                                     _showErrorSnackBar("not page not allowed");
                                                   }
                                                 }
                                               }
                                              // TODO: implement listener
                                               },
                                                child: TextButton(
                                              onPressed: () async {
                                                final preferences = await SharedPreferences.getInstance();
                                                BlocProvider.of<CustomeronbordingBloc>(context).add(FetchCustomeronbording(
                                                  userid: preferences.getString("Userid") ?? "",
                                                  Customercode: preferences.getString("CustomerCode") ?? "",
                                                  partnercode: preferences.getString("partnercode") ?? "",
                                                  agentcode: preferences.getString("agentcode") ?? "",
                                                  ctx: context,
                                                ));
                                              },
                                              child: Text(
                                                "Next>>>",
                                                style: TextStyle(
                                                    fontSize:
                                                    20.rf(context),
                                                    fontFamily:
                                                    "regulartext"),
                                              ),
                                            ),
),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          ]))
                ],
              ),
            )
          ]),
        ));
  }

  void _showErrorSnackBar(String message) {
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
                ), // Add spacing between text and button
              ],
            ),
          ),
        );
      },
    );
  }
  void adhaarnumberOtpstated() async {
    final preferences = await SharedPreferences.getInstance();

    setState(() {
      isLoading = true; // Show loading indicator
    });
      Future.delayed(Duration(seconds: 2), () {
        BlocProvider.of<CustomeronbordingBloc>(context).add(FetchCustomeronbording(
          userid: preferences.getString("Userid") ?? "",
          Customercode: preferences.getString("CustomerCode") ?? "",
          partnercode: preferences.getString("partnercode") ?? "",
          agentcode: preferences.getString("agentcode") ?? "",
          ctx: context,
        ));
      }).then((_) {
        Future.delayed(Duration(seconds: 2), () {
          BlocProvider.of<CustomerupdatenextBloc>(context).add(FetchCustomerupdate(
            userid: preferences.getString("Userid") ?? "",
            Customercode: preferences.getString("CustomerCode") ?? "",
            PartnerCode: preferences.getString("partnercode") ?? "",
            FlowId: Flowid3.toString(),
            PageOrder: Pageorder3.toString(),
            ApplicationId: preferences.getString("applicationid") ?? "",
            PageType: pagetype3.toString(),
            ctx: context,
          ));
        }).then((_) {
          Future.delayed(Duration(seconds: 2), () {
            BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
              userid: preferences.getString("Userid") ?? "",
              Customercode: preferences.getString("CustomerCode") ?? "",
              partnercode: preferences.getString("partnercode") ?? "",
              agentcode: preferences.getString("agentcode") ?? "",
              ctx: context,
            ));
          }).whenComplete(() {
            setState(() {
              isLoading = false; // Hide loading indicator
            });
          });
        });
      });

  }
}
