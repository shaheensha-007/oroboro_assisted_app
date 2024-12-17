import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/homepage/Mainhome_page.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/LoanmessageModel/LoanMessageModel.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/Loanmessage_bloc/loanmessage_bloc.dart';
import '../LOAN/Loan_detalis/loan_detalis.dart';

class Loan_is_verification extends StatefulWidget {
  const Loan_is_verification({super.key});

  @override
  State<Loan_is_verification> createState() => _Loan_is_verificationState();
}
LoanMessageModel? isloanMessageModel;

class _Loan_is_verificationState extends State<Loan_is_verification> {
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
                   height: 150.rh(context),
                 ),
                SizedBox(
                  height: 50.rh(context)
                ),
                 Text("Loan is out for Verification ", style: TextStyle(fontSize: 28.rf(context),fontFamily: "boldtext"),),
                SizedBox(
                  height: 50.rh(context)
                ),
                Container(
                height:60.rh(context),
                  width: 300.rw(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(color: Color(0xff41A545),spreadRadius: 1),
                      ],
                      color: const Color(0xffF1FEF1)
                  ),
                  child: const Center(
                    child: Text("Loan details Successfully Updated. Amount will Disbursed afther Verification",
                      textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xff41A545)),),
                  ),
                ),
                SizedBox(
                  height: 100.rh(context)
                ),
                Center(
                  child: BlocListener<LoanmessageBloc, LoanmessageState>(
                      listener: (context, state) async{

                        if(state is LoanmessageblocLoading){
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
                        if(state is LoanmessageblocLoaded){
                          Navigator.of(context, rootNavigator: true).pop();
                          isloanMessageModel=state.loanMessageModel;
                          if(isloanMessageModel?.status=="Success"){
                            NavigationService.pushAndRemoveUntil(Mainhome(), (Route<dynamic>route) => false);
                          }
                        }
                        if(state is LoanmessageblocError){
                         _showErrorSnackBar(state.Errormessage);
                        }
                        },
                      child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff41A545)
                  ),onPressed: ()async{
                        final preferences = await SharedPreferences.getInstance();
                        BlocProvider.of<LoanmessageBloc>(context).add(Fetchloanmessage(
                            LoanId: preferences.getString("LoanId")??'',
                            ctx: context));

                  }, child: Text("Continue",style: TextStyle(fontSize: 20.rf(context),color: Colors.white,fontFamily: "boldtext"),)),
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
