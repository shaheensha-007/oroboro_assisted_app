import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'disbursed.dart';

class Disbursal_pendding extends StatefulWidget {
  const Disbursal_pendding({super.key});

  @override
  State<Disbursal_pendding> createState() => _Disbursal_penddingState();
}
TextEditingController disbursalfromdate1=TextEditingController();
TextEditingController disbursalTodate1=TextEditingController();
class _Disbursal_penddingState extends State<Disbursal_pendding> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: mwidth * 0.07),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "From",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "boldtext",
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: mwidth * 0.02,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: mheight * 0.06,
                          width: mwidth * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.only(left: mwidth * 0.03),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.datetime,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "regulartext"),
                                    controller: disbursalfromdate2,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      hintText: "dd-MM-yyyy",
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
                                IconButton(
                                    onPressed: () async {
                                      DateTime? pickedDate =
                                      await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2100));

                                      if (pickedDate != null) {
                                        String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                        setState(() {
                                          disbursalfromdate1.text =
                                              formattedDate;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.calendar_month))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: mwidth * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "To",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "boldtext",
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: mwidth * 0.02,
                    ),
                    Container(
                      height: mheight * 0.06,
                      width: mwidth * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: mwidth * 0.03),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.datetime,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext"),
                                controller: disbursalTodate1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: "dd-MM-yyyy",
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
                            IconButton(
                                onPressed: () async {
                                  DateTime? pickedDate =
                                  await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    String formattedDate =
                                    DateFormat('dd-MM-yyyy')
                                        .format(pickedDate);
                                    setState(() {
                                      disbursalTodate1.text = formattedDate;
                                    });
                                  }
                                },
                                icon: Icon(Icons.calendar_month))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: mheight * 0.05,
          ),
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Color(0xff284389)),
                onPressed: () {
                  // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Customer_onbording_mobile()), (route) => false);
                },
                child: Text(
                  "Find",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontFamily: "regulartext"),
                )),
          ),
          SizedBox(
            height: mheight * 0.1,
          ),
          Container(
            height: mheight,
            width: mwidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Color(0xffC9D2EA),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: mwidth * 0.06),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: mheight * 0.02,
                        right: mwidth * 0.06,
                        left: mwidth * 0.01),
                    child: Container(
                      height: mheight * 0.25,
                      width: mwidth * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey, spreadRadius: 1),
                          ],
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: mwidth * 0.02, top: mheight * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
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
                                Text(
                                  "23_09-2000",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: "regulartext"),
                                ),
                                Spacer(),
                                Text(
                                  "Loan No",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff284389),
                                      fontFamily: "regulartext"),
                                ),
                                SizedBox(
                                  width: mwidth * 0.02,
                                ),
                                Padding(
                                  padding:EdgeInsets.only(right: mwidth*0.02),
                                  child: Text(
                                    "ORO003A11-9009",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: "regulartext"),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xffC9D2EA),
                              endIndent: mwidth * 0.03,
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff284389),
                                          fontFamily: "regulartext"),
                                    ),
                                    SizedBox(
                                      width: mwidth * 0.02,
                                    ),
                                    Text(
                                      "shaheen pk",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "regulartext"),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding:EdgeInsets.only(right: mwidth*0.04),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Amount",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff284389),
                                            fontFamily: "regulartext"),
                                      ),
                                      SizedBox(
                                        width: mwidth * 0.02,
                                      ),
                                      Text(
                                        "45899",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "regulartext"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xffC9D2EA),
                              endIndent: mwidth * 0.03,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product value",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          color: Color(0xff284389),
                                          fontFamily: "regulartext"),
                                    ),
                                    SizedBox(
                                      width: mwidth * 0.02,
                                    ),
                                    Text(
                                      "10,0000",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: "regulartext"),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Padding(
                                  padding:EdgeInsets.only(right: mwidth*0.04),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff284389),
                                            fontFamily: "regulartext"),
                                      ),
                                      SizedBox(
                                        width: mwidth * 0.02,
                                      ),
                                      Text(
                                        "Active",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "regulartext",
                                            color: Colors.green
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Color(0xffC9D2EA),
                              endIndent: mwidth * 0.03,
                            ),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Comments",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff284389),
                                      fontFamily: "regulartext"),
                                ),
                                SizedBox(
                                  width: mwidth * 0.02,
                                ),
                                Padding(
                                  padding:EdgeInsets.only(top:3),
                                  child: Text(
                                    "ORO11ORO11C-10102 Disbursed 06/10/2024 17:18:33",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "regulartext"),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
