import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'loan_eligiblity_ Approved.dart';

class Personal_information extends StatefulWidget {
  const Personal_information({super.key});

  @override
  State<Personal_information> createState() => _Personal_informationState();
}

TextEditingController montlyincome = TextEditingController();
TextEditingController montlycommited = TextEditingController();
TextEditingController Residencestatus = TextEditingController();
TextEditingController reference1name = TextEditingController();
TextEditingController reference1age = TextEditingController();
TextEditingController reference2name = TextEditingController();
TextEditingController reference2age = TextEditingController();

String? stringemploymentstatus;
String? residencestatus;

class _Personal_informationState extends State<Personal_information> {
  List<String> status = ['Employed', 'Unemployed'];
  List<String> statusresidence = [
    'Resident and Ordinarily Resident(ROR)',
    'Resident but Not Ordinarily Resident(RNOR)',
    'Non-Resident(NR)'
  ];

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: mwidth * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(
                height: mheight*0.2,
              ),
              Text("Personal information", style: TextStyle(fontSize: 18,
                  fontFamily: "boldtext",
                  fontWeight: FontWeight.w800),),
              SizedBox(
                height: mheight * 0.05,
              ),
              Container(
                height: mheight * 0.06,
                width: mwidth * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: DropdownButtonFormField<String>(
                      icon: Icon(Icons.arrow_drop_down),
                      value: stringemploymentstatus,
                      onChanged: (value) {
                        setState(() {
                          stringemploymentstatus = value;
                        });
                      },
                      items: status.map((employeed) {
                        return DropdownMenuItem(
                          value: employeed,
                          child: Text(employeed, style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            fontFamily: "regulartext",
                          ),),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        // Adjust content padding as needed
                        border: InputBorder.none,
                        // Remove the border
                        hintText: "Employment Status",
                        hintStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                      ),
                    )
                ),
              ),
              SizedBox(
                height: mheight * 0.03,
              ),
              Container(
                height: mheight * 0.06,
                width: mwidth * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.03),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext"),
                    controller: montlyincome,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: "Monthly income",
                      hintStyle: TextStyle(fontSize: 10,
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext"),
                      errorStyle: TextStyle(fontSize: 10,
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mheight
                    * 0.03,
              ),
              Container(
                height: mheight * 0.06,
                width: mwidth * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.03),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext"),
                    controller: montlycommited,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: "Monthly  EMI   Commitment",
                      hintStyle: TextStyle(fontSize: 10,
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext"),
                      errorStyle: TextStyle(fontSize: 10,
                          fontWeight: FontWeight.w200,
                          fontFamily: "regulartext"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mheight * 0.03,
              ),
              Container(
                  height: mheight * 0.06,
                  width: mwidth * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: mwidth * 0.03),
                      child: DropdownButtonFormField<String>(
                        icon: Icon(Icons.arrow_drop_down),
                        value: residencestatus,
                        onChanged: (value) {
                          setState(() {
                            residencestatus = value;
                          });
                        },
                        items: statusresidence.map((Residence) {
                          return DropdownMenuItem(
                            value: Residence,
                            child: Text(Residence, style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext",
                            ),),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0),
                          // Adjust content padding as needed
                          border: InputBorder.none,
                          // Remove the border
                          hintText: "Residence Status",
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

                      )
                  )
              ),
            SizedBox(
              height: mheight * 0.03,
            ),
            Text("Reference 1", style: TextStyle(fontSize: 18,
                fontFamily: "regulartext",
                fontWeight: FontWeight.w800),),
            SizedBox(
              height: mheight * 0.02,
            ),
            Row(
              children: [
                Container(
                  height: mheight * 0.06,
                  width: mwidth * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      controller: reference1name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mwidth * 0.1,
                ),
                Container(
                  height: mheight * 0.06,
                  width: mwidth * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      controller: reference1age,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Age",
                        hintStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mheight * 0.03,
            ),
            Text("Reference 1", style: TextStyle(fontSize: 18,
                fontFamily: "regulartext",
                fontWeight: FontWeight.w800),),
            SizedBox(
              height: mheight * 0.02,
            ),
            Row(
              children: [
                Container(
                  height: mheight * 0.06,
                  width: mwidth * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      controller: reference2name,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Name",
                        hintStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: mwidth * 0.1,
                ),
                Container(
                  height: mheight * 0.06,
                  width: mwidth * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      controller: reference2age,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Age",
                        hintStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mheight * 0.03,
            ),
            Text("Utility  document", style: TextStyle(fontSize: 18,
                fontFamily: "regulartext",
                fontWeight: FontWeight.w800),),
            SizedBox(
              height: mheight * 0.02,
            ),
            Container(
              height: mheight * 0.06,
              width: mwidth * 0.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, spreadRadius: 1),
                  ],
                  color: Colors.white
              ),
              child: Padding(
                padding: EdgeInsets.only(left: mwidth * 0.03),
                child: TextFormField(
                  style: TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w800,
                      fontFamily: "regulartext"),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    hintText: "Select  utility type",
                    hintStyle: TextStyle(fontSize: 10,
                        fontWeight: FontWeight.w200,
                        fontFamily: "regulartext"),
                    errorStyle: TextStyle(fontSize: 10,
                        fontWeight: FontWeight.w200,
                        fontFamily: "regulartext"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: mheight * 0.03,
            ),
            Container(
              height: mheight * 0.05,
              width: mwidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey,),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: mheight * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Color(0xff284389),
                    ),

                    child: TextButton(onPressed: () {
                      _openFileExplorer();
                    },
                      child: Text("Browers", style: TextStyle(fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: "bopldtext"),),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: mheight * 0.01, left: mwidth * 0.02),
                    child: Text("Upload  aadhaar front ", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: "regulartext",
                        color: Colors.grey),),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mheight * 0.03,
            ),
            Container(
              height: mheight * 0.05,
              width: mwidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey,),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: mheight * 0.05,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Color(0xff284389),
                    ),

                    child: TextButton(onPressed: () {
                      _openFileExplorer();
                    },
                      child: Text("Browers", style: TextStyle(fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: "bopldtext"),),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: mheight * 0.01, left: mwidth * 0.02),
                    child: Text("Upload  aadhaar front", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: "regulartext",
                        color: Colors.grey),),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mheight * 0.05,
            ),
            Padding(
              padding:EdgeInsets.only(right: mwidth*0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Color(0xff284389)
                  ), onPressed: () {
                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>), (route) => false);
                  },
                      child: Text("Previous", style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontFamily: "regulartext"),)),
                  ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Color(0xff284389)
                  ), onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                        builder: (context) => Loan_eligibility_Approved()), (
                        route) => false);
                  },
                      child: Text("Sumbit", style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontFamily: "regulartext"),)),
                ],
              ),
            ),
            SizedBox(
              height: mheight * 0.03,
            ),
          ],
        ),
      )
      ],
    ),)
    ,
    );
  }
}

void _openFileExplorer() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;

    // Use the picked file, such as uploading it to a server
    print('File picked: ${file.name}');
    print('File path: ${file.path}');
  } else {
    // User canceled the file picking
    print('User canceled file picking');
  }
}