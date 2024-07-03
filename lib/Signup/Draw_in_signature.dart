import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import 'Preview_of documents.dart';

class Draw_in_signature extends StatefulWidget {
  const Draw_in_signature({super.key});

  @override
  State<Draw_in_signature> createState() => _Draw_in_signatureState();
}

class _Draw_in_signatureState extends State<Draw_in_signature> {
  SignatureController _controller = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 4,
  );
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
                child: Text("Draw your Signature",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
              ),
              SizedBox(
                height: mheight*0.05,
              ),
              Center(
                child: Container(
                  height: mheight*0.4,
                  width: mwidth*0.8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: Signature(
                    controller: _controller,
                    backgroundColor: Colors.grey,
                    height: mheight * 0.4,
                    width: mwidth*0.8,
                  ),
                ),
              ),
      SizedBox(
        height: mheight * 0.03,
      ),
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                backgroundColor: Color(0xff284389)
            ),  onPressed: () => _controller.clear(),
             child:Text("Clear",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
            ElevatedButton(style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                backgroundColor: Color(0xff284389)
            ), onPressed: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Preview_of_documents()), (route) => false);
            },
                child:Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
            ]
        ),
      ),
            ],
          )
        ],
      ),
    );
  }
}
