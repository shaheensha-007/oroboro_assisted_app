import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        isaadhaarsendotp=await aadhaarsendotpApi.postAadhaarsendOtpdata(event.userId, event.Customercode, event.Aadhaar,event.applicationId, event.ctx);
        emit(AadhaarSendOtpblocLoaded(aadhaarsendotpModel: isaadhaarsendotp));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(AadhaarSendOtpblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
