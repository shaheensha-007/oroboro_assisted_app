import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/MobileotpverifyApi/MobileotpverifyApi.dart';

import '../../modeles/MobileOtpVerifyModel/MobileOtpverifyModel.dart';
import '../../widgets/tostmessage.dart';

part 'mobileotpverify_event.dart';
part 'mobileotpverify_state.dart';

class MobileotpverifyBloc extends Bloc<MobileotpverifyEvent, MobileotpverifyState> {
  late MobileOtpverifyModel ismobileOtp;
  MobileotpverifyApi mobileotpverifyApi=MobileotpverifyApi();
  MobileotpverifyBloc() : super(MobileotpverifyInitial()) {
    on<FetchMobileotpverify>((event, emit)async {
      emit(MobileotpverifyblocLoading());
      try{
        ismobileOtp=await mobileotpverifyApi.postotpData(event.clientId, event.Mobile, event.Otp, event.OnboardingFor, event.ctx);
        emit(MobileotpverifyblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: "Internal server error occurs. Bad Request Format");

        print('*****$e');
        emit(MobileotpverifyblocError());
      }
      // TODO: implement event handler
    });
  }
}
