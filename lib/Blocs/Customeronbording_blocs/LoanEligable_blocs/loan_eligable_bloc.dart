import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/LoanEligableApi/LoanEligableApi.dart';

import '../../../modeles/customeronboradingModel/LoanEligableModel/LoanEligableModel.dart';
import '../../../widgets/tostmessage.dart';

part 'loan_eligable_event.dart';
part 'loan_eligable_state.dart';

class LoanEligableBloc extends Bloc<LoanEligableEvent, LoanEligableState> {
  late LoanEligableModel isloanEligableModel;
  LoanEligableApi loanEligableApi=LoanEligableApi();
  LoanEligableBloc() : super(LoanEligableInitial()) {
    on<FetchLoanEligable>((event, emit) async{
      emit(LoanEligableblocLoading());
      try{
        isloanEligableModel=await loanEligableApi.postLoaneligabledata(event.userid, event.Customercode, event.partnercode, event.agentcode, event.ctx);
        emit(LoanEligableblocLoaded(loanEligableModel: isloanEligableModel));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(LoanEligableblocError(Errormessasge: e.toString()));
      }

      // TODO: implement event handler
    });
  }
}
