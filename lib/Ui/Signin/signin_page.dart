import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../Blocs/token_bloc/token_bloc.dart';
import '../Signup/agent_onbording/agent_onbording.dart';
import '../fotgotpassword/fogotpassword.dart';
import '../mpin/create_mpin.dart';

final  String MainclientId = "OroboroTestClient";

class Signin_page extends StatefulWidget {
  const Signin_page({super.key});

  @override
  State<Signin_page> createState() => _Signin_pageState();
}
bool remberingcheck=false;
bool _isPasswordVisible = false;
TextEditingController Signinusername=TextEditingController();
TextEditingController Signinpassword=TextEditingController();

class _Signin_pageState extends State<Signin_page> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                  height: mheight*0.2,
                  ),
                  Image(image: AssetImage("assets/oroborologo.png"),width: mwidth*0.4,),
                  SizedBox(
                    height: mheight*0.01,
                  ),
                  Text("Welcome to",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: mheight*0.02,
                  ),
                  Text("Merchant Assisted App",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
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
                        controller:Signinusername,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                          hintText: "Username",
                          hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight*0.04,
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
                              controller: Signinpassword,
                              autofillHints: [AutofillHints.password],
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                                  errorStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(_isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible =
                                !_isPasswordVisible; // Toggle password visibility
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mheight*0.02,
                  ),
                  Padding(
                    padding:EdgeInsets.only(left: mwidth*0.1),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale:1,
                          child: Checkbox(value: remberingcheck, shape:RoundedRectangleBorder(side: BorderSide(color: Colors.grey)),
                              onChanged:(bool?value){
                             setState(() {
                               remberingcheck=value??false;
                             });
                          }),
                        ),
                        Text("Remember me",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                        Spacer(),
                        Padding(
                          padding:EdgeInsets.only(right: mwidth*0.08),
                          child: TextButton(onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Fogotpassword()), (route) => false);
                          }, child: Text("Forgot Password?",style: TextStyle(fontSize:12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFF7C00)),)),

                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mheight*0.05,
                  ),

                  ElevatedButton(style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Color(0xff284389)
                  ),onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Create_mpin()), (route) => false);
                  }, child:Text("Sign in",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                  SizedBox(
                    height: mheight*0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No Account ?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                      TextButton(onPressed: (){

                        _partnercodeshowDialog();
                      }, child: Text("Register now.",style: TextStyle(fontSize:12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFF7C00)),))
                    ],
                  ),
                  SizedBox(
                    height: mheight*0.2
                  ),
                  Text("Version 1.0.0.1",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext"),)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
  void  _partnercodeshowDialog(){
    late List<String> tokenModel;
    final partnercodekey = GlobalKey<FormState>();
    String? selectedPartnerCode;
    List<String> partnerCodes = ["ORO003"];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var mheight= MediaQuery.of(context).size.height;
        var mwidth= MediaQuery.of(context).size.width;
        return Dialog(
      surfaceTintColor: Colors.white,
          shadowColor: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width:mwidth*0.8, // Set your desired width
            height:mheight*0.5,  // Set your desired height
            padding: EdgeInsets.all(16.0),
            child: Form(
              key:partnercodekey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose your Partner Code',
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "boldtext"),
                  ),
                  Divider(
                    height: 20,
                    thickness: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: mheight*0.02,
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
                      child:  DropdownButtonFormField<String>(
                        value: selectedPartnerCode, // The currently selected value
                        items: partnerCodes.map((String code) {
                          return DropdownMenuItem<String>(
                            value: code,
                            child: Text(
                              code,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                fontFamily: "regulartext",
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedPartnerCode = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please choose a Partnercode';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "__choose__",
                          hintStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext",
                          ),
                          errorStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            fontFamily: "regulartext",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  BlocListener<TokenBloc, TokenState>(
  listener: (context, state) {
    if(state is TokenblocLoading){
     CircularProgressIndicator();
    }
    if(state is TokenblocError){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Signin_page()), (route) => false);
    }
    if(state is TokenblocLoaded){
      tokenModel=BlocProvider.of<TokenBloc>(context).tokenModel;
    final isvalid=partnercodekey.currentState?.validate();
    if(isvalid==true){
      print(isvalid);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Agent_onborading()), (route) => false);
    }

    }
    // TODO: implement listener
  },
  child:
  Center(
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Color(0xff284389)
                    ),onPressed: ()async{
                      final SharedPreferences preferences = await SharedPreferences.getInstance();
                      preferences.setString("partnercode", selectedPartnerCode.toString());
                        TextInput.finishAutofillContext();
                        BlocProvider.of<TokenBloc>(context).add(FetchToken(
                            passwordInBase64: "ASBTRYIMNYER654",
                            userName: "OroboroTestClient",
                            ctx: context));
                    //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Agent_onborading()), (route) => false);
                    }, child:Text("Submit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                  ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
void userInfo(String token, String refreshToken) async {
  final preferences = await SharedPreferences.getInstance();
  await preferences.setString('Token', token);
  await preferences.setString('RefersToken', refreshToken);
}