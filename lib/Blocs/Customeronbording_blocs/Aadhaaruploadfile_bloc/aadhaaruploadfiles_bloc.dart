import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/AadhaaruploadfilesApi/AadhaaruploadfilesApi.dart';

import '../../../modeles/customeronboradingModel/AadhaaruploadfilesModel/AadhaaruploadfilesModel.dart';
import '../../../widgets/tostmessage.dart';

part 'aadhaaruploadfiles_event.dart';
part 'aadhaaruploadfiles_state.dart';

class AadhaaruploadfilesBloc extends Bloc<AadhaaruploadfilesEvent, AadhaaruploadfilesState> {
  late AadhaaruploadfilesModel isaadhaaruploadfiles;
  AadhaaruploadfilesApi aadhaaruploadfilesApi=AadhaaruploadfilesApi();
  AadhaaruploadfilesBloc() : super(AadhaaruploadfilesInitial()) {
    on<FetchAadhaaruploadfile>((event, emit)async {
      emit(AadhaaruploadfilesblocLoading());
      try{
        isaadhaaruploadfiles=await aadhaaruploadfilesApi.postAadhaaruploadfilesdata(event.userId, event.IdentityType, event.IdentityValue,event.DocID_Value, event.DocType, event.DocBase64,event.ctx);
        emit(AadhaaruploadfilesblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(AadhaaruploadfilesblocError());
      }
      // TODO: implement event handler
    });
  }
}
