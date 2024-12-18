import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'loan_is_out_verification.dart';

class Upload_bank_book extends StatefulWidget {
  const Upload_bank_book({super.key});

  @override
  State<Upload_bank_book> createState() => _Upload_bank_bookState();
}
String? Base64converts;
String? filename;

class _Upload_bank_bookState extends State<Upload_bank_book> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
                const Text("Upload Bank Document",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
                SizedBox(
                  height: mheight*0.1,
                ),
                Container(
                  height:mheight*0.05,
                  width: mwidth*0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey,),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height:mheight*0.06,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: const Color(0xff284389),
                        ),

                        child: TextButton(onPressed: (){
                          _openFileExplorer();
                        },child: const Text("Browers",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: "boldtext"),),),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: mheight*0.01,left: mwidth*0.02),
                        child: Text(filename??"Cheque/Passbook Copy/Statement",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: "regulartext",color: Colors.grey),),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389)
                  ),  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Loan_is_verification()), (route) => false);
                  },
                      child:const Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ),
                SizedBox(
                  height: mheight*0.05,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  void _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      // Read the file as bytes
      File fileToRead = File(file.path!);
        List<int> fileBytes = await fileToRead.readAsBytes();

      // Convert bytes to base64 string
      Base64converts = base64Encode(fileBytes);
       setState(() {
         filename = file.name;
       });


      // Use the base64Image, such as uploading it to a server
      print('File picked: ${file.name}');
      print('File path: ${file.path}');
      print('Base64 Image: $Base64converts');
    } else {
      // User canceled the file picking
      print('User canceled file picking');
    }
  }

}

