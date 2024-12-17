import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:oroboro_assisted_app/Ui/Signup/agent_onbording/enter_pan.dart';
import 'package:oroboro_assisted_app/Ui/Signup/agentbusiness_onborading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';


import '../../Blocs/Signupblocs/Agentbusiness_bloc/agentbusiness_bloc.dart';
import '../../modeles/signupModelclass/AgentbusinessModel/AgentbusinessModel.dart';
import '../Signin/signin_page.dart';
import 'Preview_document/Preview_of documents.dart';

class Draw_in_signature extends StatefulWidget {
  const Draw_in_signature({super.key});

  @override
  State<Draw_in_signature> createState() => _Draw_in_signatureState();
}

late AgentbusinessModel Agentbusiness;
String? base64Signature;
late String lat;
late String long;
class _Draw_in_signatureState extends State<Draw_in_signature> {
  final SignatureController _controller = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 4,
  );

  ///MAIN PROGRAMMING LOCATION
  Future<Position> getCurrentLocation()async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission denied');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    getCurrentLocation().then((Position){
      setState(() {
        lat=Position.latitude.toString();
        long =Position.longitude.toString();
      });
    });
    // TODO: implement initState
    super.initState();
  }

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
                child: const Text("Draw your Signature",style: TextStyle(fontSize: 20,fontFamily: "boldtext",fontWeight: FontWeight.w800),),
              ),
              SizedBox(
                height: mheight*0.1,
              ),
              Center(
                child: Container(
                  height: mheight*0.4,
                  width: mwidth*0.9,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width:2),
                  ),
                  child: BlocListener<AgentbusinessBloc, AgentbusinessState>(
  listener: (context, state) {
    if(state is AgentbusinessblocLoading){
      const CircularProgressIndicator();
    }
    if(state is AgentbusinessblocError){
      _showErrorSnackBar("internal server issue");
    }
    if(state is AgentbusinessblocLoaded){
      Agentbusiness=BlocProvider.of<AgentbusinessBloc>(context).isagentbusiness;
      print(Agentbusiness);
      if(Agentbusiness.result!.activityStatus=="SUCCESS"){
        final errormessage=Agentbusiness.message.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errormessage),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Preview_of_documents()), (route) => false);
      }
      else{
        final errormessage=Agentbusiness.message.toString();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errormessage),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Agent_business_onboarding()), (route) => false);
      }
    }
    // TODO: implement listener
  },
  child: Signature(

                                    controller: _controller,
                                    backgroundColor: Colors.white10,
                                    height: mheight * 0.4,
                                    width: mwidth*0.8,
                                  ),
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
                      backgroundColor: const Color(0xff284389)
                  ),  onPressed: () => _controller.clear(),
                   child:const Text("Clear",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),

                  ElevatedButton(style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389)
                  ), onPressed: ()async{
                    final Uint8List? signatureBytes = await _controller.toPngBytes();

                    // Check if the signature is empty
                    if (signatureBytes == null || signatureBytes.isEmpty) {
                      _showErrorSnackBar("Please draw your signature before submitting.");
                      return;
                    }
                    setState(() {
                      base64Signature = base64Encode(signatureBytes);
                    });

                    final SharedPreferences preferences = await SharedPreferences.getInstance();
                    BlocProvider.of<AgentbusinessBloc>(context).add(FetchAgentbusiness(
                        clientId: MainclientId,
                        PAN: Pannumber.text,
                        PartnerCode: preferences.getString("partnercode").toString(),
                        OnboardingFor: "Agent",
                        GSTNUMBER: gstnumber.text,
                        REGISTRATIONTYPE: "GST",
                        AGENTNAME: ownername.text,
                        BRANDNAME: shopname.text,
                        TANNUMBER: tannumber.text,
                        TELEPHONE: preferences.getString("MOBILENUMBER").toString(),
                        SIGNATURE: base64Signature!,
                        LATITUDE: lat,
                        LONGITUDE: long,
                        ctx: context
                    ));
      },child:const Text("Sumbit",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.white,fontFamily: "regulartext"),)),
                  ]
              ),
      ),
            ],
          )
        ],
      ),
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
                    child: const Text("OK", style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      fontFamily: "regulartext",
                      color: Colors.white,
                    ),), // Button text
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
   setState(() {
     _controller.clear();
     gstnumber.clear();
     shopname.clear();
     ownername.clear();
     tannumber.clear();

   });
    // TODO: implement dispose
    super.dispose();
  }
}
