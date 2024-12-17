

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/chooose_emi%20tenure.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/product_detalisModels/productcollateral_Model/ProductcollateralModel.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../Blocs/Customeronbording_blocs/product_detalis_blocs/Productdetalis_bloc/productdetalis_bloc.dart';
import '../../Blocs/Customeronbording_blocs/product_detalis_blocs/productCollateral_blocs/productcollateral_bloc.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../main.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import '../../modeles/customeronboradingModel/product_detalisModels/productdetalisModel/ProductdetalisModel.dart';

class Product_value extends StatefulWidget {
  const Product_value({super.key});

  @override
  State<Product_value> createState() => _Product_valueState();
}

class _Product_valueState extends State<Product_value> {
  ProductdetalisModel? productDetailsModel;
  ProductcollateralModel? productcollateralModel;
  CustomeronbordingstatusModel? productcustomeronbording;
  UpadatenextprocessModel? productCustomerupdatenextprocess;
  Customeronbording2Model? productCustomeronbording2;

  String? valueproduct;
  String? productid;
  String? addonName;
  List<String> selectedAddOns = [];
  String? productlength;
  String? productdetalisview;
  int? productPageorder;
  String? productpagename;


  bool insurancevalue=false;

  TextEditingController brandtext = TextEditingController();
  TextEditingController modeltext = TextEditingController();
  TextEditingController productvaluetext = TextEditingController();

  final List<String> productList = ['smartphone', 'car', 'bike'];
  final GlobalKey<FormState> productdetaliskey = GlobalKey<FormState>();


  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context).add(FetchMerchartToken(
        userName: "Test", password: tokenpassword, ctx: context));
    super.initState();
  }


  @override
  void dispose() {
    productvaluetext.dispose();
    modeltext.dispose();
    brandtext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Stack(
      children: [
      Padding(
      padding: EdgeInsets.only(left: 40.rw(context)),
        child: Form(
            key: productdetaliskey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.rh(context),
                ),
                 Text(
                  "Product Details",
                  style: TextStyle(
                      fontSize:28.rf(context),
                      fontFamily: "boldtext"),
                ),
                SizedBox(
                  height: 50.rh(context),
                ),
                Container(
                    height: 50.rh(context),
                    width: 300.rw(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.rw(context)),
                      child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        value: valueproduct,
                        onChanged: (value) {
                          setState(() {
                            valueproduct = value;
                          });
                        },
                        items: productList.map((PRODUCTVALUE) {
                          return DropdownMenuItem(
                            value: PRODUCTVALUE,
                            child: Text(
                              PRODUCTVALUE,
                              style:  TextStyle(
                                fontSize: 12.rf(context),
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext",
                              ),
                            ),
                          );
                        }).toList(),
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0),
                          border: InputBorder.none,
                          hintText: "Product Value",
                          hintStyle: TextStyle(
                            fontSize: 10.rf(context),
                            fontWeight: FontWeight.w800,
                            fontFamily: "regulartext",
                          ),
                          errorStyle: TextStyle(
                            fontSize: 10.rf(context),
                            fontWeight: FontWeight.w800,
                            fontFamily: "regulartext",
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 30.rh(context),
                ),
                Container(
                    height: 50.rh(context),
                    width: 300.rw(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.rw(context)),
                    child: TextFormField(
                      controller: brandtext,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your brand name";
                        }
                        return null;
                      },
                      style:  TextStyle(fontSize: 14.rf(context),
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Brand Name",
                        hintStyle: TextStyle(fontSize: 10.rf(context),
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10.rf(context),
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.rh(context),
                ),
                Container(
                    height: 50.rh(context),
                    width: 300.rw(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.rw(context)),
                    child: TextFormField(
                      controller: modeltext,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your model";
                        }
                        return null;
                      },
                      style:  TextStyle(fontSize: 14.rf(context),
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Model",
                        hintStyle: TextStyle(fontSize: 10.rf(context),
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10.rf(context),
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.rh(context),
                ),
                Container(
                    height: 50.rh(context),
                    width: 300.rw(context),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left:10.rw(context)),
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'please enter your product value';
                        }
                        return null;
                      },
                      controller: productvaluetext,
                      style:  TextStyle(fontSize: 14.rf(context),
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Product Value",
                        hintStyle: TextStyle(fontSize: 10.rf(context),
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10.rf(context),
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        suffixIcon: IconButton(onPressed: ()async{
                          if (productdetaliskey.currentState!.validate()) {
                            final preferences = await SharedPreferences
                                .getInstance();
                            BlocProvider.of<ProductdetalisBloc>(context).add(
                                FetchProductdetalis(
                                    userId: preferences.getString("Userid")
                                        .toString(),
                                    ctx: context));
                            setState(() {
                              insurancevalue = true;
                            });
                          }
                            },
                            icon: Icon(Icons.arrow_forward,color: Colors.blue,)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.rh(context),
                ),
                // insurancevalue
               //  ?
        Column(
                   children: [
                     Text(
                      "Insurance Type",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          fontFamily: "boldtext"),
                                     ),
                     BlocBuilder<ProductdetalisBloc, ProductdetalisState>(
                       builder: (context, state) {
                         if (state is ProductdetalisblocLoading) {
                           return const Center(child: CircularProgressIndicator());
                         }
                         if (state is ProductdetalisblocLoaded) {
                           productDetailsModel = state.productdetalisModel;
                           List<bool> selectedList = List.generate(
                             productDetailsModel!.result.addOns.length,
                                 (index) => false,
                           );

                           return StatefulBuilder(
                             builder: (context, setState) {
                               return ListView.builder(
                                 shrinkWrap: true,
                                 physics: const NeverScrollableScrollPhysics(),
                                 itemCount: productDetailsModel?.result.addOns.length,
                                 itemBuilder: (BuildContext context, int index) {
                                   final addonName = productDetailsModel?.result.addOns[index].addOnName?.toString() ?? 'Unknown';
                                   final addonId = productDetailsModel?.result.addOns[index].addOnId.toString();
                                   productid=productDetailsModel?.result.productId.toString();
                                   print(addonId);
                                   return Row(
                                     children: [
                                       Checkbox(
                                         shape: const CircleBorder(
                                           side: BorderSide(color: Colors.grey),
                                         ),
                                         checkColor: Colors.white,
                                         activeColor: Colors.red,
                                         value: selectedList[index],
                                         onChanged: (bool? value) {
                                           setState(() {
                                             selectedList[index] = value ?? false;
                                             if (value == true) {
                                               selectedAddOns.add(addonId!);
                                             } else {
                                               selectedAddOns.remove(addonId);
                                             }
                                             print("Selected Add-ons: $selectedAddOns");
                                           });
                                         },
                                       ),
                                       Text(
                                         addonName,
                                         style: const TextStyle(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w800,
                                           fontFamily: "boldtext",
                                           color: Colors.black,
                                         ),
                                       ),
                                     ],
                                   );
                                 },
                               );
                             },
                           );
                         }
                         if (state is ProductdetalisblocError) {
                          _showErrorSnackBar(state.Errormessage);
                         }
                         return SizedBox();
                       },
                     ),
                   ]
                 ),
            //:SizedBox(),
                SizedBox(
                  height:30.rh(context),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.rw(context)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(5)),
                      //       backgroundColor: const Color(0xff284389)),
                      //   onPressed: () {
                      //  NavigationService.pushAndRemoveUntil(, (p0) => false)
                      //   },
                      //   child: const Text(
                      //     "Previous",
                      //     style: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w800,
                      //         color: Colors.white,
                      //         fontFamily: "regulartext"),
                      //   ),
                      // ),
                      BlocListener<ProductcollateralBloc, ProductcollateralState>(
                      listener: (context, state) async{
                        final preferences = await SharedPreferences.getInstance();
                        if(state is ProductcollateralblocLoading){
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
                        if(state is ProductcollateralblocLoaded){
                         Navigator.of(context, rootNavigator: true).pop();
                         productcollateralModel=state.productcollateralModel;
                          if(productcollateralModel?.status=="Success"){
                           BlocProvider.of<CustomeronbordingBloc>(context).add(FetchCustomeronbording(
                             userid: preferences.getString("Userid").toString(),
                             Customercode: preferences.getString("CustomerCode").toString(),
                             partnercode: preferences.getString("partnercode").toString(),
                             agentcode: preferences.getString("agentcode").toString(),
                             ctx: context));
                          }
                        } if(state is ProductcollateralblocError){
                          Navigator.of(context, rootNavigator: true).pop();
                         _showErrorSnackBar(state.Errormessage);
                        }

                    },
                     child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
                        listener: (context, state)async {
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
                            Navigator.of(context, rootNavigator: true).pop();
                            final productcustomeronbording=state.customeronbordingstatusModel;
                            if(productcustomeronbording.status=="Success"){
                              productPageorder=productcustomeronbording.result?.pageOrder?.toInt();

                              BlocProvider.of<CustomerupdatenextBloc>(context).add(
                                  FetchCustomerupdate(
                                      userid:preferences.getString("Userid").toString(),
                                      Customercode: preferences.getString("CustomerCode").toString(),
                                      PartnerCode: preferences.getString("partnercode").toString(),
                                      FlowId: preferences.getString("Flowid")??"",
                                      PageOrder:productPageorder.toString(),
                                      ApplicationId: preferences.getString("applicationid").toString(),
                                      PageType: preferences.getString("pagetype")??"",
                                      ctx: context,));
                            }
                          }  if(state is CustomeronbordingblocError) {
                            Navigator.of(context, rootNavigator: true).pop();
                            _showErrorSnackBar(state.Errormessage);
                          }
                        },
                        child: BlocListener<CustomerupdatenextBloc, CustomerupdatenextState>(
                        listener: (context, state)async {
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
                             productCustomerupdatenextprocess=state.upadatenextprocessModel;
                            if(productCustomerupdatenextprocess?.status=="Success"){
                              BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
                                  userid: preferences.getString("Userid").toString(),
                                  Customercode: preferences.getString("CustomerCode").toString(),
                                  partnercode: preferences.getString("partnercode").toString(),
                                  agentcode: preferences.getString("agentcode").toString(),
                                  ctx: context));
                          }
                          }
                            if(state is CustomerupdatenextblocError) {
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
                              }
                              if(state is Customeronbording2blocLoaded){
                                Navigator.of(context, rootNavigator: true).pop();
                                final productcustomeronbording2=state.customeronbording2model;
                                if(productcustomeronbording2.status=="Success"){
                                  productpagename=productcustomeronbording2.result!.pageName.toString();
                                  if(productpagename=="EMI"){
                                    NavigationService.pushAndRemoveUntil(Choose_your_emi_tenure(), (Route<dynamic>route) => false);
                                  }else{
                                    _showErrorSnackBar("not page not allowed");
                                    NavigationService.pushAndRemoveUntil(Product_value(), (Route<dynamic>route) => false);
                                  }
                                }
                              }
                              if(state is Customeronbording2blocError){
                                _showErrorSnackBar(state.Errormessage);
                              }
                                // TODO: implement listener
                                },
                             child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0xff284389)),
                        onPressed: () async {
                         final preferences = await SharedPreferences.getInstance();
                          if (productdetaliskey.currentState!.validate()) {
                         BlocProvider.of<ProductcollateralBloc>(context).add(FetchProductcollateral(
                               userId: preferences.getString("Userid").toString(),
                               Customercode: preferences.getString("CustomerCode").toString(),
                                ApplicationId: preferences.getString("applicationid").toString(),
                                ProductName:valueproduct.toString(),
                                BrandName: brandtext.text,
                                ModelName: modeltext.text,
                                ProductValue: productvaluetext.text,
                                ProductId:productid.toString(),
                                AddOnId:selectedAddOns.join("") ,
                                ctx: context));

                          }
                        },
                        child:  Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 20.rf(context),
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              fontFamily: "regulartext"),
                        ),
                      ),
),
),
),
),
                    ],
                  ),
                ),
                
                SizedBox(
                  height: 50.rh(context),
                )
              ],
            )
        )
    )
    ]
    )
      )
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


