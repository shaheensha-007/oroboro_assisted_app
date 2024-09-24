import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/AadhaarsendOtpApi/AadhaarsendApi.dart';
import 'package:oroboro_assisted_app/widgets/tostmessage.dart';

import '../../../modeles/customeronboradingModel/AadhaarsendOtpModel/AadhaarsendotpModel.dart';

part 'aadhaarsendotp_event.dart';
part 'aadhaarsendotp_state.dart';

class AadhaarsendotpBloc extends Bloc<AadhaarsendotpEvent, AadhaarsendotpState> {
  late AadhaarsendotpModel isaadhaarsendotp;
  AadhaarsendotpApi aadhaarsendotpApi=AadhaarsendotpApi();
  AadhaarsendotpBloc() : super(AadhaarsendotpInitial()) {
    on<FetchAadhaarsendotp>((event, emit) async {
      emit(AadhaarSendotpblocLoading());
      try{
        isaadhaarsendotp=await aadhaarsendotpApi.postAadhaarsendOtpdata(event.userId, event.Customercode, event.Aadhaar);
        emit(AadhaarSendOtpblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(AadhaarSendOtpblocError());
      }
      // TODO: implement event handler
    });
  }
}
