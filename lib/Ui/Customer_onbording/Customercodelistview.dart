import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/addhaar%20number.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/bank_detalis.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/chooose_emi%20tenure.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/loan_eligiblity_%20Approved.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/pan_verification.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/personal%20information.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/product_value.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/Customer_Regsitration_bloc/customer_regsitration_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import '../../modeles/customeronboradingModel/customer_regsitrationModel/Customer_regsitrationModel.dart';
import '../../widgets/NavigationServies.dart';
import 'Mobileotp.dart';
import 'loan_is_out_verification.dart';

class CustomerDialogContent extends StatefulWidget {
  final List<String> customerCodes;
  final List<String> panNumbers;

  const CustomerDialogContent({

    Key? key,
    required this.customerCodes,
    required this.panNumbers,
  }) : super(key: key);

  @override
  _CustomerDialogContentState createState() => _CustomerDialogContentState();
}
CustomerRegsitrationModel? isregistration;
CustomeronbordingstatusModel? customerOnboardingStatus;
UpadatenextprocessModel? customerUpdateStatus;
Customeronbording2Model?customer2onbording;




/// modelclass

bool isLoading = false;

List<String> selectedCodes = [];
String? Agentcode;
String? Flowid1;
int? pageorder1;
String? pagename1;
String? pagetype1;

class _CustomerDialogContentState extends State<CustomerDialogContent> {
  Future<void> _saveSelectedCodes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('CustomerCode', selectedCodes.toString());
    print('Selected codes saved: $selectedCodes');
  }

  Future<void> _initializeSelection() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    // Clear the previous selection on page load
    preferences.remove("CustomerCode");
    setState(() {
      selectedCodes.clear();
    });
  }

  @override
  void initState() {
    _initializeSelection();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Customer Details', style: TextStyle(
          fontSize: 28.rf(context),
          fontFamily: "boldtext",
          fontWeight: FontWeight.w800),),
      content: SingleChildScrollView(
        child:Column(
          children: widget.customerCodes
              .asMap()
              .entries
              .map((entry) {
            int index = entry.key;
            String code = entry.value;
            String pan = widget.panNumbers[index];
            bool isSelected = selectedCodes.contains(code);


            return GestureDetector(
              onTap: () async {
                final SharedPreferences preferences =
                await SharedPreferences.getInstance();
                setState(() {
                  if (isSelected) {
                    selectedCodes.remove(code);
                    preferences.remove("CustomerCode");
                  } else {
                    if (selectedCodes.isNotEmpty) {
                      // Display error message if there's already a selected code
                      _showErrorSnackBar(
                          "You can select only one code at a time.");
                    } else {
                      selectedCodes.add(code);
                      preferences.setString("CustomerCode", code);
                    }
                  }
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue.withOpacity(0.3) : Colors.blue
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.transparent,
                    width: 5.rw(context),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Code: $code",
                      style: TextStyle(fontSize: 16.rf(context),
                          fontWeight: FontWeight.bold),
                    ),
                    if (pan != null) ...[
                      SizedBox(height: 5.rh(context)),
                      Text(
                        "PAN Number: $pan",
                        style: TextStyle(
                            fontSize: 14.rf(context), color: Colors.black54),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        BlocListener<
            CustomerRegsitrationBloc,
            CustomerRegsitrationState>(
          listener: (context, state) async {
            final preferences = await SharedPreferences.getInstance();
            if (state is CustomerRegsitrationblocLoading) {
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
            if (state is CustomerRegsitrationblocLoaded) {
              Navigator.of(context, rootNavigator: true)
                  .pop();
              isregistration = state
                  .customerRegistrationStatus;
              if (isregistration?.status == "Success") {
                String customerCode = isregistration?.result?.customerCode??"";
                String applicationId = isregistration?.result?.applicationId??"";
                preferences.setString("CustomerCode", customerCode);
                preferences.setString("applicationid", applicationId);

                /// Customeronbording Api
                BlocProvider.of<CustomeronbordingBloc>(context).add(
                  FetchCustomeronbording(
                    userid: preferences.getString("Userid").toString(),
                    Customercode: preferences.getString("CustomerCode").toString(),
                    partnercode: preferences.getString("partnercode") ?? "",
                    agentcode: preferences.getString("agentcode") ?? "",
                    ctx: context,
                  ),
                );
              }
            }
            if(state is CustomerRegsitrationblocError){
              Navigator.of(context, rootNavigator: true)
                  .pop();
              _showErrorSnackBar(isregistration?.responseMessage??"");
            }
          },
          child: BlocListener<CustomeronbordingBloc,
              CustomeronbordingState>(
            listener: (context, state) async {
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
              }
              if (state is CustomeronbordingblocLoaded) {
                Navigator.of(context, rootNavigator: true)
                    .pop();
                final preferences = await SharedPreferences.getInstance();
                customerOnboardingStatus = BlocProvider.of<CustomeronbordingBloc>(context).isCustomeronbording;
                if (customerOnboardingStatus?.status == "Success") {
                  Flowid1 =
                      customerOnboardingStatus?.result?.flowId??"";
                  pageorder1 = customerOnboardingStatus?.result?.pageOrder?.toInt();
                  pagetype1 =customerOnboardingStatus?.result?.pageType.toString();
                  ///preferences add value
                  preferences.setString("Flowid", Flowid1.toString());
                  preferences.setString("pagetype", pagetype1.toString());

                  ///Api call CUstomeronbording

                  BlocProvider.of<CustomerupdatenextBloc>(context).add(
                    FetchCustomerupdate(
                      userid: preferences.getString("Userid").toString(),
                      Customercode: preferences.getString("CustomerCode").toString(),
                      PartnerCode: preferences.getString("partnercode") ?? "",
                      FlowId: preferences.getString("Flowid").toString(),
                      PageOrder: pageorder1.toString(),
                      ApplicationId: preferences.getString("applicationid") ?? "",
                      PageType: preferences.getString("pagetype").toString(),
                      ctx: context,
                    ),
                  );
                }
              }
              if(state is CustomeronbordingblocError){
                Navigator.of(context, rootNavigator: true)
                    .pop();
                _showErrorSnackBar(customerOnboardingStatus?.responseMessage??"");
              }
            },
            child: BlocListener<CustomerupdatenextBloc, CustomerupdatenextState>(
              listener: (context, state) async {
                if (state is CustomerupdatenextblocLoading) {
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
                if (state is CustomerupdatenextblocLoaded) {
                  Navigator.of(context, rootNavigator: true)
                      .pop();
                  final preferences = await SharedPreferences
                      .getInstance();
                  customerUpdateStatus = BlocProvider
                      .of<CustomerupdatenextBloc>(context)
                      .iscustomerupadate;
                  if (customerUpdateStatus?.status == "Success") {
                    BlocProvider.of<Customeronbording2Bloc>(context).add(
                      FetchCustomeronbording2(
                        userid: preferences.getString("Userid")
                            .toString(),
                        Customercode: preferences.getString(
                            "CustomerCode")
                            .toString(),
                        partnercode: preferences.getString(
                            "partnercode") ??
                            "",
                        agentcode: preferences.getString("agentcode") ??
                            "",
                        ctx: context,
                      ),
                    );

                    // } else {
                    //   print(customerUpdateStatus.responseMessage.toString());
                    //   // Remove values if necessary
                    // }
                  }
                }
                if(state is CustomerupdatenextblocError){
                  Navigator.of(context, rootNavigator: true)
                      .pop();
                  _showErrorSnackBar(customerUpdateStatus?.responseMessage??"");
                }
              },
              child: BlocListener<
                  Customeronbording2Bloc,
                  Customeronbording2State>(
                listener: (context, state) async {
                  if (state is Customeronbording2blocLoading) {
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
                  if (state is Customeronbording2blocLoaded) {
                    Navigator.of(context, rootNavigator: true)
                        .pop();
                    customer2onbording = BlocProvider
                        .of<Customeronbording2Bloc>(context)
                        .iscustomeronbordingstatusModel2;
                    if (customer2onbording?.status == "Success") {
                      pagename1 = customer2onbording?.result?.pageName??"";
                      print("shaheen 1st upadate the $pagename1");
                      if (pagename1 == "PanVerfication") {
                        NavigationService.pushAndRemoveUntil(
                            Panverfication(), (
                            Route<dynamic>route) => false);
                      } else {
                        _showErrorSnackBar("not page not allowed");
                      }
                    }
                    }
                  if(state is Customeronbording2blocError){
                 Navigator.of(context, rootNavigator: true)
                         .pop();
                 _showErrorSnackBar(state.Errormessage);
                   }
                  },
                  // TODO: implement listener
                child: TextButton(
                  onPressed: () async {
                    final preferences = await SharedPreferences
                        .getInstance();
                   Future.delayed(Duration(seconds: 2));
                      BlocProvider.of<CustomerRegsitrationBloc>(context).add(
                        FetchCustomerregistration(
                          userId: preferences.getString("Userid").toString(),
                          data: preferences.getString("onbordingmobile").toString(),
                          ctx: context,
                        ),
                      );
                  },
                  child: Text('Create a Loan', style: TextStyle(
                    fontSize: 16.rf(context),
                    fontWeight: FontWeight.w800,
                    fontFamily: "regulartext",
                  ),),
                ),
              ),
            ),
          ),
        ),
        BlocListener<Customeronbording2Bloc, Customeronbording2State>(
          listener: (context, state) async {
            final preferences = await SharedPreferences.getInstance();
            if (state is Customeronbording2blocLoading) {
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
            if (state is Customeronbording2blocLoaded) {
              Navigator.of(context, rootNavigator: true).pop();
              customer2onbording = state.customeronbording2model;
              if (customer2onbording?.status.toString() == "Success") {
                Flowid1=customer2onbording?.result?.flowId??"";
                pagetype1=customer2onbording?.result?.pageType??"";
                preferences.setString("Flowid", Flowid1??"");
                preferences.setString("pagetype", pagetype1??"");
                pagename1 = customer2onbording?.result?.pageName?.toString();
                switch (pagename1) {
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
                  case "EligibilityStatus":
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
                  case "ProductDetails":
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
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Loan_eligibility_Approved()));
                    break;
                    case"SignUp":
                    await NavigationService.pushAndRemoveUntil(Loan_is_verification(), (Route<dynamic>route) => false);
                  default:
                    Navigator.of(context, rootNavigator: true).pop();
                    _showErrorSnackBar("onbording is completed");
                }
              }
            }
            if (state is Customeronbording2blocError) {
              Navigator.of(context, rootNavigator: true).pop();
              _showErrorSnackBar(state.Errormessage);
            }

          },
          child: TextButton(
            onPressed: () async {
              final preferences = await SharedPreferences.getInstance();
              BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
                  userid: preferences.getString("Userid") ?? "",
                  Customercode: preferences.getString("CustomerCode").toString(),
                  partnercode: preferences.getString("partnercode") ?? "",
                  agentcode: preferences.getString("agentcode") ?? "",
                  ctx: context));
            },
            child: Text('Next', style: TextStyle(
              fontSize: 16.rf(context),
              fontWeight: FontWeight.w800,
              fontFamily: "regulartext",
            ),),
          ),
        ),
        // Buttonclick()
      ],
    );
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
                      NavigationService.pop(); // Close the dialog
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


  ///First code
  Future<void> _executeApiCalls(BuildContext context) async {
    final preferences = await SharedPreferences.getInstance();
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      // First API call after 20 seconds
      await Future.delayed(const Duration(seconds: 5));
      BlocProvider.of<CustomerRegsitrationBloc>(context).add(
        FetchCustomerregistration(
          userId: preferences.getString("Userid") ?? "",
          data: preferences.getString("onbordingmobile") ?? "",
          ctx: context,
        ),
      );

      // Second API call after another 20 seconds
      await Future.delayed(const Duration(seconds: 5));
      BlocProvider.of<CustomeronbordingBloc>(context).add(
        FetchCustomeronbording(
          userid: preferences.getString("Userid") ?? "",
          Customercode: preferences.getString("CustomerCode").toString(),
          partnercode: preferences.getString("partnercode") ?? "",
          agentcode: preferences.getString("agentcode") ?? "",
          ctx: context,
        ),
      );

      // Third API call after another 20 seconds
      await Future.delayed(const Duration(seconds: 5));
      BlocProvider.of<CustomerupdatenextBloc>(context).add(
        FetchCustomerupdate(
          userid: preferences.getString("Userid") ?? "",
          Customercode: preferences.getString("CustomerCode").toString(),
          PartnerCode: preferences.getString("partnercode") ?? "",
          FlowId: Flowid1.toString(),
          PageOrder: pageorder1.toString(),
          ApplicationId: preferences.getString("applicationid") ?? "",
          PageType: pagetype1.toString(),
          ctx: context,
        ),
      );

      // Fourth API call after another 20 seconds
      await Future.delayed(const Duration(seconds: 5));
      BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
          userid: preferences.getString("Userid") ?? "",
          Customercode: preferences.getString("CustomerCode").toString(),
          partnercode: preferences.getString("partnercode") ?? "",
          agentcode: preferences.getString("agentcode") ?? "",
          ctx: context));
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All API calls completed successfully')),
      );
    } catch (e) {
      // Handle error, navigate to Mobileotp, and show error message
      Navigator.pop(context); // Close loading indicator
      NavigationService.pushAndRemoveUntil(
          Mobileotp(), (Route<dynamic> route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      Navigator.pop(context); // Ensure dialog is dismissed
    }


    ///second code

    //  void startProcess2() async {
    //    final preferences = await SharedPreferences.getInstance();
    //
    //    setState(() {
    //      isLoading = true; // Show loading indicator
    //    });
    //
    //    try {
    //      _callFirstAPI(preferences);
    //      _callSecondAPI(preferences);
    //      _callThirdAPI(preferences);
    //      _callFourthAPI(preferences);
    //      // Step 1: First API Call
    //
    //    } catch (error, stackTrace) {
    //      log("Error while calling multiple API", error: error, stackTrace: stackTrace);
    //      _showErrorSnackBar(error.toString());
    //      return; // Stop further execution
    //    } finally {
    //      setState(() {
    //        isLoading = false; // Hide loading indicator
    //      });
    //    }
    //  }
    //
    //  void _callFirstAPI(SharedPreferences preferences)  {
    //
    //   BlocProvider.of<CustomerRegsitrationBloc>(context).add(
    //      FetchCustomerregistration(
    //        userId: preferences.getString("Userid").toString(),
    //        data: preferences.getString("onbordingmobile").toString(),
    //        ctx: context,
    //      ),
    //    );
    //  }
    //
    //  void _callSecondAPI(SharedPreferences preferences) {
    //
    //     BlocProvider.of<CustomeronbordingBloc>(context).add(
    //      FetchCustomeronbording(
    //        userid: preferences.getString("Userid").toString(),
    //        Customercode: preferences.getString("CustomerCode").toString(),
    //        partnercode: preferences.getString("partnercode") ?? "",
    //        agentcode: preferences.getString("agentcode") ?? "",
    //        ctx: context,
    //      ),
    //    );
    //  }
    //
    //  void _callThirdAPI(SharedPreferences preferences) {
    //    BlocProvider.of<CustomerupdateBloc>(context).add(
    //      FetchCustomerupdate(
    //        userid: preferences.getString("Userid").toString(),
    //        Customercode: preferences.getString("CustomerCode").toString(),
    //        PartnerCode: preferences.getString("partnercode") ?? "",
    //        FlowId: "",
    //        //Flowid1.toString(),
    //        PageOrder: pageorder1.toString(),
    //        ApplicationId: preferences.getString("applicationid") ?? "",
    //        PageType: pagetype1.toString(),
    //        ctx: context,
    //      ),
    //    );
    //  }
    //
    // void _callFourthAPI(SharedPreferences preferences)  {
    //    BlocProvider.of<Customeronbording2Bloc>(context).add(
    //      FetchCustomeronbording2(
    //        userid: preferences.getString("Userid").toString(),
    //        Customercode: preferences.getString("CustomerCode").toString(),
    //        partnercode: preferences.getString("partnercode") ?? "",
    //        agentcode: preferences.getString("agentcode") ?? "",
    //        ctx: context,
    //      ),
    //    );
    //  }

  }
}