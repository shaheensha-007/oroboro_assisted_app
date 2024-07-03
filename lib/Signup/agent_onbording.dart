import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oroboro_assisted_app/Signup/upload%20the%20face.dart';

class Agent_onborading extends StatefulWidget {
  const Agent_onborading({super.key});

  @override
  State<Agent_onborading> createState() => _Agent_onboradingState();
}
TextEditingController pannumber=TextEditingController();
TextEditingController mobilenumber=TextEditingController();
TextEditingController mobileotp=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController gstnumber=TextEditingController();
TextEditingController ownername=TextEditingController();
TextEditingController shopname=TextEditingController();
TextEditingController tannumber=TextEditingController();
class _Agent_onboradingState extends State<Agent_onborading> {
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
                  height: mheight*0.1,
                ),
                Padding(
                  padding:EdgeInsets.only(right: mwidth*0.2),
                  child: Text("Let’s Start Your\nAgent  Onboarding  Journey",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800 ),),
                ),
                SizedBox(
                  height: mheight*0.05,
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
                      controller: pannumber,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "PAN",
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
                      controller: mobilenumber,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Mobile",
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
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                            controller:mobileotp ,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              hintText: "OTP",
                              hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                              errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: mheight * 0.06,
                          width: mwidth*0.3,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: Color(0xff284389),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Validate",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
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
                      controller: email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Email",
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
                      controller: gstnumber,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "GST",
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
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                      controller: tannumber,
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
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Upload_face()), (route) => false);
                  }, child:Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
