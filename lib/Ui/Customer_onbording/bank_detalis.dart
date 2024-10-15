import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/bank_verification_bloc/ifsc_verification_bloc/ifscverification_bloc.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../main.dart';
import '../../modeles/customeronboradingModel/bank_verification modeles/Ifsc_veriicationModel/IfscverificationModel.dart';


class Bank_details extends StatefulWidget {
  const Bank_details({super.key});

  @override
  State<Bank_details> createState() => _Bank_detailsState();
}
TextEditingController IfscController=TextEditingController();
TextEditingController accountno=TextEditingController();
late IfscverificationModel iscodeifsc;
String? accounttype;
class _Bank_detailsState extends State<Bank_details> {
  final GlobalKey<FormState> bankdetaliskey = GlobalKey<FormState>();
  List<String>listaccounttype=['Savings', 'Current'];
  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context)
        .add(FetchMerchartToken(userName: "Test", password: tokenpassword,ctx: context));
    // TODO: implement initState
    super.initState();
  }
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
              child: Form(
                key: bankdetaliskey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: mheight*0.2,
                    ),
                    const Text("Bank Details",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                    SizedBox(
                      height: mheight*0.1,
                    ),
                    Container(
                      height: mheight*0.06,
                      width: mwidth*0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey,spreadRadius: 1),
                          ],
                          color: Colors.white
                      ),
                      child: Padding(
                        padding:EdgeInsets.only(left: mwidth*0.03),
                        child: TextFormField(
                          controller: accountno,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'please enter your Account number';
                            }
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(15)
                          ],
                          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Account no.",
                            hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                            errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          ),
                          onChanged: (text){
                            String accountvalid = text.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
                            accountno.value=TextEditingValue(
                               text:accountvalid,
                                selection: TextSelection.fromPosition(
                                TextPosition(offset: accountvalid.length)
                            )
                            );
                          },
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
                          boxShadow: const [
                            BoxShadow(color: Colors.grey,spreadRadius: 1),
                          ],
                          color: Colors.white
                      ),
                      child: Padding(
                        padding:EdgeInsets.only(left: mwidth*0.03),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(11)
                          ],
                          controller:IfscController,
                          validator: (value){
                            if(value!.isEmpty){
                              return'please enter your IFSC Code';
                            }
                          },
                          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "IFSC Code",
                            hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                            errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                          ),
                          onChanged: (text){
                            String ifscvalid=text.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
                            IfscController.value=TextEditingValue(
                              text: ifscvalid,
                              selection: TextSelection.fromPosition(
                              TextPosition(offset: ifscvalid.length)
                              )
                            );
                          },
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
                          boxShadow: const [
                            BoxShadow(color: Colors.grey,spreadRadius: 1),
                          ],
                          color: Colors.white
                      ),
                      child: Padding(
                        padding:EdgeInsets.only(left: mwidth*0.03),
                        child: DropdownButtonFormField<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          value:accounttype,
                          onChanged: (value){
                            setState(() {
                              accounttype=value;
                            });
                          },
                          items:listaccounttype.map((account){
                            return DropdownMenuItem(
                            value: account,
                            child: Text(account, style: const TextStyle(
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
                            hintText: "Account type",
                            hintStyle: TextStyle(fontSize: 10,
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                            errorStyle: TextStyle(fontSize: 10,
                                fontWeight: FontWeight.w200,
                                fontFamily: "regulartext"),
                          ),
                          ) ,
                        )
                      ),
        
                    SizedBox(
                      height: mheight*0.03,
                    ),
                    Padding(
                      padding:EdgeInsets.only(right: mwidth*0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: const Color(0xff284389)
                          ),  onPressed: (){
                            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>), (route) => false);
                          },
                              child:const Text("Previous",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                          BlocListener<IfscverificationBloc, IfscverificationState>(
                  listener: (context, state) {
                    if(state is IfscVerificationblocLoading){
                      CircularProgressIndicator();
                    }
                    if(state is IfscVerificationblocLoaded){
                      iscodeifsc=BlocProvider.of<IfscverificationBloc>(context).isifsccode;
                      if(iscodeifsc.status.toString()=="Success"){
                      }else{
                        _showErrorSnackBar(iscodeifsc.errorMessage.toString());
                      }
                    }
                    // TODO: implement listener
                  },
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: const Color(0xff284389)
                          ),  onPressed: ()async{
                    final preferences = await SharedPreferences.getInstance();
                    if(bankdetaliskey.currentState!.validate()){
                      BlocProvider.of<IfscverificationBloc>(context).add(FetchIfscverification(userId:preferences.getString("Userid").toString(),ifsccode: IfscController.text, ctx: context));
                    }
        
                          },
                              child:const Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mheight*0.05,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 12, fontFamily: "font2"),
      ),
    ));
  }
}
