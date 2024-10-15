import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/AadhaarotpverificationApi/AadhaarotpverificationApi.dart';

import '../../../modeles/customeronboradingModel/AadhaarOtpVerificationModel/AadhaarOtpVerificationModel.dart';
import '../../../widgets/tostmessage.dart';

part 'aadhaarotpverification_event.dart';
part 'aadhaarotpverification_state.dart';

class AadhaarotpverificationBloc extends Bloc<AadhaarotpverificationEvent, AadhaarotpverificationState> {
  late AadhaarOtpVerificationModel isAadhaarotpverification;
  AadhaarotpverificationApi aadhaarotpverificationApi=AadhaarotpverificationApi();
  AadhaarotpverificationBloc() : super(AadhaarotpverificationInitial()) {
    on<FetchAadhaarotpverification>((event, emit) async{
      emit(AadhaarotpverificationblocLoading());
      try{
        isAadhaarotpverification=await aadhaarotpverificationApi.postAadhaarotpverificatondata(event.userId,event.Customercode, event.Aadhaarotp, event.Requestid,event.ctx);
        emit(AadhaarotpvetrificationblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(AadhaarotpverificationblocError());
      }
      // TODO: implement event handler
    });
  }
}
