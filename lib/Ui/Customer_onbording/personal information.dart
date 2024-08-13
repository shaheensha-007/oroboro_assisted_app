
import 'dart:convert';
import 'dart:io';

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
String? fileName1;
String? fileName2;
String? base64filename1;
String? base64filename2;
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
              const Text("Personal information", style: TextStyle(fontSize: 18,
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
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: DropdownButtonFormField<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      value: stringemploymentstatus,
                      onChanged: (value) {
                        setState(() {
                          stringemploymentstatus = value;
                        });
                      },
                      items: status.map((employeed) {
                        return DropdownMenuItem(
                          value: employeed,
                          child: Text(employeed, style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            fontFamily: "regulartext",
                          ),),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
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
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.03),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext"),
                    controller: montlyincome,
                    decoration: const InputDecoration(
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
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.03),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext"),
                    controller: montlycommited,
                    decoration: const InputDecoration(
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
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: mwidth * 0.03),
                      child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        value: residencestatus,
                        onChanged: (value) {
                          setState(() {
                            residencestatus = value;
                          });
                        },
                        items: statusresidence.map((Residence) {
                          return DropdownMenuItem(
                            value: Residence,
                            child: Text(Residence, style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              fontFamily: "regulartext",
                            ),),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
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
            const Text("Reference 1", style: TextStyle(fontSize: 18,
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
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      controller: reference1name,
                      decoration: const InputDecoration(
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
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      controller: reference1age,
                      decoration: const InputDecoration(
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
            const Text("Reference 1", style: TextStyle(fontSize: 18,
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
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      controller: reference2name,
                      decoration: const InputDecoration(
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
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 1),
                      ],
                      color: Colors.white
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: mwidth * 0.03),
                    child: TextFormField(
                      style: const TextStyle(fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: "regulartext"),
                      controller: reference2age,
                      decoration: const InputDecoration(
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
            const Text("Utility  document", style: TextStyle(fontSize: 18,
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
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, spreadRadius: 1),
                  ],
                  color: Colors.white
              ),
              child: Padding(
                padding: EdgeInsets.only(left: mwidth * 0.03),
                child: TextFormField(
                  style: const TextStyle(fontSize: 14,
                      fontWeight: FontWeight.w800,
                      fontFamily: "regulartext"),
                  decoration: const InputDecoration(
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
                      color: const Color(0xff284389),
                    ),

                    child: TextButton(onPressed: () async{
                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                      if (result != null) {
                        PlatformFile file = result.files.first;
                        // Convert the file to base64 string
                         File filenameread=File(file.path!);
                       List<int>filebytes=await filenameread.readAsBytes();
                        base64filename1=base64Encode(filebytes);
                        print(base64filename1);
                        setState(() {
                          fileName1 = file.name;
                        });
                      }
                    },
                      child: const Text("Browers", style: TextStyle(fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: "bopldtext"),),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: mheight * 0.01, left: mwidth * 0.02),
                      child: Text(fileName1.toString(), style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontFamily: "regulartext",
                          color: Colors.grey),),
                    ),
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
                      color: const Color(0xff284389),
                    ),
              
                    child: TextButton(onPressed: ()async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles();
                      if (result != null) {
                        PlatformFile file = result.files.first;
                        File filename2=File(file.path!);
                        List<int>filebytes=await filename2.readAsBytes();
                        base64filename2=base64Encode(filebytes);
                        print(base64filename2);
                        setState(() {
                          fileName2 = file.name;
                        });
                      }
                    },
                      child: const Text("Browers", style: TextStyle(fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: "bopldtext"),),),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: mheight * 0.01, left: mwidth * 0.02),
                      child: Text(fileName2.toString(), style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          fontFamily: "regulartext",
                          color: Colors.grey),),
                    ),
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
                      backgroundColor: const Color(0xff284389)
                  ), onPressed: () {

                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>), (route) => false);
                  },
                      child: const Text("Previous", style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontFamily: "regulartext"),)),
                  ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389)
                  ), onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                        builder: (context) => const Loan_eligibility_Approved()), (
                        route) => false);
                  },
                      child: const Text("Sumbit", style: TextStyle(fontSize: 16,
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
  // void _openFileExplorer() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //
  //   if (result != null) {
  //     PlatformFile file = result.files.first;
  //
  //     // Use the picked file, such as uploading it to a server
  //     print('File picked: ${file.name}');
  //     print('File path: ${file.path}');
  //
  //   } else {
  //     // User canceled the file picking
  //     print('User canceled file picking');
  //   }
}

