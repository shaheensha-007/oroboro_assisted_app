import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/LoanmessageApi/LoanmessageApi.dart';

import '../../../modeles/customeronboradingModel/LoanmessageModel/LoanMessageModel.dart';
import '../../../widgets/tostmessage.dart';

part 'loanmessage_event.dart';
part 'loanmessage_state.dart';

class LoanmessageBloc extends Bloc<LoanmessageEvent, LoanmessageState> {
  LoanmessageApi loanmessageApi=LoanmessageApi();
  LoanmessageBloc() : super(LoanmessageInitial()) {
    on<Fetchloanmessage>((event, emit) async{
      emit(LoanmessageblocLoading());
      try{
        final Loanmessagemodelstatus=await loanmessageApi.postLoanmessageata(event.LoanId, event.ctx);
        emit(LoanmessageblocLoaded(loanMessageModel: Loanmessagemodelstatus));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(LoanmessageblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
