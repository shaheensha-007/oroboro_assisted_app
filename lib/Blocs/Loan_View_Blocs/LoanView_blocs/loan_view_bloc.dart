import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/Loan_ViewApies/LoanViewApi/LoanViewApi.dart';
import 'package:oroboro_assisted_app/modeles/Loan_View_Models/LoanViewModel/LoanViewModel.dart';

import '../../../widgets/tostmessage.dart';

part 'loan_view_event.dart';
part 'loan_view_state.dart';

class LoanViewBloc extends Bloc<LoanViewEvent, LoanViewState> {
  LoanViewApi laonViewApi=LoanViewApi();
  LoanViewBloc() : super(LoanViewInitial()) {
    on<FetchLoanView>((event, emit)async {
      emit(LoanViewblocLoading());
      try{
        final Loanviewdata=await laonViewApi.postLoanviewdatadata(event.userId, event.index, event.pageSize, event.GroupName,event.ApplicationStatus, event.Fromdate, event.Todate, event.ctx);
        emit(LoanViewblocLoaded(loanViewModel: Loanviewdata));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(LoanViewblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
