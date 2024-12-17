import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/pan_verification.dart';
import 'package:oroboro_assisted_app/modeles/UserdetalisModel/UserdetalisModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/customer_regsitrationModel/Customer_regsitrationModel.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/CustomerSendotp_bloc/customersendotp_bloc.dart';
import '../../Blocs/Customeronbording_blocs/CustomerVerifiyotp_bloc/customerverifiyotp_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Customer_Regsitration_bloc/customer_regsitration_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Customercodecreate_bloc/customercodecreate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../Blocs/Userdetalis_bloc/userdetalis_bloc.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import '../../modeles/customeronboradingModel/CustomercodeModel/CustomercodeModel.dart';
import 'Customercodelistview.dart';

class Mobileotp extends StatefulWidget {
  const Mobileotp({super.key});

  @override
  State<Mobileotp> createState() => _MobileotpState();
}

CustomercodecreateModel? Customercodecheck;
UserdetalisModel? isuserdetalisModel;
CustomerRegsitrationModel? isRegistrationcutomer;
CustomeronbordingstatusModel? iscustomeronbordingstatus;
UpadatenextprocessModel? iscustomerupdate;
Customeronbording2Model? customerondingsvalue;

///modelclasss

bool nextnavgation = false;
bool isLoading = false;
bool isProcessing = false;
String? customercodeLook;
String? pannumberCustomer;
List<String> twoList = [];
String? Customercoderegistration;
String? Applicationid;
String? Agentcode;
String? Flowid;
int? Pageorder;
String? pagename;
String? pagetype;
String partnerCodes = "";
List<String> selectedCodes = [];

class _MobileotpState extends State<Mobileotp> {
  TextEditingController onbordingotp = TextEditingController();

  @override
  void initState() {
    super.initState();
    Fetchuserdetalis();

    onbordingotp = TextEditingController();
  }

  void Fetchuserdetalis() async {
    await Future.delayed(Duration(seconds: 5));
    final preferences = await SharedPreferences.getInstance();
    BlocProvider.of<UserdetalisBloc>(context).add(FetchUserdetalis(
        userId: preferences.getString("Userid").toString(),
        Identity: preferences.getString("Userid").toString(),
        ctx: context));
  }

  final GlobalKey<FormState> mobileverifykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 50.rw(context)),
                child: BlocListener<UserdetalisBloc, UserdetalisState>(
                    listener: (context, state) async {
                      final preferences = await SharedPreferences.getInstance();
                      if (state is UserdetalisblocLoading) {
                        CircularProgressIndicator();
                      }
                      if (state is UserdetalisblocLoaded) {
                        isuserdetalisModel =state.userdetalisModel;
                        partnerCodes = isuserdetalisModel
                                ?.result?.firstOrNull?.partnerCodes ??
                            "";
                        Agentcode = isuserdetalisModel
                            ?.result?.firstOrNull?.agentCode
                            .toString();
                        print("the value is ${partnerCodes}");
                        // Save the formatted partner code in SharedPreferences
                        preferences.setString(
                            "partnercode", partnerCodes.toString());
                        preferences.setString(
                            "agentcode", Agentcode.toString());
                      }

                      // TODO: implement listener
                    },
                    child: Form(
                      key: mobileverifykey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 200.rh(context),
                            ),
                            Text(
                              "Mobile Verification",
                              style: TextStyle(
                                  fontSize: 28.rf(context),
                                  fontFamily: "boldtext",
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 30.rh(context),
                            ),
                            Text(
                              " Verify your mobile\n number",
                              style: TextStyle(
                                  fontSize: 22.rf(context),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "regulartext"),
                            ),
                            SizedBox(
                              height: 80.rh(context),
                            ),
                            SizedBox(
                              width: 260.rw(context),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.rw(context)),
                                child: BlocListener<CustomerverifiyotpBloc,
                                    CustomerverifiyotpState>(
                                  listener: (context, state) async {
                                    final preferences =
                                        await SharedPreferences.getInstance();
                                    if (state
                                        is CustomerverifiyotpblocLoading) {
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
                                    if (state is CustomerverifiyotpblocLoaded) {
                                      Navigator.of(context, rootNavigator: true).pop();
                                      final verifiyotp = state.customerVerifiyotpModel;
                                      if (verifiyotp.status.toString() ==
                                          "Success") {
                                        BlocProvider.of<CustomercodecreateBloc>(
                                                context)
                                            .add(FetchCustomercodecreate(
                                                userId: preferences
                                                    .getString("Userid")
                                                    .toString(),
                                                data: preferences
                                                    .getString(
                                                        "onbordingmobile")
                                                    .toString(),
                                                ctx: context));
                                      }
                                    }
                                    if(state is CustomerverifiyotpblocError){
                                      _showErrorSnackBar(state.Errormessage);
                                    }

                                    // TODO: implement listener
                                  },
                                  child: BlocListener<CustomercodecreateBloc,
                                      CustomercodecreateState>(
                                    listener: (context, state) {
                                      log("customer code state => $state");
                                      if (state is CustomercodecreateblocLoading) {
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
                                      if (state is CustomercodecreateblocLoaded) {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        final Customercodecheck =state.customercodecreateModel;
                                        if (Customercodecheck.status
                                                .toString() ==
                                            "Success") {
                                          List<String> customerCodes1 =
                                              Customercodecheck
                                                  .result!.customerCodes!
                                                  .map((code) => code
                                                      .customerCode
                                                      .toString())
                                                  .toList();

                                          ///the customer code List
                                          List<String> Pancustomer =
                                              Customercodecheck
                                                  .result!.customerCodes!
                                                  .map((pan) =>
                                                      pan.pan.toString())
                                                  .toList();

                                          /// the Pannumber List
                                          //// check the pan and Customer code is empty or null
                                          setState(() {
                                            nextnavgation = false;
                                          });
                                          if (customerCodes1.isNotEmpty ||
                                              Pancustomer.isNotEmpty) {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return CustomerDialogContent(
                                                  customerCodes: customerCodes1,
                                                  panNumbers: Pancustomer,
                                                );
                                              },
                                            );
                                          }
                                        } else {
                                          // _showErrorSnackBar(Customercodecheck
                                          //     .responseMessage
                                          //     .toString());
                                          // setState(() {
                                          //   nextnavgation = true;
                                          // });
                                          // log("next navigation => $nextnavgation");
                                        }
                                      }
                                      if (state is CustomerCodecreateblocError) {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        _showErrorSnackBar(state.Errormessage);
                                        setState(() {
                                          nextnavgation = true;
                                        });
                                        log("next navigation => $nextnavgation");
                                      }
                                    },
                                    // TODO: implement listener
                                    child: PinCodeTextField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please enter OTP ";
                                        }
                                        return null;
                                      },
                                      controller: onbordingotp,
                                      keyboardType: TextInputType.number,
                                      pinTheme: PinTheme(
                                          shape: PinCodeFieldShape.underline,
                                          inactiveColor: Color(0xffC9D2EA),
                                          fieldWidth: 50.rw(context),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      appContext: context,
                                      onSubmitted: (value) {},
                                      onCompleted: (vale) async {
                                        final preferences =
                                            await SharedPreferences
                                                .getInstance();
                                        BlocProvider.of<CustomerverifiyotpBloc>(
                                                context)
                                            .add(FetchCustomerVerifiyotp(
                                                userId: preferences
                                                    .getString("Userid")
                                                    .toString(),
                                                mobilenumber: preferences
                                                    .getString(
                                                        "onbordingmobile")
                                                    .toString(),
                                                Mobilenumberotp:
                                                    onbordingotp.text,
                                                ctx: context));
                                      },
                                      length: 4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.rw(context)),
                              child: Column(
                                children: [
                                  Text(
                                    "Didn’t you  receive any code?",
                                    style: TextStyle(
                                        fontSize: 20.rf(context),
                                        fontFamily: "regulartext"),
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        final preferences =
                                            await SharedPreferences
                                                .getInstance();
                                        BlocProvider.of<CustomersendotpBloc>(
                                                context)
                                            .add(FetchCustomersendotp(
                                                userId: preferences
                                                    .getString("Userid")
                                                    .toString(),
                                                mobilenumber: preferences
                                                    .getString(
                                                        "onbordingmobile")
                                                    .toString(),
                                                ctx: context));
                                      },
                                      child: Text(
                                        "Resend New Code",
                                        style: TextStyle(
                                            fontSize: 20.rf(context),
                                            fontFamily: "regulartext",
                                            color: Color(0xffFF7C00)),
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 200.rh(context),
                            ),
                            nextnavgation
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(right: 30.rw(context)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        BlocListener<CustomerRegsitrationBloc,
                                            CustomerRegsitrationState>(
                                          listener: (context, state) async {
                                            log("Customer registration state => $state");
                                            final preferences = await SharedPreferences.getInstance();
                                            if (state is CustomerRegsitrationblocLoading) {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder:
                                                    (BuildContext context) {
                                                  return const Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                },
                                              );
                                            }
                                            if (state is CustomerRegsitrationblocLoaded) {
                                              Navigator.of(context, rootNavigator: true).pop();
                                              isRegistrationcutomer = state.customerRegistrationStatus;
                                              if (isRegistrationcutomer?.status.toString() == "Success") {
                                                final preferences = await SharedPreferences.getInstance();
                                                String customerCode1 = isRegistrationcutomer?.result?.customerCode??"";
                                                print(customerCode1);
                                                await preferences.setString("CustomerCode", customerCode1);
                                                print("shaheen customer vidailla ${preferences.getString("CustomerCode").toString()}");
                                                String applicationId1 =
                                                isRegistrationcutomer?.result?.applicationId??"";
                                                preferences.setString("applicationid", applicationId1);

                                                ///CustomeronbordingBloc call
                                                BlocProvider.of<CustomeronbordingBloc>(context).add(
                                                  FetchCustomeronbording(
                                                    userid: preferences
                                                        .getString("Userid")
                                                        .toString(),
                                                    Customercode: preferences
                                                        .getString(
                                                            "CustomerCode")
                                                        .toString(),
                                                    partnercode:
                                                        preferences.getString(
                                                                "partnercode") ??
                                                            "",
                                                    agentcode:
                                                        preferences.getString(
                                                                "agentcode") ??
                                                            "",
                                                    ctx: context,
                                                  ),
                                                );
                                              }

                                            }
                                            if(state is CustomerRegsitrationblocError){
                                              _showErrorSnackBar(state.Errormessage);
                                            }
                                          },
                                          child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
                                            listener: (context, state) async {
                                              log("customer on borading  bloc state => $state");
                                              final preferences = await SharedPreferences.getInstance();
                                              if (state is CustomeronbordingblocLoading) {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  },
                                                );
                                              }
                                              if (state is CustomeronbordingblocLoaded) {
                                                Navigator.of(context, rootNavigator: true).pop();
                                                iscustomeronbordingstatus =state.customeronbordingstatusModel;
                                                if (iscustomeronbordingstatus?.status.toString() == "Success") {
                                                  Flowid = iscustomeronbordingstatus?.result?.flowId??"";
                                                  Pageorder =iscustomeronbordingstatus?.result?.pageOrder?.toInt();
                                                  pagetype = iscustomeronbordingstatus?.result?.pageType??"";
                                                  preferences.setString("Flowid", Flowid.toString());
                                                  preferences.setString("pagetype", pagetype.toString());

                                                  ///Customerupdatenextblo call
                                                  BlocProvider.of<CustomerupdatenextBloc>(context).add(
                                                    FetchCustomerupdate(
                                                      userid: preferences.getString("Userid").toString(),
                                                      Customercode: preferences.getString("CustomerCode").toString(),
                                                      PartnerCode: preferences.getString("partnercode") ?? "",
                                                      FlowId: preferences.getString("Flowid")??"",
                                                      PageOrder: Pageorder.toString(),
                                                      ApplicationId: preferences.getString("applicationid") ?? "",
                                                      PageType: preferences.getString("pagetype")??"",
                                                      ctx: context,
                                                    ),
                                                  );
                                                }

                                              }
                                              if(state is CustomeronbordingblocError){
                                                _showErrorSnackBar(state.Errormessage);
                                              }
                                            },
                                            child: BlocListener<
                                                CustomerupdatenextBloc,
                                                CustomerupdatenextState>(
                                              listener: (context, state) async {
                                                final preferences =
                                                    await SharedPreferences
                                                        .getInstance();
                                                if (state
                                                    is CustomerupdatenextblocLoading) {
                                                  showDialog(
                                                    context: context,
                                                    barrierDismissible: false,
                                                    builder:
                                                        (BuildContext context) {
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    },
                                                  );
                                                } else {
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop();
                                                }
                                                if (state
                                                    is CustomerupdatenextblocLoaded) {
                                                 iscustomerupdate = state.upadatenextprocessModel;
                                                  if (iscustomerupdate?.status.toString() == "Success") {
                                                    ///Customeronbording2
                                                    BlocProvider.of<Customeronbording2Bloc>(context).add(
                                                      FetchCustomeronbording2(
                                                        userid: preferences
                                                            .getString("Userid")
                                                            .toString(),
                                                        Customercode: preferences
                                                            .getString(
                                                                "CustomerCode")
                                                            .toString(),
                                                        partnercode: preferences
                                                                .getString(
                                                                    "partnercode") ??
                                                            "",
                                                        agentcode: preferences
                                                                .getString(
                                                                    "agentcode") ??
                                                            "",
                                                        ctx: context,
                                                      ),
                                                    );
                                                  }
                                                }
                                                if (state is CustomerupdatenextblocError) {
                                                  _showErrorSnackBar(state.Errormessage);
                                                }
                                              },
                                              child: BlocListener<
                                                  Customeronbording2Bloc,
                                                  Customeronbording2State>(
                                                listener:
                                                    (context, state) async {
                                                  final preferences =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  if (state is Customeronbording2blocLoading) {
                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible: false,
                                                      builder: (BuildContext
                                                          context) {
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      },
                                                    );
                                                  }
                                                  if (state is Customeronbording2blocLoaded) {
                                                    Navigator.of(context, rootNavigator: true).pop();
                                                    customerondingsvalue = state.customeronbording2model;
                                                    if (customerondingsvalue?.status == "Success") {
                                                      pagename =
                                                          customerondingsvalue
                                                                  ?.result
                                                                  ?.pageName ?? "";
                                                      if (pagename == "PanVerfication") {
                                                        NavigationService
                                                            .pushAndRemoveUntil(
                                                                Panverfication(),
                                                                (Route<dynamic>
                                                                        route) =>
                                                                    false).then(
                                                            (value) =>
                                                                setState(() {
                                                                  Flowid = null;
                                                                  Pageorder =
                                                                      null;
                                                                  pagetype =
                                                                      null;
                                                                }));
                                                      } else {
                                                        _showErrorSnackBar(
                                                            "not page not allowed");
                                                      }
                                                    }
                                                  }
                                                  if (state is Customeronbording2blocError) {
                                                    _showErrorSnackBar(state.Errormessage);
                                                  }
                                                },
                                                child: TextButton(
                                                    onPressed: () async {
                                                      final preferences =
                                                          await SharedPreferences
                                                              .getInstance();
                                                      BlocProvider.of<
                                                                  CustomerRegsitrationBloc>(
                                                              context)
                                                          .add(
                                                        FetchCustomerregistration(
                                                          userId: preferences
                                                              .getString(
                                                                  "Userid")
                                                              .toString(),
                                                          data: preferences
                                                              .getString(
                                                                  "onbordingmobile")
                                                              .toString(),
                                                          ctx: context,
                                                        ),
                                                      );
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
                                        )
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          ]),
                    )))
          ],
        ),
      ),
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
                      NavigationService.pop();
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

  void startProcess() async {
    final preferences = await SharedPreferences.getInstance();

    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      // First API call
      await Future.delayed(Duration(seconds: 3));
      BlocProvider.of<CustomerRegsitrationBloc>(context).add(
        FetchCustomerregistration(
          userId: preferences.getString("Userid").toString(),
          data: preferences.getString("onbordingmobile").toString(),
          ctx: context,
        ),
      );

      // Second API call
      await Future.delayed(Duration(seconds: 3));
      BlocProvider.of<CustomeronbordingBloc>(context).add(
        FetchCustomeronbording(
          userid: preferences.getString("Userid").toString(),
          Customercode: preferences.getString("CustomerCode").toString(),
          partnercode: preferences.getString("partnercode") ?? "",
          agentcode: preferences.getString("agentcode") ?? "",
          ctx: context,
        ),
      );

      // Third API call
      await Future.delayed(Duration(seconds: 3));
      BlocProvider.of<CustomerupdatenextBloc>(context).add(
        FetchCustomerupdate(
          userid: preferences.getString("Userid").toString(),
          Customercode: preferences.getString("CustomerCode").toString(),
          PartnerCode: preferences.getString("partnercode") ?? "",
          FlowId: Flowid1.toString(),
          PageOrder: pageorder1.toString(),
          ApplicationId: preferences.getString("applicationid") ?? "",
          PageType: pagetype1.toString(),
          ctx: context,
        ),
      );

      // Fourth API call
      await Future.delayed(Duration(seconds: 3));
      BlocProvider.of<Customeronbording2Bloc>(context).add(
        FetchCustomeronbording2(
          userid: preferences.getString("Userid").toString(),
          Customercode: preferences.getString("CustomerCode").toString(),
          partnercode: preferences.getString("partnercode") ?? "",
          agentcode: preferences.getString("agentcode") ?? "",
          ctx: context,
        ),
      );
    } catch (e) {
      // Handle any API error
      _showErrorSnackBar(e.toString());
      return; // Stop further execution
    } finally {
      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }
}
