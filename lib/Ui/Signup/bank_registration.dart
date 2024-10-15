import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Signup/agent_onbording/enter_pan.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Blocs/Signupblocs/Ifsc_bloc/ifsc_bloc.dart';
import '../../Blocs/Signupblocs/bankregstratin_bloc/bankregstration_bloc.dart';
import '../../modeles/signupModelclass/Ifscmodel/IfscModel.dart';
import '../../modeles/signupModelclass/bank_registrationModel/Bank_registratioModel.dart';
import '../Signin/signin_page.dart';
import 'loan_application_verification.dart';

class Bank_registration extends StatefulWidget {
  const Bank_registration({super.key});

  @override
  State<Bank_registration> createState() => _Bank_registrationState();
}
late IfscModel veriflyifsc;
late BankRegistratioModel bankregstrationmodel;
String? selectedAccountType;
final List<String> accountTypes = ['savings', 'current', 'fixed Deposit'];
TextEditingController Accountno=TextEditingController();
TextEditingController ifscno=TextEditingController();
TextEditingController accountholders=TextEditingController();
final accountnumberkey = GlobalKey<FormState>();
final ifscnumberkey = GlobalKey<FormState>();
final accountholderkey=GlobalKey<FormState>();
bool ifscshow=false;
String BANKNAME="";
String branchName="";

class _Bank_registrationState extends State<Bank_registration> {

  String? validateIfsc(value) {
    // Define a regular expression for PAN format
    RegExp panRegex = RegExp(r'^[A-Z]{4}[0][A-Z0-9]{6}$');

    if (!panRegex.hasMatch(value)) {
      return 'Invalid IFSC format. It should be like "ABCD0123456"';
    }

    return null; // Return null if the format is valid
  } /// VALIDATION IS IFSC NUMBRER




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
                  child: const Text("Bank Registration",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                ),
                SizedBox(
                  height: mheight*0.1,
                ),
            Padding(
              padding: EdgeInsets.only(left: mwidth * 0.03),
              child: Container(
                height: mheight * 0.06,
                width: mwidth * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(color: Colors.grey, spreadRadius: 1),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: mwidth * 0.03),
                  child: DropdownButtonFormField<String>(
                    value: selectedAccountType,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      fontFamily: "regulartext",
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      hintText: "__Choose the AccountType__",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        fontFamily: "regulartext",
                      ),
                      errorStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        fontFamily: "regulartext",
                      ),
                    ),
                    items: accountTypes.map((String accountType) {
                      return DropdownMenuItem<String>(
                        value: accountType,
                        child: Text(accountType),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedAccountType = newValue;
                      });
                    },
                  ),
                ),
              ),
            ),
                SizedBox(
                  height: mheight*0.03,
                ),
                Form(
                  key: accountnumberkey,
                  child: Padding(
                    padding:EdgeInsets.only(left: mwidth*0.03),
                    child: Container(
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
                          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                          controller: Accountno,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(17),
                          ],
                          decoration: const InputDecoration(
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
                ),
                SizedBox(
                  height: mheight*0.03,
                ),
                BlocListener<IfscBloc, IfscState>(
                  listener: (context, state) {
                    if(state is IfscblocLoding){
                      const CircularProgressIndicator();
                    }
                    if(state is IfscblocLoaded) {
                      veriflyifsc = BlocProvider
                          .of<IfscBloc>(context)
                          .isverifiedifsc;
                    }
                    // TODO: implement listener
                  },
                  child: Form(
                    key:ifscnumberkey,
                    child: Padding(
                      padding:  EdgeInsets.only(left: mwidth*0.03),
                      child: Container(
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
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(11),
                                  ],
                                  controller: ifscno,
                                  validator: validateIfsc,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: "regulartext",
                                  ),
                                  decoration: InputDecoration( // Removed const here
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hintText: "IFSC NO.",
                                    hintStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext",
                                    ),
                                    errorStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "regulartext",
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        final isValidIfsc = ifscnumberkey.currentState?.validate();
                                        if (isValidIfsc == true) {
                                          BlocProvider.of<IfscBloc>(context).add(
                                            FetchIfsc(
                                              clientId: MainclientId,
                                              IFSC: ifscno.text,
                                              ctx: context,
                                            ),
                                          );
                                          ifscnumberkey.currentState?.save();
                                          setState(() {
                                            ifscshow = true;
                                          });
                                        }
                                      },
                                      icon: const Icon(Icons.check), // Make this const since the icon itself is a constant
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                ifscshow
                    ? BlocBuilder<IfscBloc, IfscState>(
                    builder: (context, state) {
                      if(state is IfscblocLoding){
                        const CircularProgressIndicator();
                      } if(state is IfscblocLoaded){
                        veriflyifsc=BlocProvider.of<IfscBloc>(context).isverifiedifsc;
                         BANKNAME=veriflyifsc.result!.bankDetails!.bankName.toString();
                         branchName=veriflyifsc.result!.bankDetails!.branchName.toString();
                        return Column(
                          children: [
                            SizedBox(
                              height: mheight*0.02,
                            ),
                            Padding(
                              padding:EdgeInsets.only(left: mwidth*0.03),
                              child: Container(
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
                                  padding:EdgeInsets.only(left: mwidth*0.03,top:mheight*0.02),
                                  child:Text(BANKNAME,style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "font1",
                                  ),)
                                ),
                              ),
                            ),
                            SizedBox(
                              height: mheight*0.02,
                            ),
                            Padding(
                              padding:EdgeInsets.only(left: mwidth*0.03),
                              child: Container(
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
                                  padding:EdgeInsets.only(left: mwidth*0.03,top:mheight*0.02),
                                  child:  Text(
                                    branchName,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "font1",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    }
                )
                    :const SizedBox(),
                SizedBox(
                  height: mheight*0.03,
                ),
                Form(
                  key:accountholderkey,
                  child: Padding(
                    padding:EdgeInsets.only(left: mwidth*0.03),
                    child: Container(
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
                          style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                          controller: accountholders,
                          decoration: const InputDecoration(
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
                ),
                SizedBox(
                  height: mheight*0.1,
                ),
                BlocListener<BankregstrationBloc, BankregstrationState>(
  listener: (context, state) {
    if(state is BankregstrationblocLoading){
      const CircularProgressIndicator();
    }
  if(state is BankregstrationblocError){
    _showErrorSnackBar("internal issue");
  }
  if(state is BankregstrationblocLoaded){
    bankregstrationmodel=BlocProvider.of<BankregstrationBloc>(context).isbankverification;
    if(bankregstrationmodel.result!.activityStatus=="SUCCESS"){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Loan_application_verification()), (route) => false);
    }else{
      String bankregstrationerror=bankregstrationmodel.message.toString();
      _showErrorSnackBar(bankregstrationerror);
    }
  }
    // TODO: implement listener
  },
  child: Center(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389)
                  ),onPressed: ()async{
                    final SharedPreferences preferences = await SharedPreferences.getInstance();
                    final accountholdervalid=accountholderkey.currentState?.validate();
                    if(accountholdervalid==true){
                      BlocProvider.of<BankregstrationBloc>(context).add(FetchBankregstration(
                          clientId: MainclientId, PAN: Pannumber.text, PartnerCode:preferences.getString("partnercode").toString(), OnboardingFor: "Agent", AcoountNumber:Accountno.text , IFSC: ifscno.text, AccountType: selectedAccountType.toString(), BankName: BANKNAME, BranchName:branchName, AccountHolderName:accountholders.text , ctx: context));
                        accountnumberkey.currentState?.save();
                    }
                  }, child:const Text("Verify Your Bank Account",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                  ),
),
              ],
            ),
          )
        ],
      ),
    );
  }
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message,style: const TextStyle(fontSize: 12,fontFamily: "font2"),),));
  }
}
