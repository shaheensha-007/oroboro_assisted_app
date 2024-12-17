import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/PanverificationApi/CibilscoreApi/CibilscoreApi.dart';

import '../../../../modeles/customeronboradingModel/panverificationModel/CIBILscoreModel/CibilscoreModel.dart';

part 'cibilscore_event.dart';
part 'cibilscore_state.dart';

class CibilscoreBloc extends Bloc<CibilscoreEvent, CibilscoreState> {
  CilbilscoreApi cibilscoreApi=CilbilscoreApi();
  CibilscoreBloc() : super(CibilscoreInitial()) {
    on<FetchCilbilscore>((event, emit)async {
      emit(CibilscoreblocLoading());
      try{
        final cibilscoremodel=await cibilscoreApi.postCibilscoredata(event.userid, event.Customercode, event.ApplicationId, event.PAN, event.Name, event.Address, event.City, event.State, event.Pincode, event.Dob, event.ctx);
        emit(CibilscoreblocLoaded(cibilscoreModel: cibilscoremodel));
      }catch(e){
        emit(CibilscoreblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
