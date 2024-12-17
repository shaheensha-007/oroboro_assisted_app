import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Signin/signin_page.dart';
import 'package:oroboro_assisted_app/modeles/UserdetalisModel/UserdetalisModel.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../Blocs/Userdetalis_bloc/userdetalis_bloc.dart';
import '../../main.dart';
import '../../notification.dart';
import '../AlertDialog/Restpassword.dart';
import '../Customer_onbording/Customer_onbording_mobile.dart';
import '../Emi_ calculater/Emi_calculator.dart';
import '../LOAN/Loan_detalis/loan_detalis.dart';
import '../Ledger/ledger.dart';
import '../apparbar/drawer.dart';
import '../cash_flow/cash_flow.dart';
import '../mandate status/mandate stauts.dart';
import '../payments/payments.dart';
import '../schedules/schedule.dart';
import 'barchart.dart';
import 'linechart.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key,});
  @override
  State<Mainhome> createState() => _MainhomeState();
}

final _controller01 = ValueNotifier<bool>(false);
final __controller02 = ValueNotifier<bool>(false);
TextEditingController showenterie = TextEditingController();
TextEditingController homeSearch = TextEditingController();


UserdetalisModel? userdetalisModel;

String? MainUsername;

class _MainhomeState extends State<Mainhome> {
  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context).add(FetchMerchartToken(
        userName: "Test",
        password:tokenpassword,
      ctx: context
    ));
    // TODO: implement initState
    super.initState();
    fetchuserdetlisDetails();
  }

  Future<void> fetchuserdetlisDetails() async {
    final preferences = await SharedPreferences.getInstance();
  BlocProvider.of<UserdetalisBloc>(context).add(FetchUserdetalis(
      userId: preferences.getString("Userid")??"",
      Identity: preferences.getString("Userid")??"",
      ctx: context));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(30),
          ),
          child: drawer(), // Ensure this is the correct import for your drawer
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
            shadowColor: Colors.white,
            surfaceTintColor: Colors.white,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 10.rw(context)),
                  child: IconButton(
                      onPressed: () {
                     NavigationService.pushAndRemoveUntil(Notification1(), (Route<dynamic>route) => false);
                      },
                      icon: const Icon(Icons.notifications)),
                ),
                SizedBox(
                  width: 1.rw(context),
                ),
                PopupMenuButton<String>(
                    color: Color(0xff284389),
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const MyDialog();
                                  },
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Change Password",
                                    style: TextStyle(
                                        fontSize: 16.rf(context),
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontFamily: "regulartext"),
                                  )
                                ],
                              )),
                          PopupMenuItem(
                              onTap: () {

                               NavigationService.pushAndRemoveUntil(Signin_page(), (Route<dynamic>route) => false);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                        fontSize: 16.rf(context),
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontFamily: "regulartext"),
                                  )
                                ],
                              ))
                        ])
              ],
            )),
        body: Stack(children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.rh(context),
                  ),
                  Center(
                    child: BlocBuilder<UserdetalisBloc, UserdetalisState>(
                            builder: (context, state) {
                              if(state is UserdetalisblocLoaded) {
                                userdetalisModel = state.userdetalisModel;
                                final mainusername = userdetalisModel?.result
                                    ?.first.name;
                                final Mainpartnername=userdetalisModel?.result?.first.partnername;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage("assets/oroboro.png"),
                                      width: 600.rw(context),
                                    ),
                                    SizedBox(
                                      height: 10.rh(context),
                                    ),
                                    Text(mainusername??"No value",
                                      style: TextStyle(fontSize: 25.rf(context),
                                          fontFamily: "boldtext"),
                                    ),
                                    Text(
                                      Mainpartnername??"No value",
                                      style: TextStyle(fontSize: 25.rf(context),
                                          fontFamily: "boldtext"),
                                    )
                                  ],
                                );
                              }
                              if(state is UserdetalisblocError){
                                SizedBox();
                              }
                              return Container();
  },
),
                  ),
                  SizedBox(
                    height: 50.rh(context),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Color(0xff1C3984),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60.rh(context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.rw(context)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                NavigationService.pushAndRemoveUntil(Customer_onbording_mobile(), (Route<dynamic>route) => false);
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 10.rh(context)),
                                  child: Container(
                                    child:  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/consumer onbording.png"),
                                          height: 55.rh(context),
                                            width:59.rw(context)
                                        ),
                                        Text(
                                          "Customer",
                                          style: TextStyle(
                                              fontSize: 18.rf(context),
                                              fontFamily: "regulartext",
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Onboarding",
                                          style: TextStyle(
                                              fontSize: 18.rf(context),
                                              fontFamily: "regulartext",
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                   NavigationService.pushAndRemoveUntil(Loan_detalis(), (Route<dynamic>route) => false);
                                },
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage("assets/Loan.png"),
                                        height: 44.rh(context),
                                          width:41.rw(context)
                                      ),
                                      SizedBox(
                                        height: 10.rh(context)
                                      ),
                                       Text(
                                        "Loan",
                                        style: TextStyle(
                                            fontSize: 18.rf(context),
                                            fontFamily: "regulartext",
                                            color: Colors.white),
                                      ),
                                       Text(
                                        "Details",
                                        style: TextStyle(
                                            fontSize: 18.rf(context),
                                            fontFamily: "regulartext",
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 20.rw(context)),
                                child: GestureDetector(
                                  onTap: () {
                                  NavigationService.pushAndRemoveUntil(Emi_calculator(), (Route<dynamic>route) => false);
                                  },
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/emi calculator.png"),
                                          height: 44.rh(context),
                                            width:41.rw(context)
                                        ),
                                        SizedBox(
                                          height: 10.rh(context)
                                        ),
                                         Text(
                                          "EMI",
                                          style: TextStyle(
                                              fontSize: 18.rf(context),
                                              fontFamily: "regulartext",
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Calculator",
                                          style: TextStyle(
                                              fontSize: 18.rf(context),
                                              fontFamily: "regulartext",
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height:50.rh(context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.rw(context)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/notification.png"),
                                      height: 55.rh(context),
                                        width:41.rw(context)
                                    ),
                                    SizedBox(
                                      height: 10.rh(context),
                                    ),
                                     Text(
                                      "Notification",
                                      style: TextStyle(
                                          fontSize: 18.rf(context),
                                          fontFamily: "regulartext",
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                NavigationService.pushAndRemoveUntil(Ledger(), (Route<dynamic>route) => false);
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                       Center(
                                          child: Image(
                                        image: AssetImage("assets/Ledger.png"),
                                            height: 55.rh(context),
                                            width:41.rw(context),
                                      )),
                                      SizedBox(
                                        height:10.rh(context),
                                      ),
                                       Text(
                                        "Ledger",
                                        style: TextStyle(
                                            fontSize: 18.rf(context),
                                            fontFamily: "regulartext",
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                              NavigationService.pushAndRemoveUntil(Cash_flow(), (Route<dynamic>route) => false);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 25.rw(context)),
                                  child: Container(
                                    child: Column(
                                      children: [
                                         Center(
                                            child: Image(
                                          image: AssetImage(
                                              "assets/cash-flow 1.png"),
                                                height: 55.rh(context),
                                                width:41.rw(context)
                                        )),
                                        SizedBox(
                                          height:10.rh(context),
                                        ),
                                         Text(
                                          "Cash Flow",
                                          style: TextStyle(
                                              fontSize: 18.rf(context),
                                              fontFamily: "regulartext",
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.rh(context),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const Payments()),
                                (route) => false);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left:25.rw(context)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            "assets/payment.png"),
                                          height: 55.rh(context),
                                          width:41.rw(context)
                                      ),
                                      SizedBox(
                                        height: 10.rh(context),
                                      ),
                                       Text(
                                        "Payment",
                                        style: TextStyle(
                                            fontSize: 18.rf(context),
                                            fontFamily: "regulartext",
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    NavigationService.pushAndRemoveUntil(Schedule(), (Route<dynamic>route) => false);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 25.rw(context)),
                                    child: Container(
                                      child: Column(
                                        children: [
                                           Center(
                                              child: Image(
                                            image: AssetImage(
                                                "assets/Schedules icon.png"),
                                                  height: 44.rh(context),
                                                  width:41.rw(context)
                                          )),
                                          SizedBox(
                                            height:25.rh(context),
                                          ),
                                           Text(
                                            "Schedules",
                                            style: TextStyle(
                                                fontSize: 18.rf(context),
                                                fontFamily: "regulartext",
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                  NavigationService.pushAndRemoveUntil(Mandate_Status(), (Route<dynamic>route) => false);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: 10.rw(context)),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Center(
                                              child: Image(
                                            image: AssetImage(
                                                "assets/mandateStatus.png"),
                                                  height: 55.rh(context),
                                                  width:41.rw(context)
                                          )),
                                          SizedBox(
                                            height:15.rh(context),
                                          ),
                                          Text(
                                            "Mandate Status",
                                            style: TextStyle(
                                                fontSize: 18.rf(context),
                                                fontFamily: "regulartext",
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.rh(context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.rw(context)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                   Text(
                                    "Year",
                                    style: TextStyle(
                                        fontSize: 16.rf(context),
                                        fontFamily: "regulartext",
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 20.rw(context),
                                  ),
                                  AdvancedSwitch(
                                    height: 30.rh(context),
                                    activeColor: Colors.blue,
                                    controller: _controller01,
                                    thumb: ValueListenableBuilder<bool>(
                                      valueListenable: _controller01,
                                      builder: (_, value, __) {
                                        return Center(
                                          child: Icon(
                                            value ? Icons.circle : Icons.circle,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.rw(context),
                                  ),
                                   Text(
                                    "Month",
                                    style: TextStyle(
                                        fontSize: 16.rf(context),
                                        fontFamily: "regulartext",
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.rh(context),
                              ),
                              Container(
                                height: 100.rh(context),
                                width: 330.rw(context),
                                decoration: BoxDecoration(
                                  color: const Color(0xff1C3984),
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black,
                                      blurRadius: 20.0,
                                    ),

                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    ClipPath(
                                      clipper: CustomPath(),
                                      child: Container(
                                        height: 150.rh(context),
                                        width: 190.rw(context),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left:30.rw(context)),
                                              child: const Center(
                                                  child: Image(
                                                      image: AssetImage(
                                                          "assets/graph-line2 1.png"))),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: 50.rw(context)),
                                      child:  Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Total Loan",
                                            style: TextStyle(
                                                fontSize: 16.rf(context),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "regulartext",
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "20000",
                                            style: TextStyle(
                                                fontSize: 20.rf(context),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "regulartext",
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.rh(context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 25.rw(context)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Year",
                                    style: TextStyle(
                                        fontSize: 16.rf(context),
                                        fontFamily: "regulartext",
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 20.rw(context),
                                  ),
                                  AdvancedSwitch(
                                    height: 30.rh(context),
                                    activeColor: Colors.blue,
                                    controller: __controller02,
                                    thumb: ValueListenableBuilder<bool>(
                                      valueListenable: __controller02,
                                      builder: (_, value, __) {
                                        return Icon(
                                          value ? Icons.circle : Icons.circle,
                                          color: Colors.white,
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.rw(context),
                                  ),
                                   Text(
                                    "Month",
                                    style: TextStyle(
                                        fontSize: 16.rf(context),
                                        fontFamily: "regulartext",
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:30.rh(context),
                              ),
                              Container(
                                height: 100.rh(context),
                                width: 330.rw(context),
                                decoration: BoxDecoration(
                                  color: const Color(0xff1C3984),
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black,
                                      blurRadius: 20.0,
                                    ),

                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    ClipPath(
                                      clipper: CustomPath(),
                                      child: Container(
                                   height: 150.rh(context),
                                   width: 190.rw(context),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30.rw(context)),
                                              child: const Center(
                                                  child: Image(
                                                      image: AssetImage(
                                                          "assets/graph-line2 1.png"))),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right:50.rw(context)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Total Loan",
                                            style: TextStyle(
                                                fontSize: 16.rf(context),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "regulartext",
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "20000",
                                            style: TextStyle(
                                                fontSize: 20.rf(context),
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "regulartext",
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 60.rh(context),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:50.rh(context),
                  ),
                   Center(
                    child: Text(
                      "Current Year Sales",
                      style: TextStyle(
                          fontSize: 18.rf(context),
                          fontFamily: "boldtext",
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 20.rh(context),
                  ),
                  const Barchart(),
                  SizedBox(
                    height: 50.rh(context),
                  ),
                   Center(
                    child: Text(
                      "Current  FY-Sales ",
                      style: TextStyle(
                          fontSize: 18.rf(context),
                          fontFamily: "boldtext"),
                    ),
                  ),
                  SizedBox(
                    height: 20.rh(context),
                  ),
                  const Linechart(),
                  SizedBox(
                    height: 50.rh(context),
                  ),
                   Center(
                    child: Text(
                      "Recent  Activities",
                      style: TextStyle(
                          fontSize: 18.rf(context),
                          fontFamily: "boldtext"),
                    ),
                  ),
                  SizedBox(
                    height: 30.rh(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.rw(context)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                             Text("Show entries",
                                style: TextStyle(
                                    fontSize: 12.rf(context),
                                    fontFamily: "regulartext",
                                  fontWeight: FontWeight.w800
                                )),
                            SizedBox(
                              width: 20.rw(context),
                            ),
                            Container(
                              height: 30.rh(context),
                              width: 100.rw(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 1),
                                  ],
                                  color: Colors.white),
                              child: TextFormField(
                                controller: showenterie,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4)
                                ],
                                style:  TextStyle(
                                    fontSize: 12.rf(context),
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext"),
                                decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 12.rf(context),
                                      fontFamily: "regulartext",
                                      fontWeight: FontWeight.w200),
                                  errorStyle: TextStyle(
                                      fontSize: 12.rf(context),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.rh(context),
                        ),
                        Row(
                          children: [
                            Text("Search",
                                style: TextStyle(
                                    fontSize: 12.rf(context),
                                    fontFamily: "regulartext",
                                    fontWeight: FontWeight.w800)),
                            SizedBox(
                              width: 20.rw(context),
                            ),
                            Container(
                              height: 30.rh(context),
                              width: 50.rw(context),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 1),
                                  ],
                                  color: Colors.white),
                              child: TextFormField(
                                controller: homeSearch,
                                keyboardType: TextInputType.text,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(4)
                                ],
                                style: TextStyle(
                                    fontSize: 12.rf(context),
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext"),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 12.rf(context),
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext"),
                                  errorStyle: TextStyle(
                                      fontSize: 12.rf(context),
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext"),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.rh(context),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.rw(context)),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  EdgeInsets.only(right: 10.rw(context)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 40.rh(context),
                                    ),
                                    SizedBox(
                                      height: 130.rh(context),
                                      child: Container(
                                        height: 50.rh(context),
                                        width: 300.rw(context),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                spreadRadius: 2),
                                          ],
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 20.rh(context)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(children: [
                                                SizedBox(
                                                  height: 110.rh(context),
                                                  width: 80.rw(context),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20.rw(context)),
                                                    child: const Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Agent",
                                                            style: TextStyle(
                                                                fontSize: 9,
                                                                fontFamily:
                                                                    "boldtext",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xff284389))),
                                                        Text(
                                                            "shaheenpk",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    11,
                                                                fontFamily:
                                                                    "regulartext",
                                                               )),
                                                        Divider(),
                                                        Text("PAN",
                                                            style: TextStyle(
                                                                fontSize: 9,
                                                                fontFamily:
                                                                    "boldtext",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Color(
                                                                    0xff284389))),
                                                        FittedBox(
                                                            child: Text(
                                                                "HSHPP1158J",
                                                                style: TextStyle(
                                                                  fontSize:
                                                                  11,
                                                                  fontFamily:
                                                                  "regulartext",))),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30.rw(context),
                                                ),
                                                SizedBox(
                                                  height: 110.rh(context),
                                                  width: 80.rw(context),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left:20.rh(context)),
                                                    child: const Column(
                                                      children: [
                                                        Text("Customer",
                                                            style: TextStyle(
                                                                fontSize: 9,
                                                                fontFamily:
                                                                "boldtext",
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Color(
                                                                    0xff284389))),
                                                        FittedBox(
                                                            child: Text("RAVI",
                                                                style: TextStyle(
                                                                  fontSize:
                                                                  11,
                                                                  fontFamily:
                                                                  "regulartext",))),
                                                        Divider(),
                                                        Text("LOAN NO",
                                                            style: TextStyle(
                                                                fontSize: 9,
                                                                fontFamily:
                                                                "boldtext",
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Color(
                                                                    0xff284389))),
                                                        FittedBox(
                                                            child: Text(
                                                                "ORO003A11-9009",
                                                                style: TextStyle(
                                                                  fontSize:
                                                                  11,
                                                                  fontFamily:
                                                                  "regulartext",))),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:30.rw(context),
                                                ),
                                                SizedBox(
                                                  height: 110.rh(context),
                                                  width: 80.rw(context),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20.rw(context)),
                                                    child: const Column(
                                                      children: [
                                                        Text("Amount",
                                                            style: TextStyle(
                                                                fontSize: 9,
                                                                fontFamily:
                                                                "boldtext",
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Color(
                                                                    0xff284389))),
                                                        FittedBox(
                                                            child: Text("590000",
                                                                style: TextStyle(
                                                                  fontSize:
                                                                  11,
                                                                  fontFamily:
                                                                  "regulartext",))),
                                                        Divider(),
                                                        Text("Status",
                                                            style: TextStyle(
                                                                fontSize: 9,
                                                                fontFamily:
                                                                "boldtext",
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Color(
                                                                    0xff284389))),
                                                        FittedBox(
                                                            child: Text("Active",
                                                                style: TextStyle(
                                                                  fontSize:
                                                                  11,
                                                                  fontFamily:
                                                                  "regulartext",
                                                                  color: Colors.green
                                                                ))),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ])
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50.rh(context),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}

class CustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width - 50, 0);
    path.lineTo(size.width - 10, size.height);
    path.lineTo(size.width - 0, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
