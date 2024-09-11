import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/CustomersendotpApi/CustomersendotpApi.dart';

import '../../../modeles/customeronboradingModel/CustomersendotpModel/CustomersendotpModel.dart';
import '../../../widgets/tostmessage.dart';

part 'customersendotp_event.dart';
part 'customersendotp_state.dart';

class CustomersendotpBloc extends Bloc<CustomersendotpEvent, CustomersendotpState> {
  late CustomersendotpModel isCustomersendotp;
  CustomersendotpApi customersendotpApi=CustomersendotpApi();
  CustomersendotpBloc() : super(CustomersendotpInitial()) {
    on<FetchCustomersendotp>((event, emit)async {
      emit(CustomersendotpblocLoading());
      try{
        isCustomersendotp= await customersendotpApi.postCustomersendotpdata(event.userId, event.mobilenumber);
          emit(CustomersendotpblocLoaded());

         }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(CustomersendotpblocError());
      }
      // TODO: implement event handler
    });
  }
}
