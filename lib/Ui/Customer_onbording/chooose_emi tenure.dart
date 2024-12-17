import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Emicalculator_blocs/Emitenuresendotp_bloc/emitenuresendotp_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/product_detalis_blocs/Productdetalis_bloc/productdetalis_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import 'package:oroboro_assisted_app/modeles/EmicalculatorModels/EmitenuresendOtpModel/EmitenureModel.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Blocs/Customeronbording_blocs/Emicalculator_blocs/calculatoremi_bloc/calculatoremi_bloc.dart';
import '../../main.dart';
import '../../widgets/NavigationServies.dart';
import 'OtpEmitenure.dart';

class Choose_your_emi_tenure extends StatefulWidget {
  const Choose_your_emi_tenure({super.key});

  @override
  State<Choose_your_emi_tenure> createState() => _Choose_your_emi_tenureState();
}
EmitenuresendotpModel?isemitenuresendotpmodel;
bool valiuesdisplay=false;
class _Choose_your_emi_tenureState extends State<Choose_your_emi_tenure> {
  String? emiamout;
  String? emitenure;
  String?emifrequenies;
  String? emiproductid;
  double ?loanamout;

  List<String> amounts = [];
  List<String> emiTenures = [];
  List<String> frequencies = ["Monthly"];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MerchartTokenBloc>(context).add(FetchMerchartToken(
        userName: "Test", password: tokenpassword, ctx: context));
    fetchProductDetails();
  }

  Future<void> fetchProductDetails() async {
    final preferences = await SharedPreferences.getInstance();
    BlocProvider.of<ProductdetalisBloc>(context).add(
      FetchProductdetalis(
        userId: preferences.getString("Userid") ?? "",
        ctx: context,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProductdetalisBloc, ProductdetalisState>(
        builder: (context, state) {
          if (state is ProductdetalisblocLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductdetalisblocLoaded){
            final productDetails = state.productdetalisModel;

            // Ensure null safety for result
            if (productDetails?.result == null) {
              return const Center(
                child: Text(
                  "No product details available.",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            }

            // Safely extract datapp

            amounts = productDetails.result?.allowedAmounts
                ?.map((item) =>item.amount.toString())
                .toList() ??
                [];
            emiTenures = productDetails.result?.tenure
                ?.map((item) => item.tenure.toString())
                .toList() ??
                [];
            // frequencies = productDetails.result?.tenure
            //     ?.map((item) => item.frequency.toString())
            //     .toList() ??
            //     [];

            emiproductid=productDetails.result.productId.toString();
            return buildEMISelectionUI();
          }

          if (state is ProductdetalisblocError) {
           _showErrorSnackBar(state.Errormessage);
          }

          return const Center(child: Text("No data available."));
        },
      ),
    );
  }

  Widget buildEMISelectionUI() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40.rw(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:100.rh(context)),
                 Text(
                  "Choose your EMI Tenure",
                  style: TextStyle(
                    fontSize: 28.rf(context),
                    fontFamily: "boldtext",),
                ),
                SizedBox(height: 80.rh(context)),
                Text("choose Loan Amount ",style: TextStyle(
                  fontSize: 18.rf(context),
                  fontFamily: "regulartext",
                ),),
                SizedBox(
                  height: 20.rh(context)
                ),
                Container(
                    height: 50.rh(context),
                    width: 300.rw(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.rw(context)),
                    child: DropdownButtonFormField<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      value: emiamout,
                      onChanged: (value) {
                        setState(() {
                          emiamout = value;
                        });
                      },
                      items: amounts.map((amout) {
                        return DropdownMenuItem(
                          value: amout,
                          child: Text(
                            amout,
                            style:  TextStyle(
                              fontSize: 12.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext",
                            ),
                          ),
                        );
                      }).toList(),
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        border: InputBorder.none,
                        hintText: "__Choose__",
                        hintStyle: TextStyle(
                          fontSize: 10.rf(context),
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext",
                        ),
                        errorStyle: TextStyle(
                          fontSize: 10.rf(context),
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.rh(context)),
                Text("choose  EMI Tenure ",style: TextStyle(
                  fontSize: 18.rf(context),
                  fontFamily: "regulartext",
                ),),
                SizedBox(
                  height: 20.rh(context),
                ),
                Container(
                    height: 50.rh(context),
                    width: 300.rw(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.rw(context)),
                    child: DropdownButtonFormField<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      value: emitenure,
                      onChanged: (value) {
                        setState(() {
                         emitenure = value;
                        });
                      },
                      items: emiTenures.map((tenure) {
                        return DropdownMenuItem(
                          value: tenure,
                          child: Text(
                            tenure,
                            style:  TextStyle(
                              fontSize: 12.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext",
                            ),
                          ),
                        );
                      }).toList(),
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        border: InputBorder.none,
                        hintText: "__Choose__",
                        hintStyle: TextStyle(
                          fontSize: 10.rf(context),
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext",
                        ),
                        errorStyle: TextStyle(
                          fontSize: 10.rf(context),
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext",
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height:30.rh(context)),
                Text("choose  the Frequency",style: TextStyle(
                  fontSize: 18.rf(context),
                  fontFamily: "regulartext",
                ),),
                SizedBox(
                  height: 20.rh(context)
                ),
                Container(
                    height: 50.rh(context),
                    width: 300.rw(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.rw(context)),
                    child: DropdownButtonFormField<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      value: emifrequenies,
                      onChanged: (value) {
                        setState(() {
                          emifrequenies = value;

                        });
                      },
                      items: frequencies.map((frequey) {
                        return DropdownMenuItem(
                          value: frequey,
                          child: Text(
                            frequey,
                            style:  TextStyle(
                              fontSize: 12.rf(context),
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext",
                            ),
                          ),
                        );
                      }).toList(),
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        border: InputBorder.none,
                        hintText: "__Choose__",
                        hintStyle: TextStyle(
                          fontSize: 10.rf(context),
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext",
                        ),
                        errorStyle: TextStyle(
                          fontSize: 10.rf(context),
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height:40.rh(context)
                ),
                Center(
                  child:valiuesdisplay
                 ?SizedBox() :ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: const Color(0xff284389),
                    ),
                    onPressed: () async{
                      final preferences = await SharedPreferences.getInstance();
                      BlocProvider.of<CalculatoremiBloc>(context).add(Fetchcalculatoremi(
                          userid:  preferences.getString("Userid").toString(),
                          Customercode:  preferences.getString("CustomerCode").toString(),
                          ApplicationId:  preferences.getString("applicationid").toString(),
                          partnercode:  preferences.getString("partnercode").toString(),
                          agentcode:  preferences.getString("agentcode").toString(),
                          Loanamout: emiamout.toString(),
                          ProductId: emiproductid.toString(),
                          Tenure: emitenure.toString(),
                          Frequency: emifrequenies.toString(),
                          ctx: context));
                      preferences.setString("Emiproductid", emiproductid.toString());
                      setState(() {
                        valiuesdisplay=true;
                      });
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 20.rf(context),
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontFamily: "regulartext",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.rh(context)
                ),

                valiuesdisplay
                    ? BlocBuilder<CalculatoremiBloc, CalculatoremiState>(
                      builder: (context, state){
                        if(state is CalculatoremiblocLoading){
                        CircularProgressIndicator();
                        }
                        if(state is CalculatoremiblocLoaded){
                        final calculationproduct=state.calculatoremiModel;


                         if (calculationproduct?.result == null) {
                           return const Center(
                            child: Text("No product details available.",
                              style: TextStyle(color: Colors.red, fontSize: 16),
                            ),
                          );
                        }
                      final baseloanamout=calculationproduct?.result?.baseLoanAmount;
                       final  Tenurenumber=calculationproduct.result?.tenure??"";
                       final  frequencydata=calculationproduct.result!.frequency??"";
                       final  Emimonuthly=calculationproduct.result?.emi??"";
                        print(loanamout);
                        print(calculationproduct.result?.tenure);
                        print(calculationproduct.result?.frequency);
                        print(calculationproduct.result?.emi);



                        return SizedBox(
                        height: 230.rh(context), // Adjust height as needed
                        child:Padding(
                        padding: EdgeInsets.only(left:15.rw(context) ,right:50.rw(context)),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Row(
                        children: [
                         Text("Loan Amount",style: TextStyle(
                           fontSize: 18,
                           color: Colors.black,
                           fontFamily: "regulartext",
                         ),),
                        const Spacer(),
                         Text(baseloanamout.toString(),style: TextStyle(
                           fontSize: 18,
                           color: Colors.black,
                           fontFamily: "regulartext",
                         ),),
                        ],
                        ),
                        SizedBox(
                        height: 20.rh(context)
                        ),
                        Row(
                        children: [
                         Text("Tenure",style: TextStyle(
                             fontSize: 18,
                             color: Colors.black,
                             fontFamily: "regulartext",
                         ),),
                        const Spacer(),
                         Text(Tenurenumber.toString(),style: TextStyle(
                           fontSize: 18,
                           color: Colors.black,
                           fontFamily: "regulartext",
                         ),),
                        ],
                        ),
                        SizedBox(
                        height: 20.rh(context),
                        ),
                          Row(
                            children: [
                              Text("EMI Amount",style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "regulartext",
                              ),),
                              const Spacer(),
                              Text(Emimonuthly.toString(),style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: "regulartext",
                              ),),
                            ],
                          ),
                         SizedBox(
                           height:30.rh(context),
                         ),
                          Center(
                            child: BlocListener<EmitenuresendotpBloc, EmitenuresendotpState>(
                            listener: (context, state) {
                              if(state is EmitenuresendotpblocLoading){
    showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
    return const Center(child: CircularProgressIndicator());
    },
    );
    }
                              if(state is EmitenuresendotpblocLoaded){
                                Navigator.of(context, rootNavigator: true).pop();
                                isemitenuresendotpmodel=state.emitenuresendotpModel;
                                if(isemitenuresendotpmodel?.status=="Success"){

                                    NavigationService.pushAndRemoveUntil(
                                        OtpEmitenure(), (
                                        Route<dynamic>route) => false);
                                }
                              }
                              if(state is EmitenuresendotpblocError){
                              _showErrorSnackBar(state.Errormessage);
                                }
                             // TODO: implement listener
                              },
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: const Color(0xff284389),
                              ),
                              onPressed: () async{
                                final preferences = await SharedPreferences.getInstance();
                                BlocProvider.of<EmitenuresendotpBloc>(context).add(FetchEmitenuresendotp(
                                    userid: preferences.getString("Userid").toString(),
                                    Customercode: preferences.getString("CustomerCode").toString(),
                                    mobilenumber: preferences.getString("onbordingmobile").toString(),
                                    Loanamout: baseloanamout.toString(),
                                    Tenure: Tenurenumber.toString(),
                                    Emi: Emimonuthly.toString(),
                                    ctx: context));
                                  preferences.setString("loanamout", baseloanamout.toString());
                                  preferences.setString("tenurevalue", Tenurenumber.toString());
                                  preferences.setString("Emimonuthly", Emimonuthly.toString());
                                  preferences.setString("frequency", frequencydata.toString());
                                },
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                             fontSize: 16,
                             fontWeight: FontWeight.w800,
                             color: Colors.white,
                             fontFamily: "regulartext",
                                                            ),
                                                          ),
                                                        ),
),
                          ),

                        ],

                        ),
                        )
                        );
                        }if(state is CalculatoremiblocError){
                        _showErrorSnackBar(state.Errormessage);
                        }
                        return Container();
                        }
                    )
                    : const SizedBox(),

                SizedBox(
                  height: 60.rh(context),
                ),
              ],
            ),
          ),
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
