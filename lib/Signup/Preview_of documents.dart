import 'package:flutter/material.dart';

import 'bank_registration.dart';

class Preview_of_documents extends StatefulWidget {
  const Preview_of_documents({super.key});

  @override
  State<Preview_of_documents> createState() => _Preview_of_documentsState();
}

class _Preview_of_documentsState extends State<Preview_of_documents> {
  @override
  Widget build(BuildContext context) {
    var mheight= MediaQuery.of(context).size.height;
    var mwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
               height: mheight*0.1,
              ),
              Padding(
                padding:EdgeInsets.only(right:mwidth*0.3),
                child: Text("Preview Agreement",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
              ),
              SizedBox(
                height: mheight*0.7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Color(0xff284389)
                  ),  onPressed: (){},
                      child:Text("Preview document",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                  ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: Color(0xff284389)
                  ),  onPressed: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Bank_registration()), (route) => false);
                  },
                      child:Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
