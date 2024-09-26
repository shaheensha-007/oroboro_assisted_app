import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Aadhaaruploadfile_bloc/aadhaaruploadfiles_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modeles/customeronboradingModel/AadhaaruploadfilesModel/AadhaaruploadfilesModel.dart';
import 'addhaar number.dart';

class Aadhaarupload extends StatefulWidget {
  const Aadhaarupload({super.key});

  @override
  State<Aadhaarupload> createState() => _AadhaaruploadState();
}
String?namefile1;
String? namefile2;
String? base64code1;
String? base64code2;
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
                    child: const Text("Browers", style: TextStyle(fontSize: 12,
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
                      File filenameread=File(file.path!);
                      List<int>filebytes=await filenameread.readAsBytes();
                      base64code2=base64Encode(filebytes);
                      print(base64code2);
                      setState(() {
                        namefile2 = file.name;
                      });
                    }
                  },
                    child: const Text("Browers", style: TextStyle(fontSize: 12,
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
            child: BlocListener<AadhaaruploadfilesBloc, AadhaaruploadfilesState>(
              listener: (context, state) async {
                final preferences = await SharedPreferences.getInstance();

                // Show loading indicator when the state is loading
                if (state is AadhaaruploadfilesblocLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false, // Prevents dismissing the dialog manually
                    builder: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                }

                // When the state is loaded, remove the loading dialog
                if (state is AadhaaruploadfilesblocLoaded) {
                  Navigator.of(context).pop(); // Dismiss the loading dialog
                  isuploadAadhaarfiles = BlocProvider.of<AadhaaruploadfilesBloc>(context).isaadhaaruploadfiles;

                  if (isuploadAadhaarfiles.status.toString() == "Success") {
                    // Optionally handle success case here, such as showing a success message
                  } else {
                    // Handle error or failure state here if needed
                  }
                }

                // Handle error state
                if (state is AadhaaruploadfilesblocError) {
                  Navigator.of(context).pop(); // Dismiss the loading dialog if an error occurs
                  // Optionally, show an error message using a SnackBar or Dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text("An error occurred during the upload process."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the error dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  backgroundColor: const Color(0xff284389),
                ),
                onPressed: () async {
                  final preferences = await SharedPreferences.getInstance();

                  // First API Call
                  BlocProvider.of<AadhaaruploadfilesBloc>(context).add(FetchAadhaaruploadfile(
                    userId: preferences.getString("Userid").toString(),
                    IdentityType: "CUSTOMERCODE",
                    IdentityValue: preferences.getString("CustomerCode").toString(),
                    DocID_Value: aadhaarnumber.text,
                    DocType: "Aadhaar_Front",
                    DocBase64: base64code1.toString(),
                  ));

                  // Small delay or logic to ensure state updates before making the second call
                  await Future.delayed(Duration(milliseconds: 500));

                  // Second API Call
                  BlocProvider.of<AadhaaruploadfilesBloc>(context).add(FetchAadhaaruploadfile(
                    userId: preferences.getString("Userid").toString(),
                    IdentityType: "CUSTOMERCODE",
                    IdentityValue: preferences.getString("CustomerCode").toString(),
                    DocID_Value: aadhaarnumber.text,
                    DocType: "Aadhaar_Back",
                    DocBase64: base64code2.toString(),
                  ));
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white, fontFamily: "regulartext"),
                ),
              ),
            ),
          )
        ]
      )
      )
        ]
    )
    );

  }
}
