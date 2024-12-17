import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/EmicalculatorApis/EmitenuresendotpApi/EmitenuresendotpApi.dart';

import '../../../../modeles/EmicalculatorModels/EmitenuresendOtpModel/EmitenureModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'emitenuresendotp_event.dart';
part 'emitenuresendotp_state.dart';

class EmitenuresendotpBloc extends Bloc<EmitenuresendotpEvent, EmitenuresendotpState> {
  late EmitenuresendotpModel isemitenuresendotpModel;
  EmitenuresendotpApi emitenuresendotpApi=EmitenuresendotpApi();
  EmitenuresendotpBloc() : super(EmitenuresendotpInitial()) {
    on<FetchEmitenuresendotp>((event, emit)async {
      emit(EmitenuresendotpblocLoading());
      try{
        isemitenuresendotpModel=await emitenuresendotpApi.postEmitenuresendotpdata(event.userid, event.Customercode, event.mobilenumber, event.Loanamout, event.Tenure, event.Emi, event.ctx);
        emit(EmitenuresendotpblocLoaded(emitenuresendotpModel: isemitenuresendotpModel));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(EmitenuresendotpblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
