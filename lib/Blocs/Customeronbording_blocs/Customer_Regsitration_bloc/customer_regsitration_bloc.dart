import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/Customer_regsitrationApi/Customer_regsitrationApi.dart';

import '../../../modeles/customeronboradingModel/customer_regsitrationModel/Customer_regsitrationModel.dart';
import '../../../widgets/tostmessage.dart';

part 'customer_regsitration_event.dart';
part 'customer_regsitration_state.dart';

class CustomerRegsitrationBloc extends Bloc<CustomerRegsitrationEvent, CustomerRegsitrationState> {
  CustomerregsitrationApi customerregsitrationApi=CustomerregsitrationApi();
  CustomerRegsitrationBloc() : super(CustomerRegsitrationInitial()) {
    on<FetchCustomerregistration>((event, emit) async{
      emit(CustomerRegsitrationblocLoading());
      try{
       final customerRegistrationStatus=await customerregsitrationApi.postCustomerregsitrtiondata(event.userId, event.data,event.ctx);
        emit(CustomerRegsitrationblocLoaded(customerRegistrationStatus: customerRegistrationStatus));
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(CustomerRegsitrationblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
