import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:oroboro_assisted_app/Ui/Signin/signin_page.dart';
import 'package:oroboro_assisted_app/Ui/Signup/Preview_document/pdfview.dart';
import 'package:oroboro_assisted_app/Ui/Signup/agent_onbording/enter_pan.dart';

import '../../../Blocs/Signupblocs/Esign_bloc/esign_bloc.dart';
import '../../../Blocs/Signupblocs/previewdocuments_bloc/previewdocument_bloc.dart';
import '../../../modeles/signupModelclass/EsignagreementModel/EsignagreementModel.dart';
import '../../../modeles/signupModelclass/Priviewdocumentmodel/PreviewdocumentModel.dart';
import '../bank_registration.dart';

class Preview_of_documents extends StatefulWidget {
  const Preview_of_documents({super.key});

  @override
  State<Preview_of_documents> createState() => _Preview_of_documentsState();
}

String base64String = '';
late PreviewdocumentModel previewdocumentdata;
late EsignagreementModel esignagreementprocess;

class _Preview_of_documentsState extends State<Preview_of_documents> {
  @override
  Widget build(BuildContext context) {
    var mheight = MediaQuery.of(context).size.height;
    var mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: mheight * 0.1,
            ),
            Padding(
              padding: EdgeInsets.only(right: mwidth * 0.3),
              child: const Text(
                "Preview Agreement",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "boldtext",
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: mheight * 0.7,
            ),
            Row(
              verticalDirection: VerticalDirection.up,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocListener<PreviewdocumentBloc, PreviewdocumentState>(
                  listener: (context, state) {
                    if (state is Previewdocumentblocloading) {
                      const CircularProgressIndicator();
                    }
                    if (state is PreviewdocumentblocError) {
                      _showErrorSnackBar("Internal server issue");
                    }
                    if (state is PreviewdocumentblocLoaded) {
                      previewdocumentdata =
                          BlocProvider.of<PreviewdocumentBloc>(context)
                              .ispreviewdocument;
                      if (previewdocumentdata.result != null &&
                          previewdocumentdata.result!.fileBytes != null) {
                        setState(() {
                          base64String = previewdocumentdata.result!.fileBytes!.toString();
                          print("Value is shaheen pk $base64String");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PDFViewerPage(
                                  convertbase: base64String),
                            ),
                          );
                        });
                      }
                    }
                  },
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389),
                    ),
                    onPressed: () {
                      BlocProvider.of<PreviewdocumentBloc>(context).add(
                        FetchPreviewdocument(
                          clientId: MainclientId,
                          PAN: Pannumber.text,
                          OnboardingFor: "Agent",
                          ctx: context,
                        ),
                      );
                    },
                    child: const Text(
                      "Preview document",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontFamily: "regulartext"),
                    ),
                  ),
                ),
                SizedBox(
                  width: mwidth*0.05,
                ),
                BlocListener<EsignBloc, EsignState>(
  listener: (context, state) {
    if(state is EsignblocLoading){
      const CircularProgressIndicator();
    }
    if(state is EsignblocLoaded){
      esignagreementprocess=BlocProvider.of<EsignBloc>(context).isvalidesign;
      if(esignagreementprocess.result!.activityStatus=="SUCCESS"){
       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Bank_registration()), (route) => false);
      }else{
        final esignmessage=esignagreementprocess.message.toString();
        _showErrorSnackBar(esignmessage);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const Preview_of_documents()), (route) => false);
      }
    }
    // TODO: implement listener
  },
  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: const Color(0xff284389)),
                  onPressed: () {
                   BlocProvider.of<EsignBloc>(context).add(FetchEsin(
                       clientId: MainclientId, PAN: Pannumber.text, OnboardingFor: "Agent", ctx: context));
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontFamily: "regulartext"),
                  ),
                ),
),
              ],
            ),
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
