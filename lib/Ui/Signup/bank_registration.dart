import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'loan_application_verification.dart';

class Bank_registration extends StatefulWidget {
  const Bank_registration({super.key});

  @override
  State<Bank_registration> createState() => _Bank_registrationState();
}
TextEditingController Accounttype=TextEditingController();
TextEditingController Accountno=TextEditingController();
TextEditingController ifscno=TextEditingController();
TextEditingController accountholders=TextEditingController();
class _Bank_registrationState extends State<Bank_registration> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: mheight*0.1,
                ),
                Padding(
                  padding:EdgeInsets.only(right:mwidth*0.3),
                  child: Text("Bank Registration",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                ),
                SizedBox(
                  height: mheight*0.1,
                ),
                Padding(
                  padding:  EdgeInsets.only(left:mwidth*0.03),
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
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                        controller: Accounttype,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "__chooose__",
                          hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.03,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.03),
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
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                        controller: Accountno,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Account NO.",
                          hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.03,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: mwidth*0.03),
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
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                        controller: ifscno,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "IFSC NO.",
                          hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.03,
                ),
                Padding(
                  padding:EdgeInsets.only(left: mwidth*0.03),
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
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                        controller: accountholders,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Account Holder Name",
                          hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight*0.1,
                ),
                Center(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Color(0xff284389)
                  ),onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Loan_application_verification()), (route) => false);
                  }, child:Text("Verify Your Bank Account",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
