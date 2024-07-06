import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Draw_in_signature.dart';
import '../upload the face.dart';
import 'enter_pan.dart';

class Enter_businessdetalis extends StatefulWidget {
  const Enter_businessdetalis({super.key});

  @override
  State<Enter_businessdetalis> createState() => _Enter_businessdetalisState();
}
final gstkey = GlobalKey<FormState>();
TextEditingController gstnumber=TextEditingController();
TextEditingController ownername=TextEditingController();
TextEditingController shopname=TextEditingController();
TextEditingController tannumber=TextEditingController();
class _Enter_businessdetalisState extends State<Enter_businessdetalis> {



  String? validateGST(value) {
    // Define a regular expression for GST format
    RegExp gstRegex = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');

    if (!gstRegex.hasMatch(value)) {
      return 'Invalid GST format. It should be like "12ABCDE1234F1Z5"';
    }

    return null; // Return null if the format is valid
  }/// validation of Gst number

  String? _validateTAN(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a TAN';
    }

    // Regex for TAN format: NGPO02911G
    final regex = RegExp(r'^[A-Z]{4}[0-9]{5}[A-Z]$');

    if (!regex.hasMatch(value)) {
      return 'Invalid TAN format. Should be in NGPO02911G format';
    }

    return null;
  }
/// validation of tan numbers

  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: mheight*0.04,
        ),
        Form(
          key: gstkey,
          child: Container(
            height: mheight*0.06,
            width: mwidth*0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Colors.grey,spreadRadius: 1),
                ],
                color: Colors.white
            ),
            child: Padding(
              padding:EdgeInsets.only(left: mwidth*0.03),
              child: TextFormField(
                validator:validateGST,
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                controller: gstnumber,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: "GST",
                  hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                  errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                ),
                onEditingComplete: (){
                  final isgstvalid=gstkey.currentState?.validate();
                  if(isgstvalid==true){
                    gstkey.currentState?.save();
                  }
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: mheight*0.03,
        ),
        Container(
          height: mheight*0.06,
          width: mwidth*0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(color: Colors.grey,spreadRadius: 1),
              ],
              color: Colors.white
          ),
          child: Padding(
            padding:EdgeInsets.only(left: mwidth*0.03),
            child: TextFormField(
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
              controller: ownername,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: "Shop owner name",
                hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: mheight*0.03,
        ),
        Container(
          height: mheight*0.06,
          width: mwidth*0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(color: Colors.grey,spreadRadius: 1),
              ],
              color: Colors.white
          ),
          child: Padding(
            padding:EdgeInsets.only(left: mwidth*0.03),
            child: TextFormField(
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
              controller: shopname,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: "Shop name",
                hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: mheight*0.03,
        ),
        Container(
          height: mheight*0.06,
          width: mwidth*0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(color: Colors.grey,spreadRadius: 1),
              ],
              color: Colors.white
          ),
          child: Padding(
            padding:EdgeInsets.only(left: mwidth*0.03),
            child: TextFormField(
              controller: tannumber,
              validator: _validateTAN,
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                hintText: "TAN",
                hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
              ),
            ),
          ),
        ),
        SizedBox(
          height: mheight*0.05,
        ),
        Center(
          child: ElevatedButton(style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              backgroundColor: Color(0xff284389)
          ),onPressed: (){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Draw_in_signature()), (route) => false);
          }, child:Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
        ),
      ],
    );
  }
}
