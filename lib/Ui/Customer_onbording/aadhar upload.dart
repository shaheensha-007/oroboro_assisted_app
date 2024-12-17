import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Aadhaaruploadfile_Blocs/Aadhaarfile_back_bloc/aadhaarfile_back_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Aadhaaruploadfile_Blocs/Aadhaarfile_front_blocs/aadhaarfile_front_bloc.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/personal%20information.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/Customeronbording2_blocs/customeronbording2_bloc.dart';
import '../../Blocs/Customeronbording_blocs/customeronbording_bloc/customeronbording_bloc.dart';
import '../../modeles/customeronboradingModel/AadhaaruploadfilesModel/AadhaaruploadfilesModel.dart';
import '../../widgets/NavigationServies.dart';
import 'addhaar number.dart';

class Aadhaarupload extends StatefulWidget {
  const Aadhaarupload({super.key});

  @override
  State<Aadhaarupload> createState() => _AadhaaruploadState();
}
AadhaaruploadfilesModel?  frontaadhaaruploadfilesModel;
AadhaaruploadfilesModel? backaadhaaruploadfilesModel;
CustomeronbordingstatusModel? aadhaaruploadcustomeronbordingstatusModel;
UpadatenextprocessModel? aadhaaruploadupadatenextprocessModel;
Customeronbording2Model? aadhaaruploadcustomeronbording2model;







String?namefile1;
String? namefile2;
String? base64code1;
String? base64code2;
int?Pageorderupload;
String? pagenameupload;
bool hasNavigated = false;
bool aadhaaruploadisLoading=false;

late AadhaaruploadfilesModel isuploadAadhaarfiles;
class _AadhaaruploadState extends State<Aadhaarupload> {
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
      body: Stack(
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
        height: mheight*0.03,
      ),
      SizedBox(
        height: mheight*0.1,
      ),
          Container(
            height: mheight * 0.05,
            width: mwidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey,),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: mheight * 0.05,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: const Color(0xff284389),
                  ),

                  child: TextButton(onPressed: ()async{
                    FilePickerResult? result = await FilePicker.platform.pickFiles();
                    if (result != null) {
                      PlatformFile file = result.files.first;

                      // Check the file extension (pdf, jpg, png)
                      List<String> allowedExtensions = [
                        'pdf',
                        'jpg',
                        'png'
                      ];
                      String fileExtension = file.extension!
                          .toLowerCase();

                      if (!allowedExtensions.contains(
                          fileExtension)) {
                        // If the file type is not allowed
                        _showErrorSnackBar(
                            'Only PDF, JPG, PNG files are allowed');
                        return; // Exit early if the file type is invalid
                      }

                      // Check the file size (limit: 2MB = 2 * 1024 * 1024 bytes)
                      if (file.size > 2 * 1024 * 1024) {
                        // If the file size exceeds 2MB
                        _showErrorSnackBar(
                            'File size must be less than 2MB');
                        return; // Exit early if the file size is too large
                      }
                      // Convert the file to base64 string
                      File filenameread=File(file.path!);
                      List<int>filebytes=await filenameread.readAsBytes();
                      base64code1=base64Encode(filebytes);
                      print(base64code1);
                      setState(() {
                        namefile1 = file.name;
                      });
                    }
                  },
                    child: const Text("Browser", style: TextStyle(fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: "bopldtext"),),),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: mheight * 0.01, left: mwidth * 0.02),
                    child: Text(namefile1??"upload document", style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        fontFamily: "regulartext",
                        color: Colors.grey),),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mheight * 0.03,
          ),
          Container(
            height: mheight * 0.05,
            width: mwidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey,),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: mheight * 0.05,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: const Color(0xff284389),
                  ),

                  child: TextButton(onPressed: () async{
                    FilePickerResult? result = await FilePicker.platform.pickFiles();
                    if (result != null) {
                      PlatformFile file = result.files.first;

                      // Check the file extension (pdf, jpg, png)
                      List<String> allowedExtensions = [
                        'pdf',
                        'jpg',
                        'png'
                      ];
                      String fileExtension = file.extension!
                          .toLowerCase();

                      if (!allowedExtensions.contains(
                          fileExtension)) {
                        // If the file type is not allowed
                        _showErrorSnackBar(
                            'Only PDF, JPG, PNG files are allowed');
                        return; // Exit early if the file type is invalid
                      }

                      // Check the file size (limit: 2MB = 2 * 1024 * 1024 bytes)
                      if (file.size > 2 * 1024 * 1024) {
                        // If the file size exceeds 2MB
                        _showErrorSnackBar(
                            'File size must be less than 2MB');
                        return; // Exit early if the file size is too large
                      }
                      File filenameread=File(file.path!);
                      List<int>filebytes=await filenameread.readAsBytes();
                      base64code2=base64Encode(filebytes);
                      print(base64code2);
                      setState(() {
                        namefile2 = file.name;
                      });
                    }
                  },
                    child: const Text("Browser", style: TextStyle(fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily: "bopldtext"),),),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: mheight * 0.01, left: mwidth * 0.02),
                    child: Text(namefile2.toString(), style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        fontFamily: "regulartext",
                        color: Colors.grey),),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mheight*0.05,
          ),
          Center(
            ///Aadhaar frontupload Api stattment
            child: BlocListener<AadhaarfileFrontBloc,AadhaarfileFrontState>(
             listener: (context, state) async{
               log("Aadhaar frontupload =$state");
               final preferences = await SharedPreferences.getInstance();
               if(state is AadhaarfileFrontblocLoading){
                 showDialog(
                   context: context,
                   barrierDismissible: false,
                   builder: (BuildContext context) {
                     return const Center(
                         child: CircularProgressIndicator());
                   },
                 );
               }
               if(state is AadhaarfileFrontblocLoaded){
                 Navigator.of(context,rootNavigator: true).pop();
                 frontaadhaaruploadfilesModel=state.isaadhaaruploadfilesModel;
                 /// aadhaar backside upload Api call
                 Future.delayed(Duration(seconds: 2));
                 BlocProvider.of<AadhaarfileBackBloc>(context).add(FetchAadhaarfileback(
                     userId: preferences.getString("Userid")??"",
                     IdentityType: "CustomerCode",
                     IdentityValue: preferences.getString("CustomerCode")??"",
                     DocID_Value: aadhaarnumber.text,
                     DocType: "Aadhaar_Back",
                     DocBase64:base64code2??'',
                     applicationId: preferences.getString("applicationid")??"",
                     ctx: context));
               }
               if(state is AadhaarfileFrontblocError){
                 Navigator.of(context,rootNavigator: true).pop();
                 _showErrorSnackBar(state.Errormessage);
               }
               
                },
              ///Aadhaar upload backside statments
             child: BlocListener<AadhaarfileBackBloc, AadhaarfileBackState>(
                listener: (context, state)async {
                  log("Aadhaar back upload =$state");
                  final preferences = await SharedPreferences.getInstance();
                    if(state is AadhaarfileBackblocLoading){
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      );
                    }
                      if(state is AadhaarfileBackblocLoaded){
                        Navigator.of(context,rootNavigator: true).pop();
                        backaadhaaruploadfilesModel=state.aadhaaruploadfilesModel;
                        ///Customeronbording 1st call
                        Future.delayed(Duration(seconds: 2));
                        BlocProvider.of<CustomeronbordingBloc>(context).add(FetchCustomeronbording(
                            userid: preferences.getString("Userid")??"",
                            Customercode: preferences.getString("CustomerCode")??"",
                            partnercode: preferences.getString("partnercode")??"",
                            agentcode: preferences.getString("agentcode")??"",
                            ctx: context));
                      }
                      if(state is AadhaarfileBackblocError){
                        Navigator.of(context,rootNavigator: true).pop();
                        _showErrorSnackBar(state.Errormessage);
                      }
                      },
                   child: BlocListener<CustomeronbordingBloc, CustomeronbordingState>(
                   listener: (context, state) async{
                     log("Aadhaar Customeronbording upload =$state");
                     final preferences = await SharedPreferences.getInstance();
                     if(state is CustomeronbordingblocLoading){
                       showDialog(
                         context: context,
                         barrierDismissible: false,
                         builder: (BuildContext context) {
                           return const Center(
                               child: CircularProgressIndicator());
                         },
                       );
                     }
                     if(state is CustomeronbordingblocLoaded){
                       Navigator.of(context,rootNavigator: true).pop();
                       aadhaaruploadcustomeronbordingstatusModel=state.customeronbordingstatusModel;
                       Pageorderupload=aadhaaruploadcustomeronbordingstatusModel?.result?.pageOrder;
                       
                       ///Customerupdatenextprocess Api call
                       Future.delayed(Duration(seconds: 2));
                       BlocProvider.of<CustomerupdatenextBloc>(context).add(FetchCustomerupdate(
                           userid: preferences.getString("Userid")??"",
                           Customercode: preferences.getString("CustomerCode")??"",
                           PartnerCode: preferences.getString("partnercode")??"",
                           FlowId: preferences.getString("Flowid")??"",
                           PageOrder:Pageorderupload.toString(),
                           ApplicationId: preferences.getString("applicationid")??"",
                           PageType: preferences.getString("pagetype")??"",
                           ctx: context));
                     }
                     if(state is CustomeronbordingblocError){
                       Navigator.of(context,rootNavigator: true).pop();
                       _showErrorSnackBar(state.Errormessage);
                     }
                     
                   },
               child: BlocListener<CustomerupdatenextBloc, CustomerupdatenextState>(
                listener: (context, state) async{
                  log("Aadhaar Customerupdatenextprocess upload =$state");
                  final preferences = await SharedPreferences.getInstance();
                  if(state is CustomerupdatenextblocLoading){
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const Center(
                            child: CircularProgressIndicator());
                      },
                    );
                  }
                  if(state is CustomerupdatenextblocLoaded){
                    Navigator.of(context,rootNavigator: true).pop();
                    aadhaaruploadupadatenextprocessModel=state.upadatenextprocessModel;
                    ///customeronbording2 Api call process 
                    Future.delayed(Duration(seconds: 2));
                    BlocProvider.of<Customeronbording2Bloc>(context).add(FetchCustomeronbording2(
                        userid: preferences.getString("Userid")??"",
                        Customercode: preferences.getString("CustomerCode")??"",
                        partnercode: preferences.getString("partnercode")??"",
                        agentcode: preferences.getString("agentcode")??"",
                        ctx: context));
                  }
                  if(state is CustomerupdatenextblocError){
                    Navigator.of(context,rootNavigator: true).pop();
                    _showErrorSnackBar(state.Errormessage);
                  }
                  },
              child: BlocListener<Customeronbording2Bloc, Customeronbording2State>(
                listener: (context, state)async {
                  log("Aadhaar Customeronbording 2  upload =$state");
                  if(state is Customeronbording2blocLoading){
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const Center(
                            child: CircularProgressIndicator());
                      },
                    );
                  }
                  if(state is Customeronbording2blocLoaded){
                    aadhaaruploadcustomeronbording2model=state.customeronbording2model;
                    pagenameupload=aadhaaruploadcustomeronbording2model?.result?.pageName??"";
                    if(pagenameupload=="PersonalInfo"){
                      NavigationService.pushAndRemoveUntil(Personal_information(), (Route<dynamic>route) => false);
                    }
                  }
                  if(state is Customeronbording2blocError){
                    _showErrorSnackBar(state.Errormessage);
                  }
                   },
                 child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              backgroundColor: const Color(0xff284389),
            ),
            onPressed: () async {
               final preferences = await SharedPreferences.getInstance();
                Future.delayed(Duration(seconds: 2));
                BlocProvider.of<AadhaarfileFrontBloc>(context).add(
                  FetchAadhaarfilesFront(
                    userId: preferences.getString("Userid") ?? '',
                    IdentityType: "CustomerCode",
                    IdentityValue: preferences.getString("CustomerCode") ?? '',
                    DocID_Value: aadhaarnumber.text,
                    DocType: "Aadhaar_Front",
                    DocBase64: base64code1 ?? '',
                    applicationId: preferences.getString("applicationid") ?? '',
                    ctx: context,
                  ),
                );
            },
            child: const Text(
              "Submit",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white, fontFamily: "regulartext"),
            ),
                        ),
),
),
),
),
)
          )
        ]
      )
      )
        ]
    )
    );

  }
  void _showErrorSnackBar(String message) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Set the background color
          contentPadding: EdgeInsets.zero, // Remove default padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Customize corner radius
          ),
          content: Container(
            constraints: BoxConstraints(
              maxWidth: 300, // Set the maximum width
              minHeight: 150, // Set the minimum height
            ),
            padding: const EdgeInsets.all(16), // Padding for content
            color: Colors.blueGrey[50], // Set the container's background color
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "font2",
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff284389),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text(
                      "OK",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: "regulartext",
                        color: Colors.white,
                      ),
                    ), // Button text
                  ),
                ), // Add spacing between text and button
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
