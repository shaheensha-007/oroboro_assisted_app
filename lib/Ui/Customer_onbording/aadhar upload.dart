import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:oroboro_assisted_app/Ui/Customer_onbording/personal%20information.dart';

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
                      // Convert the file to base64 string
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
            child: ElevatedButton(style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                backgroundColor: const Color(0xff284389)
            ),  onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Personal_information()), (route) => false);
            },
                child:const Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
          ),

      ]
      )
      )
        ]
    )
    );

  }
}
