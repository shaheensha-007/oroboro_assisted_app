import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/Customer_onbordingApi/CustomeronbordingApi.dart';

import '../../../modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingStatusModel.dart';
import '../../../widgets/tostmessage.dart';

part 'customeronbording_event.dart';
part 'customeronbording_state.dart';

class CustomeronbordingBloc extends Bloc<CustomeronbordingEvent, CustomeronbordingState> {
  late CustomeronbordingstatusModel isCustomeronbording;
  CustomeronbordingApi customeronbordingApi=CustomeronbordingApi();
  CustomeronbordingBloc() : super(CustomeronbordingInitial()) {
    on<FetchCustomeronbording>((event, emit) async{
      emit(CustomeronbordingblocLoading());
      try{
        isCustomeronbording=await customeronbordingApi.postCustomeronbordingstatusdata(event.userid, event.Customercode,event.ctx);
        emit(CustomeronbordingblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(CustomeronbordingblocError());
      }
      // TODO: implement event handler
    });
  }
}
