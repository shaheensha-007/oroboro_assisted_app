import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import 'package:oroboro_assisted_app/widgets/NavigationServies.dart';
import 'package:oroboro_assisted_app/widgets/responsive_size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Blocs/Customeronbording_blocs/bank_verification_bloc/bank_update_bloc/bankupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/bank_verification_bloc/ifsc_verification_bloc/ifscverification_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../main.dart';
import '../../modeles/customeronboradingModel/bank_verification modeles/Ifsc_veriicationModel/IfscverificationModel.dart';
import '../../modeles/customeronboradingModel/bank_verification modeles/bankupadateModel/BankupdateModel.dart';
import 'loan_is_out_verification.dart';


class Bank_details extends StatefulWidget {
  const Bank_details({super.key});

  @override
  State<Bank_details> createState() => _Bank_detailsState();
}

IfscverificationModel? iscodeifsc;
BankupdateModel?bankdetalisupdate;
CustomeronbordingstatusModel? bankCustomeronding;
UpadatenextprocessModel? bankcustomerupdate;
Customeronbording2Model?bankCustomeronbordingnext;








TextEditingController IfscController=TextEditingController();
TextEditingController accountno=TextEditingController();

String? accounttype;
String?jenfixbankname;
String?jenfixbranchname;
int? BankPageorder;
String? Bankpagetypeonbording;
String? Bankpagename;

bool Fetchbankdata=false;
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
              padding:EdgeInsets.only(left: 35.rw(context)),
              child: Form(
                key: bankdetaliskey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150.rh(context),
                    ),
                     Text("Bank Details",style: TextStyle(fontSize: 28.rf(context),
                        fontFamily: "boldtext",
                        fontWeight: FontWeight.w800),),
                    SizedBox(
                      height: 50.rh(context),
                    ),
                    Container(
                      height: 50.rh(context),
                      width: 300.rw(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(color: Colors.grey,spreadRadius: 1),
                          ],
                          color: Colors.white
                      ),
                      child: Padding(
                        padding:EdgeInsets.only(left: 10.rw(context)),
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
                          style:  TextStyle(fontSize: 14.rf(context), fontFamily: "boldtext"),
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            hintText: "Account no.",
                            hintStyle: TextStyle(fontSize: 10.rf(context),fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                            errorStyle: TextStyle(fontSize: 10.rf(context),fontWeight: FontWeight.w200,fontFamily: "regulartext"),
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
                      height: 30.rh(context),
                    ),
                Container(
                  height: 62.rh(context),
                  width: 300.rw(context),   // Dynamic runtime value
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(color: Colors.grey, spreadRadius: 1),
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.rw(context)), // Dynamic padding
                    child: TextFormField(
                      style:  TextStyle(fontSize: 14.rf(context), fontFamily: "boldtext"),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                      ],
                      controller: IfscController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your IFSC Code';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        String formattedText =
                        text.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
                        IfscController.value = TextEditingValue(
                          text: formattedText,
                          selection: TextSelection.fromPosition(
                            TextPosition(offset: formattedText.length),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "IFSC Code",
                        hintStyle: TextStyle(fontSize: 10.rf(context),fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10.rf(context),fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.arrow_forward, color: Colors.blue),
                          onPressed: () async{
                            final preferences = await SharedPreferences.getInstance();
                             if (IfscController.text.isNotEmpty) {
                               BlocProvider.of<IfscverificationBloc>(context)
                                   .add(
                                   FetchIfscverification(
                                     userId: preferences.getString("Userid") ??
                                         "",
                                     ifsccode: IfscController.text,
                                     ctx: context,));
                               setState(() {
                                 Fetchbankdata = true;
                               });
                             }else{
                               _showErrorSnackBar("please entery your IFSC Code");
                             }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Fetchbankdata
               ? BlocBuilder<IfscverificationBloc, IfscverificationState>(
                   builder: (context, state) {
                     if(state is IfscVerificationblocLoading){
                       CircularProgressIndicator();
                     }
                     if(state is IfscVerificatonblocError){
                       _showErrorSnackBar(iscodeifsc?.responseMessage??"");
                     }
                     if(state is IfscVerificationblocLoaded){
                       iscodeifsc=BlocProvider.of<IfscverificationBloc>(context).isifsccode;
                       if(iscodeifsc?.status.toString()=="Success"){
                         jenfixbankname=iscodeifsc?.result?.iFSCDetails?.bankName.toString();
                         jenfixbranchname=iscodeifsc?.result?.iFSCDetails?.branchName.toString();
                       }
                     }
                   return Column(
                  children: [
                    SizedBox(
                      height: 20.rh(context),
                    ),
                    Padding(
                      padding:EdgeInsets.only(),
                      child: Container(
                        height: 50.rh(context),
                        width: 300.rw(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey,spreadRadius: 1),
                            ],
                            color: Colors.white
                        ),
                        child: Padding(
                            padding:EdgeInsets.only(left:10.rw(context),top:15.rh(context)),
                            child:Text(jenfixbankname.toString(),style:  TextStyle(
                                fontSize: 14.rf(context), fontFamily: "boldtext"
                            ),)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.rh(context),
                    ),
                    Padding(
                      padding:EdgeInsets.only(),
                      child: Container(
                        height: 50.rh(context),
                        width: 300.rw(context),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey,spreadRadius: 1),
                            ],
                            color: Colors.white
                        ),
                        child: Padding(
                            padding:EdgeInsets.only(left: 10.rw(context),top:15.rh(context)),
                            child:Text(jenfixbranchname.toString(),style: TextStyle(
                                fontSize: 14.rf(context), fontFamily: "boldtext"
                            ),)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.rh(context),
                    ),
                    Container(
                        height: 50.rh(context),
                        width: 300.rw(context),
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
                                child: Text(account, style:  TextStyle(
                                    fontSize: 14.rf(context), fontFamily: "boldtext"
                                ),),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              // Adjust content padding as needed
                              border: InputBorder.none,
                              // Remove the border
                              hintText: "Account type",
                              hintStyle: TextStyle(fontSize: 10.rf(context),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "regulartext"),
                              errorStyle: TextStyle(fontSize: 10.rf(context),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "regulartext"),
                            ),
                          ) ,
                        )
                    ),
                    ]
                );
  }

):SizedBox(),

                    SizedBox(
                      height: 50.rh(context),
                    ),
                    Padding(
                      padding:EdgeInsets.only(right: 30.rw(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              backgroundColor: const Color(0xff284389)
                          ),  onPressed: (){
                            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>), (route) => false);
                          },
                              child: Text("Previous",style: TextStyle(fontSize: 20.rf(context),
                                  color: Colors.white,
                                  fontFamily: "boldtext"),)),
                          BlocListener<BankupdateBloc, BankupdateState>(
                         listener: (context, state)async {
                          final preferences = await SharedPreferences.getInstance();
                           if(state is BankupdateblocLoading){
                             showDialog(
                               context: context,
                               barrierDismissible: false,
                               builder: (BuildContext context) {
                                 return const Center(
                                     child:
                                     CircularProgressIndicator());
                               },
                             );
                           }
                           if(state is BankupdateblocLoaded) {
                             Navigator.of(context, rootNavigator: true)
                                 .pop();
                              bankdetalisupdate = state.bankupdateModel;
                             if(bankdetalisupdate?.status=="Success"){
                               ///CustomeronbordingApi
                             BlocProvider.of<CustomeronbordingBloc>(context).add(FetchCustomeronbording(
                                         userid: preferences.getString("Userid").toString(),
                                         Customercode: preferences.getString("CustomerCode").toString(),
                                         partnercode: preferences.getString("partnercode").toString(),
                                         agentcode: preferences.getString("agentcode").toString(),
                                         ctx: context));

                             }
                           }
                           if(state is BankupdateblocError){
                             Navigator.of(context, rootNavigator: true).pop();
                          _showErrorSnackBar(state.Errormessage);
                           }
                       // TODO: implement listener
                        },
                              child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
                                 listener: (context, state)async {
                                   final preferences = await SharedPreferences.getInstance();
                                   if(state is CustomeronbordingblocLoading){
                                     showDialog(
                                       context: context,
                                       barrierDismissible: false,
                                       builder: (BuildContext context) {
                                         return const Center(
                                             child:
                                             CircularProgressIndicator());
                                       },
                                     );
                                   }
                                   if(state is CustomeronbordingblocLoaded){
                                     Navigator.of(context, rootNavigator: true).pop();
                                      bankCustomeronding=state.customeronbordingstatusModel;
                                     if(bankCustomeronding?.status=="Success"){
                                       BankPageorder=bankCustomeronding?.result?.pageOrder;
                                       ///Customerupdate
                                  BlocProvider.of<CustomerupdatenextBloc>(context).add(FetchCustomerupdate(
                                       userid: preferences.getString("Userid").toString(),
                                       Customercode: preferences.getString("CustomerCode").toString(),
                                       PartnerCode: preferences.getString("partnercode").toString(),
                                       FlowId: preferences.getString("Flowid")??"",
                                       PageOrder: BankPageorder.toString(),
                                       ApplicationId: preferences.getString("applicationid").toString(),
                                       PageType: preferences.getString("pagetype").toString(),
                                       ctx: context));
                                     }
                                   }
                                   if(state is CustomeronbordingblocError){
                                     Navigator.of(context, rootNavigator: true)
                                         .pop();
                                    _showErrorSnackBar(state.Errormessage);
                                   }
                                  // TODO: implement listener
                                  },
                                  child: BlocListener<CustomerupdatenextBloc, CustomerupdatenextState>(
                                  listener: (context, state)async {
                                    final preferences = await SharedPreferences.getInstance();
                                    if(state is CustomerupdatenextblocLoading){
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const Center(
                                              child:
                                              CircularProgressIndicator());
                                        },
                                      );
                                    }
                                    if(state is CustomerupdatenextblocLoaded){
                                      Navigator.of(context, rootNavigator: true).pop();
                                       bankcustomerupdate=state.upadatenextprocessModel;
                                      if(bankcustomerupdate?.status=="Success"){
                                        BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
                                            userid: preferences.getString("Userid").toString(),
                                            Customercode: preferences.getString("CustomerCode").toString(),
                                            partnercode: preferences.getString("partnercode").toString(),
                                            agentcode: preferences.getString("agentcode").toString(),
                                            ctx: context));

                                      }
                                    }
                                    if(state is CustomerupdatenextblocError){
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    _showErrorSnackBar(state.Errormessage);
                                    }
                                 // TODO: implement listener
                                 },
                                child: BlocListener<Customeronbording2Bloc, Customeronbording2State>(
                                  listener: (context, state) {
                                    if(state is Customeronbording2blocLoading){
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return const Center(
                                              child:
                                              CircularProgressIndicator());
                                        },
                                      );
                                    }
                                    if(state is Customeronbording2blocLoaded){
                                      Navigator.of(context, rootNavigator: true).pop();
                                      bankCustomeronbordingnext=state.customeronbording2model;
                                      if(bankCustomeronbordingnext?.status=="Success"){
                                        Bankpagename=bankCustomeronbordingnext?.result?.pageName.toString();
                                        Bankpagetypeonbording=bankCustomeronbordingnext?.result?.pageType.toString();
                                        if(Bankpagename=="SignUp") {
                                          NavigationService
                                              .pushAndRemoveUntil(
                                              Loan_is_verification(), (
                                              Route<dynamic>route) => false);
                                          if (Bankpagetypeonbording == "POST") {
                                            NavigationService
                                                .pushAndRemoveUntil(
                                                Loan_is_verification(),(Route<dynamic>route) => false);
                                             _showErrorSnackBar("onbording is completed");
                                          } else {
                                            _showErrorSnackBar("not page not allowed");

                                          }
                                        }else{
                                          Navigator.of(context, rootNavigator: true).pop();
                                          _showErrorSnackBar(
                                              "not page not allowed");
                                        }
                                      }
                                    }
                                    if(state is Customeronbording2blocError){
                                      Navigator.of(context, rootNavigator: true).pop();
                                      _showErrorSnackBar(state.Errormessage);
                                    }
                                   // TODO: implement listener
                                    },
                                   child: ElevatedButton(style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      backgroundColor: const Color(0xff284389)
                                  ),  onPressed: ()async{
                            final preferences = await SharedPreferences.getInstance();
                            if(bankdetaliskey.currentState!.validate()){
                                BlocProvider.of<BankupdateBloc>(context).add(FetchBankupdate(
                                    userId: preferences.getString("Userid").toString(),
                                    Customercode: preferences.getString("CustomerCode").toString(),
                                    Accountnumber:accountno.text,
                                    Accounttype:accounttype.toString(),
                                    ifsccode: IfscController.text,
                                    ctx: context));
                                  }
                                  },
                                      child: Text("Sumbit",style: TextStyle(fontSize: 20.rf(context),
                                          color: Colors.white,
                                          fontFamily: "boldtext"),)),
),
),
),
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
