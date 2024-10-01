import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/personal%20information.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Blocs/Customeronbording_blocs/Aadhaarotpverification_bloc/aadhaarotpverification_bloc.dart';
import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../Blocs/MerchartToken_bloc/merchart_token_bloc.dart';
import '../../main.dart';
import '../../modeles/customeronboradingModel/AadhaarOtpVerificationModel/AadhaarOtpVerificationModel.dart';
import '../../modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingStatusModel.dart';
import 'Mobileotp.dart';
import 'aadhar upload.dart';
import 'addhaar number.dart';

class AaadharOtp extends StatefulWidget {
  const AaadharOtp({super.key, required this.Requestid});
final String Requestid;
  @override
  State<AaadharOtp> createState() => _AaadharOtpState();
}
late AadhaarOtpVerificationModel isotpaadhaarverification;
TextEditingController aadhaarOtp=TextEditingController();
bool Aadhaarshow=false;
bool nextaadhaar=false;
String? Flowid2;
String? Pageorder2;
class _AaadharOtpState extends State<AaadharOtp> {
  @override
  void initState() {
    BlocProvider.of<MerchartTokenBloc>(context)
        .add(FetchMerchartToken(userName: "Test", password: tokenpassword));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
            title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:const EdgeInsets.all(5.0),
                    child: IconButton(onPressed: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Aadhaarnumber()), (route) => false);
                    }, icon:const Icon(Icons.arrow_back_ios_new)),
                  ),
                ]
            )
        ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding:EdgeInsets.only(left:mwidth*0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mheight*0.2,
                  ),
                  const Text("Aadhaar Verification ",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                  SizedBox(
                    height: mheight*0.01,
                  ),
                  Padding(
                    padding:EdgeInsets.only(right: mwidth*0.1),
                    child: const Text("Verify your Aadhaar number",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                  ),
                  SizedBox(
                    height: mheight*0.05,
                  ),
                  SizedBox(
                    width: mwidth*0.8,
                    child: Padding(
                      padding: EdgeInsets.only(left: mwidth*0.03),
                      child: BlocListener<AadhaarotpverificationBloc, AadhaarotpverificationState>(
  listener: (context, state) {
    if(state is AadhaarotpverificationblocLoading){
      CircularProgressIndicator();
    }
    if(state is AadhaarotpvetrificationblocLoaded){
      isotpaadhaarverification=BlocProvider.of<AadhaarotpverificationBloc>(context).isAadhaarotpverification;
      if(isotpaadhaarverification.status.toString()=="Success"){
        setState(() {
          nextaadhaar=true;
        });
        // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Personal_information()), (route) => false);
      }else{
        _showErrorSnackBar(isotpaadhaarverification.errorMessage.toString());
        setState(() {
          Aadhaarshow = true;
        });
      }
    }
    // TODO: implement listener
  },
  child: Expanded(
    child: PinCodeTextField(
                          controller: aadhaarOtp,
                          pinTheme: PinTheme(shape: PinCodeFieldShape.underline,inactiveColor: const Color(0xffC9D2EA),fieldWidth: mwidth*0.08,borderRadius: BorderRadius.circular(5)),
                          appContext: context,onSubmitted: (value){
                        },onCompleted: (vale)async{
                           final preferences = await SharedPreferences.getInstance();
                            BlocProvider.of<AadhaarotpverificationBloc>(context).add(FetchAadhaarotpverification(
                                userId:preferences.getString("Userid").toString() ,
                                Customercode: preferences.getString("CustomerCode").toString(),
                                Aadhaarotp:aadhaarOtp.text ,
                                Requestid: widget.Requestid));
                        },
                          length: 6,
                        ),
  ),
),
                    ),
                  ),
                 SizedBox(
                   height: mheight*0.03,
                 ),
                  Padding(
                    padding: EdgeInsets.only(right: mwidth*0.05),
                    child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Didn’t you  receive any code?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),),
                        TextButton(onPressed: (){

                        }, child: const Text("Resend New Code",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFF7C00)),)),
                      SizedBox(
                        height: mheight*0.01,
                      ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          axisAlignment: 1.0,
                          child: child,
                        );
                      },
                      child:Aadhaarshow?
                      Center(child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Aadhaarupload()), (route) => false);
                          },
                          child: Text("Aadhaar  not linked with Mobile number ?",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w800,fontFamily: "regulartext",color: Color(0xffFC9738)))),
                      ):SizedBox(),
                    ),
                        SizedBox(
                          height: mheight*0.25,
                        ),
                        nextaadhaar
                            ?
                        Padding(
                          padding:EdgeInsets.only(right: mwidth*0.05),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
  listener: (context, state)async {
    final preferences = await SharedPreferences.getInstance();
    if(state is CustomeronbordingblocLoading){
      CircularProgressIndicator();
    } if(state is CustomeronbordingblocLoaded){
      iscustomerstatuts=BlocProvider.of<CustomeronbordingBloc>(context).isCustomeronbording;
      if(iscustomerstatuts.status.toString()=="Success"){
        Flowid=iscustomerstatuts.result!.flowId.toString();
        Pageorder=iscustomerstatuts.result!.pageOrder.toString();
        BlocProvider.of<CustomerupdateBloc>(context).add(FetchCustomerupdate(
            userid:preferences.getString("Userid").toString(),
            Customercode: preferences.getString("CustomerCode").toString(),
            PartnerCode: preferences.getString("partnercode").toString(),
            FlowId: Flowid.toString(),
            PageOrder: Pageorder.toString()));
      }else
        _showErrorSnackBar(iscustomerstatuts.errorMessage.toString());
    }
    // TODO: implement listener
  },
  child: BlocListener<CustomerupdateBloc, CustomerupdateState>(
  listener: (context, state) {
    if(state is CustomerupdateblocLoading){
      CircularProgressIndicator();
    }
    if(state is CustomerupadateblocLoaded){
      isupadatenextprocess=BlocProvider.of<CustomerupdateBloc>(context).iscustomerupadate;
      if(isupadatenextprocess.status.toString()=="Success"){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Personal_information()), (route) => false).then((value) => setState(() {
          Flowid=null;
          Pageorder=null;
          nextaadhaar=false;
        }));
      }
    }
    // TODO: implement listener
  },
  child: TextButton(onPressed: ()async{
    final preferences = await SharedPreferences.getInstance();
    BlocProvider.of<CustomeronbordingBloc>(context).add(FetchCustomeronbording(
        userid:preferences.getString("Userid").toString() , 
        Customercode: preferences.getString("CustomerCode").toString()
    ));

                              }, child:Text(
                                "Next>>>",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xff284389)),
                              ),
                              ),
),
),
                                    ],
                                  ),
                  ):SizedBox(),
                            ]
                  )
      )
          ],
        ),
            )
            ]
        ),
      )
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
