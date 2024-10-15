import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/CustomerSendotp_bloc/customersendotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customer_Regsitration_bloc/customer_regsitration_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/addhaar%20number.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/bank_detalis.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/chooose_emi%20tenure.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/loan_eligiblity_%20Approved.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/pan_verification.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/personal%20information.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/product_value.dart';
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
import 'Loan_rejected_approved.dart';

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
bool nextnavgation = false;
bool isLoading = false;
bool isverifiedotp = false;
String? customercodeLook;
String? Customercoderegistration;
String? Partnercode;
String? Flowid;
String? Pageorder;
String? pagename;
List<String> selectedCodes = [];
TextEditingController onbordingotp = TextEditingController();

class _MobileotpState extends State<Mobileotp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onbordingotp = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const MyAppbar(),
      ),
      body: SingleChildScrollView(
        child: BlocListener<CustomerupdateBloc, CustomerupdateState>(
          listener: (context, state) {
            if (state is CustomerupdateblocLoading) {
              CircularProgressIndicator();
            }
            if (state is CustomerupadateblocLoaded) {
              isupadatenextprocess =
                  BlocProvider.of<CustomerupdateBloc>(context)
                      .iscustomerupadate;
              if (isupadatenextprocess.status.toString() == "Success") {
                // Success, continue the flow
              } else {
                _showErrorSnackBar(
                    isupadatenextprocess.errorMessage.toString());
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Mobileotp()));
                return; // Stop further execution on failure
              }
            }
            // TODO: implement listener
          },
          child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
            listener: (context, state) {
              if (state is CustomeronbordingblocLoading) {
                CircularProgressIndicator();
              }
              if (state is CustomeronbordingblocLoaded) {
                iscustomerstatuts =
                    BlocProvider.of<CustomeronbordingBloc>(context)
                        .isCustomeronbording;
                if (iscustomerstatuts.status.toString() == "Success") {
                  Pageorder = iscustomerstatuts.result!.pageOrder.toString();
                  Flowid = iscustomerstatuts.result!.flowId.toString();
                  pagename = iscustomerstatuts.result!.pageName.toString();
                } else {
                  _showErrorSnackBar(iscustomerstatuts.errorMessage.toString());
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Mobileotp()));
                  return; // Stop further execution on failure
                }
              }
              // TODO: implement listener
            },
            child: BlocListener<CustomerRegsitrationBloc,
                CustomerRegsitrationState>(
              listener: (context, state) {
                if (state is CustomerRegsitrationblocLoading) {
                  CircularProgressIndicator();
                }
                if (state is CustomerRegsitrationblocLoaded) {
                  isCustomerregistration =
                      BlocProvider.of<CustomerRegsitrationBloc>(context)
                          .iscustomerregsitration;
                  if (isCustomerregistration.status.toString() == "Success") {
                    Customercoderegistration =
                        isCustomerregistration.result!.customerCode.toString();
                  } else {
                    _showErrorSnackBar(
                        isCustomerregistration.errorMessage.toString());
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Mobileotp()));
                    return; // Stop further execution on failure
                  }
                }
                // TODO: implement listener
              },
              child: BlocListener<UserdetalisBloc, UserdetalisState>(
                listener: (context, state) async {
                  final preferences = await SharedPreferences.getInstance();
                  if (state is UserdetalisblocLoading) {
                    CircularProgressIndicator();
                  }
                  if (state is UserdetalisblocLoaded) {
                    isuserdetalis =
                        BlocProvider.of<UserdetalisBloc>(context).isuser;
                    Partnercode =
                        isuserdetalis.result!.first.partnerCodes.toString();
                    preferences.setString(
                        "partnercode", Partnercode.toString());
                  }
                  // TODO: implement listener
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: mwidth * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: mheight * 0.1,
                          ),
                          const Text(
                            "Mobile Verification",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "boldtext",
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: mheight * 0.01,
                          ),
                          const Text(
                            " Verify your mobile\n number",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext"),
                          ),
                          SizedBox(
                            height: mheight * 0.1,
                          ),
                          SizedBox(
                            width: mwidth * 0.7,
                            child: Padding(
                              padding: EdgeInsets.only(left: mwidth * 0.05),
                              child: BlocListener<CustomerverifiyotpBloc,
                                  CustomerverifiyotpState>(
                                listener: (context, state) async {
                                  final preferences =
                                  await SharedPreferences.getInstance();
                                  if (state is CustomerverifiyotpblocLoading) {
                                    CircularProgressIndicator();
                                  }
                                  if (state is CustomerverifiyotpblocLoaded) {
                                    isCustomerverifiy =
                                        BlocProvider.of<CustomerverifiyotpBloc>(
                                            context)
                                            .iscustomerverifiyotp;
                                    if (isCustomerverifiy.status.toString() ==
                                        "Success") {
                                      setState(() {
                                        isverifiedotp = true;
                                        nextnavgation = true;
                                      });
                                      BlocProvider.of<CustomercodecreateBloc>(
                                          context)
                                          .add(FetchCustomercodecreate(
                                          userId: preferences
                                              .getString("Userid")
                                              .toString(),
                                          data: preferences
                                              .getString("onbordingmobile")
                                              .toString(), ctx: context));
                                      BlocProvider.of<UserdetalisBloc>(context)
                                          .add(FetchUserdetalis(
                                        userId: preferences
                                            .getString("Userid")
                                            .toString(),
                                        Identity: preferences
                                            .getString("Userid")
                                            .toString(), ctx: context,
                                            
                                      ));
                                    } else {
                                      setState(() {
                                        isverifiedotp = false;
                                        nextnavgation = false;
                                      });
                                      _showErrorSnackBar("Not verified");
                                    }
                                  }
                                  // TODO: implement listener
                                },
                                child: BlocListener<CustomercodecreateBloc,
                                    CustomercodecreateState>(
                                  listener: (context, state) {
                                    if (state
                                    is CustomercodecreateblocLoading) {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    }
                                    if (state is CustomercodecreateblocLoaded) {
                                      Navigator.of(context)
                                          .pop(); // Close the loading dialog
                                      isCustomercodecheck = BlocProvider.of<
                                          CustomercodecreateBloc>(context)
                                          .iscreatecustomercode;

                                      if (isCustomercodecheck.status
                                          .toString() ==
                                          "Success") {
                                        // Handle multiple customer codes
                                        List<String> customerCodes1 =
                                        isCustomercodecheck
                                            .result!.customerCodes!
                                            .map((code) => code.customerCode
                                            .toString())
                                            .toList();

                                        if (customerCodes1.isNotEmpty) {
                                          // Assign customer codes to customercodeLook for further usage
                                          customercodeLook =
                                              customerCodes1.join(
                                                  ", "); // Join codes if needed
                                          // List to store multiple selected codes

                                          // Display dialog with dynamic Text widgets for each customer code
                                          showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text(
                                                  "Choose the Customer Codes"),
                                              content: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                  MainAxisSize.min,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                      MainAxisSize.min,
                                                      children: customerCodes1
                                                          .map((code) {
                                                        final isSelected =
                                                        selectedCodes.contains(
                                                            code); // Check if this code is selected

                                                        return Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .all(8.0),
                                                          child:
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (isSelected) {
                                                                  // If the code is already selected, remove it
                                                                  selectedCodes
                                                                      .remove(
                                                                      code);
                                                                } else {
                                                                  // If the code is not selected, add it
                                                                  selectedCodes
                                                                      .add(
                                                                      code);
                                                                }
                                                              });
                                                            },
                                                            child: Container(
                                                              height: mheight *
                                                                  0.08,
                                                              width:
                                                              mwidth * 0.7,
                                                              decoration:
                                                              BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    8),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: isSelected
                                                                        ? Colors
                                                                        .green
                                                                        : Colors
                                                                        .lightBlue,
                                                                    // Change color on selection
                                                                    spreadRadius:
                                                                    3,
                                                                    // Spread radius
                                                                    blurRadius:
                                                                    0,
                                                                    // Blur radius
                                                                    offset: Offset(
                                                                        0,
                                                                        2), // Changes position of shadow
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  code,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      16),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          bottom: 12.0),
                                                      child: ElevatedButton(
                                                        onPressed: () async {
                                                          final preferences = await SharedPreferences.getInstance();
                                                          bool apiErrorOccurred = false;
                                                          setState(() {
                                                            isLoading = true; // Show loading indicator
                                                          });

                                                          // 1st API Call - Customer Registration
                                                          try {
                                                            // Make the first API call and await its completion
                                                            BlocProvider.of<CustomerRegsitrationBloc>(context).add(
                                                              FetchCustomerregistration(
                                                                userId: preferences.getString("Userid").toString(),
                                                                data: preferences.getString("onbordingmobile").toString(), ctx: context,
                                                              ),
                                                            );

                                                            // Listen for success response from the CustomerRegsitrationBloc here
                                                            // You might need to handle this through a BlocListener to check for the success
                                                            // If success, continue to the next API calls
                                                          } catch (e) {
                                                            _showErrorSnackBar(e.toString());
                                                            apiErrorOccurred = true;
                                                            setState(() {
                                                              isLoading = false; // Stop loading indicator
                                                            });
                                                            return; // Exit if there's an error
                                                          }

                                                          if (!apiErrorOccurred) {
                                                            // 2nd API Call - Customer Onboarding
                                                            try {
                                                              await Future.delayed(Duration(seconds: 2)); // Simulate a delay if needed
                                                              BlocProvider.of<CustomeronbordingBloc>(context).add(
                                                                FetchCustomeronbording(
                                                                  userid: preferences.getString("Userid").toString(),
                                                                  Customercode: Customercoderegistration.toString(), ctx: context, // Use customer code from registration
                                                                ),
                                                              );
                                                            } catch (e) {
                                                              _showErrorSnackBar(e.toString());
                                                              apiErrorOccurred = true;
                                                              setState(() {
                                                                isLoading = false; // Stop loading indicator
                                                              });
                                                              return; // Exit if there's an error
                                                            }
                                                          }

                                                          if (!apiErrorOccurred) {
                                                            // 3rd API Call - Customer Update
                                                            try {
                                                              await Future.delayed(Duration(seconds: 2)); // Simulate a delay if needed
                                                              BlocProvider.of<CustomerupdateBloc>(context).add(
                                                                FetchCustomerupdate(
                                                                  userid: preferences.getString("Userid").toString(),
                                                                  Customercode: Customercoderegistration.toString(), // Use customer code from registration
                                                                  PartnerCode: Partnercode.toString(),
                                                                  FlowId: Flowid.toString(),
                                                                  PageOrder: Pageorder.toString(), ctx: context,
                                                                ),
                                                              );
                                                            } catch (e) {
                                                              _showErrorSnackBar(e.toString());
                                                              apiErrorOccurred = true;
                                                            }
                                                          }

                                                          if (!apiErrorOccurred) {
                                                            setState(() {
                                                              isLoading = false; // Stop loading indicator
                                                            });
                                                            Navigator.of(context).pop(); // Close the dialog after success
                                                          } else {
                                                            setState(() {
                                                              isLoading = false; // Stop loading on error
                                                            });
                                                          }
                                                        },

                                                        style: ElevatedButton.styleFrom(
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                          backgroundColor: Colors.blue, // Customize button color
                                                        ),
                                                        child: Text(
                                                          "Create",
                                                          style: TextStyle(fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () async {
                                                    if (selectedCodes
                                                        .isNotEmpty) {
                                                      final preferences =
                                                      await SharedPreferences
                                                          .getInstance();
                                                      bool apiErrorOccurred =
                                                      false; // Flag to track errors

                                                      setState(() {
                                                        isLoading = true;
                                                      });

                                                      try {
                                                        // 1st API Call - Customer Onboarding
                                                        await Future.delayed(
                                                            const Duration(
                                                                seconds: 2));

                                                        BlocProvider.of<
                                                            CustomeronbordingBloc>(
                                                            context)
                                                            .add(
                                                          FetchCustomeronbording(
                                                            userid: preferences
                                                                .getString(
                                                                "Userid")
                                                                .toString(),
                                                            Customercode:
                                                            selectedCodes.join(
                                                                ", "), ctx: context, // Pass selected codes as a comma-separated string
                                                          ),
                                                        );
                                                      } catch (e) {
                                                        _showErrorSnackBar(
                                                            e.toString());
                                                        apiErrorOccurred = true;

                                                      }
                                                      try{
                                                        if(!apiErrorOccurred){
                                                          await Future.delayed(Duration(seconds: 2));
                                                          BlocProvider.of<CustomerupdateBloc>(context).add(FetchCustomerupdate(
                                                              userid: preferences.getString("Userid").toString(),
                                                              Customercode: selectedCodes.join(", "),
                                                              PartnerCode: Partnercode.toString(),
                                                              FlowId:Flowid.toString(),
                                                              PageOrder: Pageorder.toString(), ctx: context));
                                                        }

                                                      }catch(e){
                                                        _showErrorSnackBar(
                                                            e.toString());
                                                        apiErrorOccurred = true;
                                                      }
                                                      try{
                                                        if (!apiErrorOccurred) {
                                                          await Future.delayed(
                                                              const Duration(
                                                                  seconds: 5));
                                                          BlocProvider.of<
                                                              CustomeronbordingBloc>(
                                                              context)
                                                              .add(
                                                            FetchCustomeronbording(
                                                              userid: preferences
                                                                  .getString(
                                                                  "Userid")
                                                                  .toString(),
                                                              Customercode:
                                                              selectedCodes.join(", "), ctx: context,
                                                            ),
                                                          );
                                                        }
                                                      }catch(e){
                                                        _showErrorSnackBar(
                                                            e.toString());
                                                        apiErrorOccurred = true;
                                                      }
                                                      finally {
                                                        setState(() {
                                                          isLoading =
                                                          false; // Stop loading indicator
                                                        });
                                                        if (!apiErrorOccurred) {
                                                          Navigator.of(context)
                                                              .pop(); // Close dialog after all APIs succeed
                                                        }
                                                      }
                                                    } else {
                                                      _showErrorSnackBar(
                                                          "Please select at least one customer code.");
                                                    }
                                                  },
                                                  child: Text("OK"),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      }
                                    }
                                    if (state is CustomerCodecreateblocError) {
                                      Navigator.of(context)
                                          .pop(); // Close the loading dialog
                                      // Handle error and show an error dialog
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: Text("Error"),
                                          content: Text(
                                              "Failed to create customer code. Please try again."),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(); // Close dialog
                                              },
                                              child: Text("OK"),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: PinCodeTextField(
                                    controller: onbordingotp,
                                    pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.underline,
                                        inactiveColor: const Color(0xffC9D2EA),
                                        fieldWidth: mwidth * 0.15,
                                        borderRadius: BorderRadius.circular(5)),
                                    appContext: context,
                                    onSubmitted: (value) {},
                                    onCompleted: (value) async {
                                      final preferences =
                                      await SharedPreferences.getInstance();
                                      CircularProgressIndicator();
                                      BlocProvider.of<CustomerverifiyotpBloc>(
                                          context)
                                          .add(FetchCustomerVerifiyotp(
                                          userId: preferences
                                              .getString("Userid")
                                              .toString(),
                                          mobilenumber: preferences
                                              .getString("onbordingmobile")
                                              .toString(),
                                          Mobilenumberotp:
                                          onbordingotp.text, ctx: context));
                                    },
                                    length: 4,
                                    enabled: !isverifiedotp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.2),
                            child: Column(
                              children: [
                                const Text(
                                  "Didn’t you  receive any code?",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext"),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      final preferences =
                                      await SharedPreferences.getInstance();
                                      BlocProvider.of<CustomersendotpBloc>(
                                          context)
                                          .add(FetchCustomersendotp(
                                          userId: preferences
                                              .getString("Userid")
                                              .toString(),
                                          mobilenumber: preferences
                                              .getString("onbordingmobile")
                                              .toString(), ctx: context));
                                    },
                                    child: const Text(
                                      "Resend New Code",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "regulartext",
                                          color: Color(0xffFF7C00)),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: mheight * 0.3,
                          ),
                          nextnavgation
                              ? Padding(
                              padding: EdgeInsets.only(right: mwidth * 0.1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  BlocListener<CustomerRegsitrationBloc,
                                      CustomerRegsitrationState>(
                                    listener: (context, state) async {
                                      if (state
                                      is CustomerRegsitrationblocLoading) {
                                        CircularProgressIndicator();
                                      }
                                      if (state
                                      is CustomerRegsitrationblocLoaded) {
                                        isCustomerregistration = BlocProvider
                                            .of<CustomerRegsitrationBloc>(
                                            context)
                                            .iscustomerregsitration;
                                        if (isCustomerregistration.status
                                            .toString() ==
                                            "Success") {
                                          Customercoderegistration =
                                              isCustomerregistration
                                                  .result!.customerCode
                                                  .toString();
                                        } else {
                                          _showErrorSnackBar(
                                              isCustomerregistration
                                                  .errorMessage
                                                  .toString());
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Mobileotp()));
                                          return; // Stop further execution on failure
                                        }
                                      }
                                    },
                                    child: BlocListener<
                                        CustomeronbordingBloc,
                                        CustomeronbordingState>(
                                      listener: (context, state) async {
                                        if (state
                                        is CustomeronbordingblocLoading) {
                                          CircularProgressIndicator();
                                        }
                                        if (state
                                        is CustomeronbordingblocLoaded) {
                                          iscustomerstatuts = BlocProvider
                                              .of<CustomeronbordingBloc>(
                                              context)
                                              .isCustomeronbording;
                                          if (iscustomerstatuts.status
                                              .toString() ==
                                              "Success") {
                                            Pageorder = iscustomerstatuts
                                                .result!.pageOrder
                                                .toString();
                                            Flowid = iscustomerstatuts
                                                .result!.flowId
                                                .toString();
                                            pagename = iscustomerstatuts
                                                .result!.pageName
                                                .toString();
                                            switch (pagename) {
                                              case "PanVerfication":
                                                await Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        Panverfication()));
                                                break;
                                              case "AadhaarVerification":
                                                await Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        Aadhaarnumber()));
                                                break;
                                              case "PersonalInfo":
                                                await Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        Personal_information()));
                                                break;
                                              case "EligibleApproved":
                                                await Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        Loan_eligibility_Approved()));
                                                break;
                                              case "BankDetails":
                                                await Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        Bank_details()));
                                                break;
                                              case "ProduceDetails":
                                                await Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        Product_value()));
                                                break;
                                              case "EMI":
                                                await Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        Choose_your_emi_tenure()));
                                                break;
                                              case"EligibleRejected":
                                                await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Loan_rejected_approved()));
                                                break;
                                              default:
                                                print ("you faced the issue");
                                            }
                                          } else {
                                            _showErrorSnackBar(
                                                iscustomerstatuts
                                                    .errorMessage
                                                    .toString());
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Mobileotp()));
                                            return; // Stop further execution on failure
                                          }
                                        }
                                      },
                                      child: BlocListener<
                                          CustomerupdateBloc,
                                          CustomerupdateState>(
                                        listener: (context, state) async {
                                          if (state
                                          is CustomerupdateblocLoading) {
                                            CircularProgressIndicator();
                                          }
                                          if (state
                                          is CustomerupadateblocLoaded) {
                                            isupadatenextprocess = BlocProvider
                                                .of<CustomerupdateBloc>(
                                                context)
                                                .iscustomerupadate;
                                            if (isupadatenextprocess.status
                                                .toString() ==
                                                "Success") {
                                              // Success, continue the flow
                                            } else {
                                              _showErrorSnackBar(
                                                  isupadatenextprocess
                                                      .errorMessage
                                                      .toString());
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Mobileotp()));
                                              return; // Stop further execution on failure
                                            }
                                          }
                                        },
                                        child: TextButton(
                                          onPressed: () async {
                                            final preferences =
                                            await SharedPreferences
                                                .getInstance();
                                            bool apiErrorOccurred =
                                            false; // Flag to track errors
                                            setState(() {
                                              isLoading = true;
                                            });
                                            try {
                                              if (customercodeLook !=
                                                  null) {
                                                // Customer Onboarding Bloc
                                                try {
                                                  await Future.delayed(
                                                      const Duration(
                                                          seconds: 2));
                                                  BlocProvider.of<
                                                      CustomeronbordingBloc>(
                                                      context)
                                                      .add(
                                                    FetchCustomeronbording(
                                                      userid: preferences
                                                          .getString(
                                                          "Userid")
                                                          .toString(),
                                                      Customercode:
                                                      customercodeLook
                                                          .toString(), ctx: context,
                                                    ),
                                                  );
                                                } catch (e) {
                                                  _showErrorSnackBar(
                                                      e.toString());
                                                  apiErrorOccurred =
                                                  true; // Error encountered
                                                  return; // Stop execution on error
                                                }

                                                // Customer Update Bloc
                                                if (!apiErrorOccurred) {
                                                  try {
                                                    await Future.delayed(
                                                        const Duration(
                                                            seconds: 2));
                                                    BlocProvider.of<
                                                        CustomerupdateBloc>(
                                                        context)
                                                        .add(
                                                      FetchCustomerupdate(
                                                        userid: preferences
                                                            .getString(
                                                            "Userid")
                                                            .toString(),
                                                        Customercode:
                                                        customercodeLook
                                                            .toString(),
                                                        PartnerCode:
                                                        Partnercode
                                                            .toString(),
                                                        FlowId: Flowid
                                                            .toString(),
                                                        PageOrder: Pageorder
                                                            .toString(), ctx: context,
                                                      ),
                                                    );
                                                  } catch (e) {
                                                    _showErrorSnackBar(
                                                        e.toString());
                                                    apiErrorOccurred = true;
                                                    return; // Stop execution on error
                                                  }
                                                }

                                                // Final call if all succeed
                                                if (!apiErrorOccurred) {
                                                  await Future.delayed(
                                                      const Duration(
                                                          seconds: 5));
                                                  BlocProvider.of<
                                                      CustomeronbordingBloc>(
                                                      context)
                                                      .add(
                                                    FetchCustomeronbording(
                                                      userid: preferences
                                                          .getString(
                                                          "Userid")
                                                          .toString(),
                                                      Customercode:
                                                      customercodeLook
                                                          .toString(), ctx: context,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                // Customer Registration Bloc
                                                try {
                                                  await Future.delayed(
                                                      const Duration(
                                                          seconds: 2));
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
                                                          .toString(), ctx: context,
                                                    ),
                                                  );
                                                } catch (e) {
                                                  _showErrorSnackBar(
                                                      e.toString());
                                                  apiErrorOccurred = true;
                                                  return; // Stop execution on error
                                                }

                                                // Customer Onboarding Bloc
                                                if (!apiErrorOccurred) {
                                                  try {
                                                    await Future.delayed(
                                                        const Duration(
                                                            seconds: 2));
                                                    BlocProvider.of<
                                                        CustomeronbordingBloc>(
                                                        context)
                                                        .add(
                                                      FetchCustomeronbording(
                                                        userid: preferences
                                                            .getString(
                                                            "Userid")
                                                            .toString(),
                                                        Customercode:
                                                        Customercoderegistration
                                                            .toString(), ctx: context,
                                                      ),
                                                    );
                                                  } catch (e) {
                                                    _showErrorSnackBar(
                                                        e.toString());
                                                    apiErrorOccurred = true;
                                                    return; // Stop execution on error
                                                  }
                                                }

                                                // Customer Update Bloc
                                                if (!apiErrorOccurred) {
                                                  try {
                                                    await Future.delayed(
                                                        const Duration(
                                                            seconds: 2));
                                                    BlocProvider.of<
                                                        CustomerupdateBloc>(
                                                        context)
                                                        .add(
                                                      FetchCustomerupdate(
                                                        userid: preferences
                                                            .getString(
                                                            "Userid")
                                                            .toString(),
                                                        Customercode:
                                                        Customercoderegistration
                                                            .toString(),
                                                        PartnerCode:
                                                        Partnercode
                                                            .toString(),
                                                        FlowId: Flowid
                                                            .toString(),
                                                        PageOrder: Pageorder
                                                            .toString(), ctx: context,
                                                      ),
                                                    );
                                                  } catch (e) {
                                                    _showErrorSnackBar(
                                                        e.toString());
                                                    apiErrorOccurred = true;
                                                    return; // Stop execution on error
                                                  }
                                                }
                                              if(!apiErrorOccurred){
                                                try {
                                                  await Future.delayed(
                                                      const Duration(
                                                          seconds: 2));
                                                  BlocProvider.of<
                                                      CustomeronbordingBloc>(
                                                      context)
                                                      .add(
                                                    FetchCustomeronbording(
                                                      userid: preferences
                                                          .getString(
                                                          "Userid")
                                                          .toString(),
                                                      Customercode:
                                                      Customercoderegistration
                                                          .toString(), ctx: context,
                                                    ),
                                                  );
                                                } catch (e) {
                                                  _showErrorSnackBar(
                                                      e.toString());
                                                  apiErrorOccurred = true;
                                                  return; // Stop execution on error
                                                }
                                              }
                                              }

                                              // Save SharedPreferences if no errors
                                              if (!apiErrorOccurred) {
                                                await Future.delayed(
                                                    const Duration(
                                                        seconds: 5));
                                                if (customercodeLook !=
                                                    null &&
                                                    Customercoderegistration !=
                                                        null) {
                                                  preferences.setString(
                                                      "CustomerCode",
                                                      customercodeLook
                                                          .toString());
                                                } else if (customercodeLook !=
                                                    null) {
                                                  preferences.setString(
                                                      "CustomerCode",
                                                      customercodeLook
                                                          .toString());
                                                } else if (Customercoderegistration !=
                                                    null) {
                                                  preferences.setString(
                                                      "CustomerCode",
                                                      Customercoderegistration
                                                          .toString());

                                                }
                                              }
                                            } catch (error) {
                                              setState(() {
                                                isLoading = false;
                                              });
                                              _showErrorSnackBar(
                                                  error.toString());
                                            }
                                          },
                                          child: Text(
                                            "Next>>>",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xff284389)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ))
                              : SizedBox(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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
