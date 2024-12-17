import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/personalinformationApis/Co_borrowerApi/Co_borrowerApi.dart';

import '../../../../modeles/customeronboradingModel/Personal_informationmodel/Co-borrowerModel/Co_borrowerModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'co_borrower_event.dart';
part 'co_borrower_state.dart';

class CoBorrowerBloc extends Bloc<CoBorrowerEvent, CoBorrowerState> {
  late CoBorrowerModel isCoborrower;
  Co_borrowerApi co_borrowerApi=Co_borrowerApi();
  CoBorrowerBloc() : super(CoBorrowerInitial()) {
    on<FetchCoBorrower>((event, emit)async {
      emit(CoBorrowerblocLoding());
      try{
        isCoborrower=await co_borrowerApi.postcoborrowerdata(event.userId, event.Customercode, event.ApplicationId, event.data, event.ctx);
        emit(CoBorrowerblocLoaded(coBorrowerModel: isCoborrower));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(CoBorrowerblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
