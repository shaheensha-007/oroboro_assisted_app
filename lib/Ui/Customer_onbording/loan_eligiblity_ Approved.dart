import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/product_value.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';

class Loan_eligibility_Approved extends StatefulWidget {
  const Loan_eligibility_Approved({super.key});

  @override
  State<Loan_eligibility_Approved> createState() => _Loan_eligibility_ApprovedState();
}
CustomeronbordingstatusModel? loanCustomeronbording;
UpadatenextprocessModel? loanCustomerupdatenextprocess;
Customeronbording2Model? loanCustomeronbording2;

bool isLoading=false;

int? Pageordereligable;
String? pagetypeeligable;
class _Loan_eligibility_ApprovedState extends State<Loan_eligibility_Approved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150.rh(context),
                ),
                Image(image: AssetImage("assets/success.png"),
                  height: 120.rh(context),
                ),
                SizedBox(
                  height: 50.rh(context),
                ),
                 Text("Loan Eligibility Approved ", style: TextStyle(fontSize: 28.rf(context),fontFamily: "boldtext"),),
                SizedBox(
                  height: 50.rh(context),
                ),
                Container(
              height: 70.rh(context),
              width: 300.rw(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(color: Color(0xff41A545),spreadRadius: 1),
                      ],
                      color: const Color(0xffF1FEF1)
                  ),
                  child: const Center(
                    child: Text("You  Loan  enquiry  has been  approved  please  Continue",
                      textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontFamily: "boldtext",color: Color(0xff41A545)),),
                  ),
                ),
                SizedBox(
                  height: 50.rh(context),
                ),
                Center(
                  child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
                 listener: (context, state)async {
                   final preferences = await SharedPreferences.getInstance();
                   if(state is CustomeronbordingblocLoading){
                     CircularProgressIndicator();
                   }
                   if(state is CustomeronbordingblocLoaded){
                     loanCustomeronbording=state.customeronbordingstatusModel;
                     if(loanCustomeronbording?.status.toString()=="Success"){
                       Pageordereligable=loanCustomeronbording?.result!.pageOrder?.toInt();

                       BlocProvider.of<CustomerupdatenextBloc>(context).add(FetchCustomerupdate(
                           userid: preferences.getString("Userid").toString(),
                           Customercode: preferences.getString("CustomerCode").toString(),
                           PartnerCode:  preferences.getString("partnercode").toString(),
                           FlowId:preferences.getString("Flowid")??'' ,
                           PageOrder: Pageordereligable.toString(),
                           ApplicationId:  preferences.getString("applicationid").toString(),
                           PageType: preferences.getString("pagetype")??'',
                           ctx: context));
                     }
                   }
                   if(state is CustomeronbordingblocError){
                     _showErrorSnackBar(state.Errormessage);
                   }
                  // TODO: implement listener
                   },
               child: BlocListener<CustomerupdatenextBloc, CustomerupdatenextState>(
                listener: (context, state)async{
                  final preferences = await SharedPreferences.getInstance();
                  if(state is CustomerupdatenextblocLoading){
                    CircularProgressIndicator();
                  }
                  if(state is CustomerupdatenextblocLoaded){
                     loanCustomerupdatenextprocess=state.upadatenextprocessModel;
                    if(loanCustomerupdatenextprocess?.status.toString()=="Success"){
                      BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
                          userid: preferences.getString("Userid").toString(),
                          Customercode: preferences.getString("CustomerCode").toString(),
                          partnercode: preferences.getString("partnercode").toString() ,
                          agentcode: preferences.getString("agentcode").toString(),
                          ctx: context));
                      
                    }
                  }
                  if(state is CustomerupdatenextblocError){
                    _showErrorSnackBar(state.Errormessage);
                  }
                 // TODO: implement listener
                   },
                    child: BlocListener<Customeronbording2Bloc, Customeronbording2State>(
                    listener: (context, state)async {
                      if(state is Customeronbording2blocLoading){
                        CircularProgressIndicator();
                      }
                      if(state is Customeronbording2blocLoaded){
                         loanCustomeronbording2=state.customeronbording2model;
                        if(loanCustomeronbording2?.status.toString()=="Success"){
                          NavigationService.pushAndRemoveUntil(Product_value(), (Route<dynamic>route) => false);
                        }
                      }
                      if(state is Customeronbording2blocError){
                        _showErrorSnackBar(state.Errormessage);
                      }
                     // TODO: implement listener
                        },
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff41A545)
                  ),onPressed: ()async{
                        final preferences = await SharedPreferences.getInstance();
                        BlocProvider.of<CustomeronbordingBloc>(context).add(FetchCustomeronbording(
                            userid: preferences.getString("Userid").toString(),
                            Customercode: preferences.getString("CustomerCode").toString(),
                            partnercode:  preferences.getString("partnercode").toString(),
                            agentcode: preferences.getString("agentcode").toString(),
                            ctx: context));

                  }, child: Text("Continue",style: TextStyle(fontSize: 20.rf(context),color: Colors.white,fontFamily: "boldtext"),)),
),
),
),
                ),
              ],
            ),
          )
        ],
      ),
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
}
