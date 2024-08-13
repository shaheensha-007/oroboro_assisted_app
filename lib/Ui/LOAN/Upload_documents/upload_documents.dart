import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../apparbar/myappbar.dart';


class Upload_document_loan extends StatefulWidget {
  const Upload_document_loan({super.key});

  @override
  State<Upload_document_loan> createState() => _Upload_document_loanState();
}
TextEditingController loannumber=TextEditingController();
TextEditingController panno=TextEditingController();
TextEditingController documenttype=TextEditingController();
class _Upload_document_loanState extends State<Upload_document_loan> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const MyAppbar(),
      ),
      body:Stack(
        children: [
          Padding(
            padding:EdgeInsets.only(left: mwidth*0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mheight*0.1,
                ),
                const Text("Upload Document",style: TextStyle(fontSize:18,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
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
                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                      controller: loannumber,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Loan No.",
                        hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                      ),
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
                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                      controller: panno,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Pan No.",
                        hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                      ),
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
                      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,fontFamily: "regulartext"),
                      controller: documenttype,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "Document Type",
                        hintStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                        errorStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w200,fontFamily: "regulartext"),
                      ),
                    ),
                  ),
                ),
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
                        height:mheight*0.05,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          color: const Color(0xff284389),
                        ),

                        child: TextButton(onPressed: (){
                          _openFileExplorer();
                        },child: const Text("Browers",style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w800,fontFamily: "bopldtext"),),),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: mheight*0.01,left: mwidth*0.02),
                        child: const Text("Upload  aadhaar front",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,fontFamily: "regulartext",color: Colors.grey),),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mheight*0.1,
                ),
                SizedBox(
                  width: mwidth*0.8,
                  child: ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389)
                  ),  onPressed: (){
                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>), (route) => false);
                  },
                      child:const Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ),
              ],
            ),
          )
        ],
      ) ,
    );
  }
}
void _openFileExplorer() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;

    // Use the picked file, such as uploading it to a server
    print('File picked: ${file.name}');
    print('File path: ${file.path}');
  } else {
    // User canceled the file picking
    print('User canceled file picking');
  }
}