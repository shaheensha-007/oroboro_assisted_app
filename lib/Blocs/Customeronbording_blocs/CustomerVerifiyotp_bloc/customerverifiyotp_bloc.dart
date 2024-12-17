import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/CustomerverifiyotpApi/CustomerverifiyApi.dart';

import '../../../modeles/customeronboradingModel/CustomerverifiyotpModel/CustomerVerifiyotpModel.dart';
import '../../../widgets/tostmessage.dart';

part 'customerverifiyotp_event.dart';
part 'customerverifiyotp_state.dart';

class CustomerverifiyotpBloc extends Bloc<CustomerverifiyotpEvent, CustomerverifiyotpState> {
  late CustomerVerifiyotpModel iscustomerverifiyotp;
  CustomerverifiyotpApi customerverifiyotpApi=CustomerverifiyotpApi();
  CustomerverifiyotpBloc() : super(CustomerverifiyotpInitial()) {
    on<FetchCustomerVerifiyotp>((event, emit)async {
      emit(CustomerverifiyotpblocLoading());
      try{
        iscustomerverifiyotp=await customerverifiyotpApi.postCustomerVerifiyotpdata(event.userId, event.mobilenumber, event.Mobilenumberotp,event.ctx);
        emit(CustomerverifiyotpblocLoaded(customerVerifiyotpModel: iscustomerverifiyotp));
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(CustomerverifiyotpblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
