import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';


import '../../../../Apis/CustomeronbordingApies/Customer_onbordingApi/Customeronbording2Api/Customeronbording2Api.dart';
import '../../../../Apis/CustomeronbordingApies/Customer_onbordingApi/CustomeronbordingApi.dart';
import '../../../../modeles/customeronboradingModel/Customer_onbordingStatusModel/Customer_onbording2model/Customeronbording2Model.dart';
import '../../../../modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'customeronbording2_event.dart';
part 'customeronbording2_state.dart';

class Customeronbording2Bloc extends Bloc<Customeronbording2Event, Customeronbording2State> {
  late Customeronbording2Model  iscustomeronbordingstatusModel2;
  Customeronbording2Api customeronbording2api= Customeronbording2Api();
  Customeronbording2Bloc() : super(Customeronbording2Initial()) {
    on<FetchCustomeronbording2>((event, emit)async {
      emit(Customeronbording2blocLoading());
      try{
        iscustomeronbordingstatusModel2=await customeronbording2api.postCustomeronbording2statusdata(event.userid, event.Customercode, event.partnercode, event.agentcode, event.ctx);
        emit(Customeronbording2blocLoaded(customeronbording2model: iscustomeronbordingstatusModel2));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(Customeronbording2blocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
