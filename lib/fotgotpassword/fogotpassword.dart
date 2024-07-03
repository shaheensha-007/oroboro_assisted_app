import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Signin/signin_page.dart';

class Fogotpassword extends StatefulWidget {
  const Fogotpassword({super.key});

  @override
  State<Fogotpassword> createState() => _FogotpasswordState();
}
TextEditingController forgotpassword=TextEditingController();
class _FogotpasswordState extends State<Fogotpassword> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding:EdgeInsets.only(left: mwidth*0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mheight*0.2,
                  ),
                  Text("Forgot Password",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: mheight*0.01,
                  ),
                  Text("Please  enter your  email address . You will  receive\na link to create a new Password via email.",style: TextStyle(fontSize: 12,fontFamily: "regulartext",fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: mheight*0.1,
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
                        controller: forgotpassword,
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
                    height: mheight*0.05,
                  ),
        Center(
          child: Padding(
            padding:EdgeInsets.only(right: mwidth*0.1),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                backgroundColor: Color(0xff284389)
            ),onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Signin_page()), (route) => false);
            }, child:Text("Send",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
          ),
        ),
                  SizedBox(
                    height: mheight*0.4,
                  ),
                  Center(child: Padding(
                    padding:EdgeInsets.only(right: mwidth*0.1),
                    child: Text("Version 1.0.0.1",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
