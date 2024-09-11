import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/Customer_regsitrationApi/Customer_regsitrationApi.dart';

import '../../../modeles/customeronboradingModel/customer_regsitrationModel/Customer_regsitrationModel.dart';
import '../../../widgets/tostmessage.dart';

part 'customer_regsitration_event.dart';
part 'customer_regsitration_state.dart';

class CustomerRegsitrationBloc extends Bloc<CustomerRegsitrationEvent, CustomerRegsitrationState> {
  late Customer_regsitrationModel iscustomerregsitration;
  CustomerregsitrationApi customerregsitrationApi=CustomerregsitrationApi();
  CustomerRegsitrationBloc() : super(CustomerRegsitrationInitial()) {
    on<FetchCustomerregistration>((event, emit) async{
      emit(CustomerRegsitrationblocLoading());
      try{
        iscustomerregsitration=await customerregsitrationApi.postCustomerregsitrtiondata(event.userId, event.data);
        emit(CustomerRegsitrationblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(CustomerRegsitrationblocError());
      }
      // TODO: implement event handler
    });
  }
}
