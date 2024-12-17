import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/AadhaaruploadfilesApi/Aadhaarfileupload_frontApi/Aadhaarfileupload_frontApi.dart';

import '../../../../modeles/customeronboradingModel/AadhaaruploadfilesModel/AadhaaruploadfilesModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'aadhaarfile_front_event.dart';
part 'aadhaarfile_front_state.dart';

class AadhaarfileFrontBloc extends Bloc<AadhaarfileFrontEvent, AadhaarfileFrontState> {
  Aadhaarfileupload_frontApi aadhaarfileupload_frontApi=Aadhaarfileupload_frontApi();
  AadhaarfileFrontBloc() : super(AadhaarfileFrontInitial()) {
    on<FetchAadhaarfilesFront>((event, emit)async{
      emit(AadhaarfileFrontblocLoading());
      try{
        final uploadaadhaarfront=await aadhaarfileupload_frontApi.postAadhaarfrontuploadsdata(event.userId, event.IdentityType, event.IdentityValue, event.DocID_Value, event.DocType,event.DocBase64, event.applicationId, event.ctx);
        emit(AadhaarfileFrontblocLoaded(isaadhaaruploadfilesModel: uploadaadhaarfront));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(AadhaarfileFrontblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
