import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/AadhaaruploadfilesApi/Aadhaarfileupload_backApi/Aadhaarfileupload_backApi.dart';

import '../../../../modeles/customeronboradingModel/AadhaaruploadfilesModel/AadhaaruploadfilesModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'aadhaarfile_back_event.dart';
part 'aadhaarfile_back_state.dart';

class AadhaarfileBackBloc extends Bloc<AadhaarfileBackEvent, AadhaarfileBackState> {
  AadhaarfileUpload_backApi aadhaarfileUpload_backApi=AadhaarfileUpload_backApi();
  AadhaarfileBackBloc() : super(AadhaarfileBackInitial()) {
    on<FetchAadhaarfileback>((event, emit) async{
      emit(AadhaarfileBackblocLoading());
      try{
        final uploadaadhaarback=await aadhaarfileUpload_backApi.postAadhaarbackuploadsdata(event.userId, event.IdentityType, event.IdentityValue, event.DocID_Value, event.DocType, event.DocBase64, event.applicationId, event.ctx);
        emit(AadhaarfileBackblocLoaded(aadhaaruploadfilesModel: uploadaadhaarback));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(AadhaarfileBackblocError(Errormessage: e.toString()));
      }

      // TODO: implement event handler
    });
  }
}
