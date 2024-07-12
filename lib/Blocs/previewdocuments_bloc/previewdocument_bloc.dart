import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/previewdocumentApi/PreviewdocumentApi.dart';

import '../../modeles/Priviewdocumentmodel/PreviewdocumentModel.dart';
import '../../widgets/tostmessage.dart';

part 'previewdocument_event.dart';
part 'previewdocument_state.dart';

class PreviewdocumentBloc extends Bloc<PreviewdocumentEvent, PreviewdocumentState> {
  late PreviewdocumentModel ispreviewdocument;
  PreviewdocumentApi previewdocumentApi=PreviewdocumentApi();
  PreviewdocumentBloc() : super(PreviewdocumentInitial()) {
    on<FetchPreviewdocument>((event, emit) async{
      emit(Previewdocumentblocloading());
      try{
        ispreviewdocument=await previewdocumentApi.postPreviewesigndocumentData(event.clientId, event.PAN, event.OnboardingFor, event.ctx);
       emit(PreviewdocumentblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: "Internal server error occurs. Bad Request Format");

        print('*****$e');
        emit(PreviewdocumentblocError());
      }
      // TODO: implement event handler
    });
  }
}
