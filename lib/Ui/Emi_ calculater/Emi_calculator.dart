import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../apparbar/myappbar.dart';

class Emi_calculator extends StatefulWidget {
  const Emi_calculator({super.key});

  @override
  State<Emi_calculator> createState() => _Emi_calculatorState();
}

TextEditingController productvalue = TextEditingController();
TextEditingController emitenure = TextEditingController();

String? emiternure;

class _Emi_calculatorState extends State<Emi_calculator> {
  List<String> emilistQuestion = [
    "Standard Protection",
    "Screen Damage Protection",
    "Extended Warranty",
    "iPhone Protection"
  ];
  late List<bool> EmiselectedList;
  List<String> emiterunretype = [
    'Product Value',
    'EMI value',
    'Total value',
  ];

  @override
  void initState() {
    super.initState();
    EmiselectedList = List<bool>.filled(emilistQuestion.length, false);
  }

  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const MyAppbar(),
      ),
      body: Stack(
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
                  "EMI Calculator",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "boldtext",
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: mheight * 0.03,
                ),
                Container(
                  height: mheight * 0.06,
                  width: mwidth * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: TextFormField(
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      controller: productvalue,
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Product Value",
                        hintStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight * 0.05,
                ),
                Container(
                    height: mheight * 0.06,
                    width: mwidth * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, spreadRadius: 1),
                        ],
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.only(left: mwidth * 0.03),
                      child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        value: emiternure,
                        onChanged: (value) {
                          emiternure = value;
                        },
                        items: emiterunretype.map((emitype) {
                          return DropdownMenuItem(
                            value: emitype,
                            child: Text(
                              emitype,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext",
                              ),
                            ),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust content padding as needed
                          border: InputBorder.none, // Remove the border
                          hintText: "Emi Tenure",
                          hintStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            fontFamily: "regulartext",
                          ),
                          errorStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            fontFamily: "regulartext",
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: mheight * 0.03,
                ),
                const Text(
                  "Choose Your insurance  Type",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "boldtext",
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: mheight * 0.03,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: emilistQuestion.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Checkbox(
                          shape: const CircleBorder(
                              side: BorderSide(color: Colors.grey)),
                          value: EmiselectedList[index],
                          onChanged: (bool? value) {
                            setState(() {
                              EmiselectedList[index] = value ?? false;
                            });
                          },
                        ),
                        Text(
                          emilistQuestion[index],
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              fontFamily: "boldtext",
                              color: Colors.black),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: mheight * 0.03,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
