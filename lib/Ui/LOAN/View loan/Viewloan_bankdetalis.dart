import 'package:flutter/material.dart';

import 'loan_appbar.dart';


class Viewloan_bankdetalis extends StatefulWidget {
  const Viewloan_bankdetalis({super.key});

  @override
  State<Viewloan_bankdetalis> createState() => _Viewloan_bankdetalisState();
}

class _Viewloan_bankdetalisState extends State<Viewloan_bankdetalis> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery
        .of(context)
        .size
        .height;
    var mwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Loan_appbar(),
      ),
      backgroundColor: Colors.white,
      body: Stack(
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mheight*0.1,
            ),
      Padding(
      padding:EdgeInsets.only(left: mwidth*0.1),
      child: const Text("Bank Details", style: TextStyle(
          fontSize: 18, fontFamily: "boldtext", fontWeight: FontWeight.w800),),
    ),
    SizedBox(
    height: mheight*0.1,
    ),
    Padding(
    padding:EdgeInsets.only(top: mheight * 0.02,
        right: mwidth * 0.06,
        left: mwidth * 0.1),
    child: Container(
    height: mheight*0.3,
    width: mwidth * 0.9,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white,
    boxShadow: [
    BoxShadow(
    color: const Color(0xff2B45A3).withOpacity(0.5),
    spreadRadius: -4,
    blurRadius: 11,
    offset: const Offset(
    0, 6), // changes position of shadow
    ),
    ],
    ),
      child:Padding(
        padding:EdgeInsets.only(left: mwidth*0.02,top: mheight * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text(
                  "Date",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff284389),
                      fontFamily: "regulartext"),
                ),
                SizedBox(
                  width: mwidth * 0.02,
                ),
                const Text(
                  "23_09-2000",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      fontFamily: "regulartext"),
                )
              ],
            ),
            Divider(
              color: const Color(0xffC9D2EA),
              endIndent: mwidth * 0.03,
            ),
            Row(
              children: [
                const Text(
                  "Customer",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff284389),
                      fontFamily: "regulartext"),
                ),
              const Spacer(),
                Padding(
                  padding:EdgeInsets.only(right: mwidth*0.15),
                  child: const Text(
                    "shaheen pk",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext"),
                  ),
                ),
              ],
            ),
          SizedBox(
            height: mheight*0.02,
          ),
            Row(
              children: [
                const Text(
                  "Customer",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff284389),
                      fontFamily: "regulartext"),
                ),
                const Spacer(),
                Padding(
                  padding:EdgeInsets.only(right: mwidth*0.15),
                  child: const Text(
                    "shaheen pk",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mheight*0.02,
            ),
            Row(
              children: [
                const Text(
                  "Customer",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff284389),
                      fontFamily: "regulartext"),
                ),
                const Spacer(),
                Padding(
                  padding:EdgeInsets.only(right: mwidth*0.15),
                  child: const Text(
                    "shaheen pk",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mheight*0.02,
            ),
            Row(
              children: [
                const Text(
                  "Customer",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff284389),
                      fontFamily: "regulartext"),
                ),
                const Spacer(),
                Padding(
                  padding:EdgeInsets.only(right: mwidth*0.15),
                  child: const Text(
                    "shaheen pk",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext"),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    )
    ),
            SizedBox(
              height: mheight*0.01,
            ),
            Padding(
                padding:EdgeInsets.only(top: mheight * 0.02,
                    right: mwidth * 0.06,
                    left: mwidth * 0.1),
                child: Container(
                    height: mheight*0.3,
                    width: mwidth * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff2B45A3).withOpacity(0.5),
                          spreadRadius: -4,
                          blurRadius: 11,
                          offset: const Offset(
                              0, 6), // changes position of shadow
                        ),
                      ],
                    ),
                    child:Padding(
                      padding:EdgeInsets.only(left: mwidth*0.02,top: mheight * 0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff284389),
                                    fontFamily: "regulartext"),
                              ),
                              SizedBox(
                                width: mwidth * 0.02,
                              ),
                              const Text(
                                "23_09-2000",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext"),
                              )
                            ],
                          ),
                          Divider(
                            color: const Color(0xffC9D2EA),
                            endIndent: mwidth * 0.03,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Customer",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff284389),
                                    fontFamily: "regulartext"),
                              ),
                              const Spacer(),
                              Padding(
                                padding:EdgeInsets.only(right: mwidth*0.15),
                                child: const Text(
                                  "shaheen pk",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mheight*0.02,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Customer",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff284389),
                                    fontFamily: "regulartext"),
                              ),
                              const Spacer(),
                              Padding(
                                padding:EdgeInsets.only(right: mwidth*0.15),
                                child: const Text(
                                  "shaheen pk",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mheight*0.02,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Customer",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff284389),
                                    fontFamily: "regulartext"),
                              ),
                              const Spacer(),
                              Padding(
                                padding:EdgeInsets.only(right: mwidth*0.15),
                                child: const Text(
                                  "shaheen pk",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: mheight*0.02,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Customer",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xff284389),
                                    fontFamily: "regulartext"),
                              ),
                              const Spacer(),
                              Padding(
                                padding:EdgeInsets.only(right: mwidth*0.15),
                                child: const Text(
                                  "shaheen pk",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                )
            )
    ],
    )
    ],
    ),
    );
  }
}
