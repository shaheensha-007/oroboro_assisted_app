import 'package:flutter/material.dart';

import 'Draw_in_signature.dart';

class Agent_business_onboarding extends StatefulWidget {
  const Agent_business_onboarding({super.key});

  @override
  State<Agent_business_onboarding> createState() => _Agent_business_onboardingState();
}
TextEditingController gstnumber=TextEditingController();
TextEditingController ownername=TextEditingController();
TextEditingController shopname=TextEditingController();
TextEditingController tannumber=TextEditingController();

bool ownernameshow=false;
bool shopnameshow=false;
bool tannumbershow=false;
final gstkey = GlobalKey<FormState>();
final ownernamekey=GlobalKey<FormState>();
final shopnamekey=GlobalKey<FormState>();
final tannumberkey=GlobalKey<FormState>();
class _Agent_business_onboardingState extends State<Agent_business_onboarding> {

  String? validateGST(value) {
    // Define a regular expression for GST format
    RegExp gstRegex = RegExp(r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$');

    if (!gstRegex.hasMatch(value)) {
      return 'Invalid GST format. It should be like "12ABCDE1234F1Z5"';
    }

    return null; // Return null if the format is valid
  }/// validation of Gst number

  String? _validateTAN(data) {
    if (data == null || data.isEmpty) {
      return 'Please enter a TAN';
    }

    // Regex for TAN format: NGPO02911G
    final regex = RegExp(r'^[A-Z]{4}[0-9]{5}[A-Z]$');

    if (!regex.hasMatch(data)) {
      return 'Invalid TAN format. Should be in NGPO02911G format';
    }

    return null;
  }
  /// validation of tan numbers
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: mheight * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(right: mwidth * 0.2),
                  child: Text(
                    "Let’s Start Your\nAgent  Business  Journey",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "boldtext",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight * 0.05,
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
                               setState(() {
                                 ownernameshow=true;
                               });
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
        
                ownernameshow
                ?
                Form(
                  key:ownernamekey,
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
                        onEditingComplete: (){
                          final isvalidowner=ownernamekey.currentState?.validate();
                          if(isvalidowner==true){
                            setState(() {
                              shopnameshow=true;
                            });
                            ownernamekey.currentState?.save();
                          }
                        },
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
                )
                :SizedBox(),
                SizedBox(
                  height: mheight*0.03,
                ),
                shopnameshow
                ?Form(
                  key:shopnamekey,
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
                        onEditingComplete: (){
                          final isvalidshopname=shopnamekey.currentState?.validate();
                          if(isvalidshopname==true){
                            setState(() {
                              tannumbershow=true;
                            });
                            shopnamekey.currentState?.save();
                          }
                        },
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
                )
                :SizedBox(),
        
                SizedBox(
                  height: mheight*0.03,
                ),
                tannumbershow
                ? Form(
                  key:tannumberkey,
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
                        controller: tannumber,
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
                )
                :SizedBox(),
        
                SizedBox(
                  height: mheight*0.05,
                ),
                Center(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Color(0xff284389)
                  ),onPressed: (){
                  final isvalidtan= tannumberkey.currentState?.validate();
                  if(isvalidtan==true) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) =>
                            Draw_in_signature()), (route) => false);
                    tannumberkey.currentState?.save();
                  }
                  }, child:Text("Submit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
   setState(() {
     ownernameshow=false;
     shopnameshow=false;
     tannumbershow=false;
   });
    // TODO: implement dispose
    super.dispose();
  }
}
