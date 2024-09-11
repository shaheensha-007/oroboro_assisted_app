import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Signin/signin_page.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
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
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

final _controller01 = ValueNotifier<bool>(false);
final __controller02 = ValueNotifier<bool>(false);
TextEditingController showenterie = TextEditingController();
TextEditingController homeSearch = TextEditingController();

class _MainhomeState extends State<Mainhome> {
  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context).add(FetchMerchartToken(
        userName: "Test",
        password:
        "RkQtQTMtRDMtRjctMDktMTItMzItRjQtNDUtQTMtNjItMTMtQUQtQjItQTMtMDY="));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
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
                  padding: EdgeInsets.only(right: mwidth * 0.03),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const Notification1()),
                            (route) => false);
                      },
                      icon: const Icon(Icons.notifications)),
                ),
                SizedBox(
                  width: mwidth * 0.03,
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
                                    "Restpasssword",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontFamily: "regulartext"),
                                  )
                                ],
                              )),
                          PopupMenuItem(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signin_page()));
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                        fontSize: 16,
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
                    height: mheight * 0.03,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage("assets/oroboro.png"),
                        ),
                        SizedBox(
                          height: mheight * 0.02,
                        ),
                        const Text(
                          "Shivan Electronics",
                          style: TextStyle(fontSize: 25, fontFamily: "headers"),
                        ),
                        const Text(
                          "Jetfinix Services",
                          style: TextStyle(fontSize: 18, fontFamily: "shorts"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.05,
                  ),
                  Container(
                    height: mheight,
                    width: mwidth,
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
                          height: mheight * 0.06,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: mwidth * 0.1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Customer_onbording_mobile()),
                                      (route) => false);
                                },
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: mheight * 0.01),
                                  child: Container(
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 60,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/consumer onbording.png"),
                                            )),
                                        Text(
                                          "Customer",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "regulartext",
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "Onboarding",
                                          style: TextStyle(
                                              fontSize: 18,
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
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Loan_detalis()),
                                      (route) => false);
                                },
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage("assets/Loan.png"),
                                      ),
                                      SizedBox(
                                        height: mheight * 0.01,
                                      ),
                                      const Text(
                                        "Loan",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "regulartext",
                                            color: Colors.white),
                                      ),
                                      const Text(
                                        "Details",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "regulartext",
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: mwidth * 0.10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Emi_calculator()),
                                        (route) => false);
                                  },
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/emi calculator.png"),
                                        ),
                                        SizedBox(
                                          height: mheight * 0.01,
                                        ),
                                        const Text(
                                          "EMI",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "regulartext",
                                              color: Colors.white),
                                        ),
                                        const Text(
                                          "Calculator",
                                          style: TextStyle(
                                              fontSize: 18,
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
                          height: mheight * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: mwidth * 0.1),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 45,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/notification.png"),
                                        )),
                                    SizedBox(
                                      height: mheight * 0.01,
                                    ),
                                    const Text(
                                      "Notification",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "regulartext",
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => const Ledger()),
                                      (route) => false);
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      const Center(
                                          child: Image(
                                        image: AssetImage("assets/Ledger.png"),
                                      )),
                                      SizedBox(
                                        height: mheight * 0.01,
                                      ),
                                      const Text(
                                        "Ledger",
                                        style: TextStyle(
                                            fontSize: 18,
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
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Cash_flow()),
                                      (route) => false);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: mwidth * 0.1),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        const Center(
                                            child: Image(
                                          image: AssetImage(
                                              "assets/cash-flow 1.png"),
                                        )),
                                        SizedBox(
                                          height: mheight * 0.01,
                                        ),
                                        const Text(
                                          "Cash Flow",
                                          style: TextStyle(
                                              fontSize: 18,
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
                          height: mheight * 0.05,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const Payments()),
                                (route) => false);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          height: 40,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/payment.png"),
                                          )),
                                      SizedBox(
                                        height: mheight * 0.01,
                                      ),
                                      const Text(
                                        "Payment",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "regulartext",
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Schedule()),
                                        (route) => false);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: mwidth * 0.05),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          const Center(
                                              child: Image(
                                            image: AssetImage(
                                                "assets/Schedules icon.png"),
                                          )),
                                          SizedBox(
                                            height: mheight * 0.01,
                                          ),
                                          const Text(
                                            "Schedules",
                                            style: TextStyle(
                                                fontSize: 18,
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
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Mandate_Status()),
                                        (route) => false);
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(right: mwidth * 0.05),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          const Center(
                                              child: Image(
                                            image: AssetImage(
                                                "assets/mandateStatus.png"),
                                          )),
                                          SizedBox(
                                            height: mheight * 0.01,
                                          ),
                                          const Text(
                                            "Mandate Status",
                                            style: TextStyle(
                                                fontSize: 18,
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
                          height: mheight * 0.05,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: mwidth * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Year",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "regulartext",
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: mwidth * 0.02,
                                  ),
                                  Container(
                                    height: mheight * 0.03,
                                    width: mwidth * 0.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: AdvancedSwitch(
                                      activeColor: Colors.blue,
                                      controller: _controller01,
                                      thumb: ValueListenableBuilder<bool>(
                                        valueListenable: _controller01,
                                        builder: (_, value, __) {
                                          return Icon(
                                            value ? Icons.circle : Icons.circle,
                                            color: Colors.white,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: mwidth * 0.02,
                                  ),
                                  const Text(
                                    "Month",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "regulartext",
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: mheight * 0.03,
                              ),
                              Container(
                                height: mheight * 0.1,
                                width: mwidth * 0.85,
                                decoration: BoxDecoration(
                                  color: const Color(0xff1C3984),
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black)
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    ClipPath(
                                      clipper: CustomPath(),
                                      child: Container(
                                        height: mheight * 0.15,
                                        width: mwidth * 0.55,
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
                                                  left: mwidth * 0.1),
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
                                          EdgeInsets.only(right: mwidth * 0.1),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Total Loan",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "boldtext",
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "20000",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "boldtext",
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
                          height: mheight * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: mwidth * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Year",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "regulartext",
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: mwidth * 0.02,
                                  ),
                                  Container(
                                    height: mheight * 0.03,
                                    width: mwidth * 0.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: AdvancedSwitch(
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
                                  ),
                                  SizedBox(
                                    width: mwidth * 0.02,
                                  ),
                                  const Text(
                                    "Month",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: "regulartext",
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: mheight * 0.03,
                              ),
                              Container(
                                height: mheight * 0.1,
                                width: mwidth * 0.85,
                                decoration: BoxDecoration(
                                  color: const Color(0xff1C3984),
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black)
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    ClipPath(
                                      clipper: CustomPath(),
                                      child: Container(
                                        height: mheight * 0.15,
                                        width: mwidth * 0.55,
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
                                                  left: mwidth * 0.1),
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
                                          EdgeInsets.only(right: mwidth * 0.1),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Total Loan",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "boldtext",
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "20000",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "boldtext",
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: mheight * 0.03,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.1,
                  ),
                  const Center(
                    child: Text(
                      "Current Year Sales",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "boldtext",
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  const Barchart(),
                  SizedBox(
                    height: mheight * 0.05,
                  ),
                  const Center(
                    child: Text(
                      "Current  FY-Sales ",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "boldtext",
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.02,
                  ),
                  const Linechart(),
                  SizedBox(
                    height: mheight * 0.05,
                  ),
                  const Center(
                    child: Text(
                      "Recent  Activities",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: "boldtext",
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: mheight * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.09),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text("Show entries",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "boldtext",
                                    fontWeight: FontWeight.w800)),
                            SizedBox(
                              width: mwidth * 0.02,
                            ),
                            Container(
                              height: mheight * 0.03,
                              width: mwidth * 0.1,
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
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext"),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                  errorStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: mheight * 0.03,
                        ),
                        Row(
                          children: [
                            const Text("Search",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "boldtext",
                                    fontWeight: FontWeight.w800)),
                            SizedBox(
                              width: mwidth * 0.02,
                            ),
                            Container(
                              height: mheight * 0.03,
                              width: mwidth * 0.5,
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
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "regulartext"),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                  errorStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext"),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: mheight * 0.05,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: mwidth * 0.1),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: mheight * 0.04,
                                  ),
                                  SizedBox(
                                    height: mheight * 0.13,
                                    child: Container(
                                      height: mheight * 0.12,
                                      width: mwidth * 0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.grey,
                                              spreadRadius: 1),
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: mheight * 0.02),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(children: [
                                              SizedBox(
                                                height: mheight * 0.11,
                                                width: mwidth * 0.2,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: mwidth * 0.02),
                                                  child: const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Agent",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "shorts",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff284389))),
                                                      Center(
                                                          child: FittedBox(
                                                              child: Text(
                                                                  "shaheenpk",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontFamily:
                                                                          "shorts",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)))),
                                                      Divider(),
                                                      Text("Pan",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "shorts",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff284389))),
                                                      Center(
                                                          child: FittedBox(
                                                              child: Text(
                                                                  "HSHPP1158J",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontFamily:
                                                                          "shorts",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: mwidth * 0.08,
                                              ),
                                              SizedBox(
                                                height: mheight * 0.11,
                                                width: mwidth * 0.2,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: mwidth * 0.02),
                                                  child: const Column(
                                                    children: [
                                                      Text("Customer",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "shorts",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff284389))),
                                                      FittedBox(
                                                          child: Text("RAVI",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      "shorts",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      Divider(),
                                                      Text("Loan  no",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "shorts",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff284389))),
                                                      FittedBox(
                                                          child: Text(
                                                              "ORO003A11-9009",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      "shorts",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: mwidth * 0.08,
                                              ),
                                              SizedBox(
                                                height: mheight * 0.11,
                                                width: mwidth * 0.2,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: mwidth * 0.02),
                                                  child: const Column(
                                                    children: [
                                                      Text("Amount",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "shorts",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff284389))),
                                                      FittedBox(
                                                          child: Text("590000",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      "shorts",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                      Divider(),
                                                      Text("Status",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "shorts",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Color(
                                                                  0xff284389))),
                                                      FittedBox(
                                                          child: Text("Active",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      "shorts",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green))),
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
                        SizedBox(
                          height: mheight * 0.05,
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
