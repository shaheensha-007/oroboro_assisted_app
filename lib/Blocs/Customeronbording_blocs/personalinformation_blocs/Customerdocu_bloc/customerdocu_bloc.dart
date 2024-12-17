import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/personalinformationApis/Customerdocu_Api/Customerdocu_Api.dart';

import '../../../../modeles/customeronboradingModel/Personal_informationmodel/Customerdocu_Model/Customerdocu_Model.dart';
import '../../../../widgets/tostmessage.dart';

part 'customerdocu_event.dart';
part 'customerdocu_state.dart';

class CustomerdocuBloc extends Bloc<CustomerdocuEvent, CustomerdocuState> {
  late CustomerdocuModel iscustomerdocuModel;
  Customerdocu_Api customerdocu_api=Customerdocu_Api();
  CustomerdocuBloc() : super(CustomerdocuInitial()) {
    on<FetchCustomerdocu>((event, emit) async{
      emit(CustomerdocublocLoding());
      try{
       iscustomerdocuModel=await customerdocu_api.postcustomerdocudata(event.userId, event.IdentityType, event.Identity, event.applicationId, event.DocType, event.DocBase64, event.ctx);
        emit(CustomerdocublocLoaded(customerdocuModel: iscustomerdocuModel));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(CustomerdocublocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
