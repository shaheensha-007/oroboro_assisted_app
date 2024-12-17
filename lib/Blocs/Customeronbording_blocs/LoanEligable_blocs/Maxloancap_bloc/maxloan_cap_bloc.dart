import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/LoanEligableApi/MaxloancapApi/MaxloancapApi.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/LoanEligableModel/MaxloanCapModel/MaxloancapModel.dart';

import '../../../../widgets/tostmessage.dart';

part 'maxloan_cap_event.dart';
part 'maxloan_cap_state.dart';

class MaxloanCapBloc extends Bloc<MaxloanCapEvent, MaxloanCapState> {
  MaxloancapApi maxloancapApi=MaxloancapApi();
  MaxloanCapBloc() : super(MaxloanCapInitial()) {
    on<FetchMaxloancap>((event, emit) async{
      emit(MaxloanCapblocLoading());
      try{
        final maxloancapstatus=await maxloancapApi.postMaxloancapdata(event.userid, event.Customercode, event.ctx);
        emit(MaxloanCapblocLoaded(ismaxloancapmodel: maxloancapstatus));
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(MaxloanCapblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
