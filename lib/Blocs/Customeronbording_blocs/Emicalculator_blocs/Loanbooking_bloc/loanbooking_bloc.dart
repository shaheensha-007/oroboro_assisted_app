import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/EmicalculatorApis/LoanbookingApi/LoanbookingApi.dart';

import '../../../../modeles/EmicalculatorModels/LoanbookingModel/LoanbookingModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'loanbooking_event.dart';
part 'loanbooking_state.dart';

class LoanbookingBloc extends Bloc<LoanbookingEvent, LoanbookingState> {
  late LoanbookingModel isloanbookingModel;
  LoanbookingApi loanbookingApi=LoanbookingApi();
  LoanbookingBloc() : super(LoanbookingInitial()) {
    on<FetchLoanbooking>((event, emit)async {
      emit(LoanbookingblocLoading());
      try{
        isloanbookingModel=await loanbookingApi.postLoanboookingdata(event.userid, event.Customercode, event.ApplicationId, event.partnercode, event.agentcode, event.ProductId, event.Tenure, event.EmiAmount,event.Frequency, event.Loanamout, event.ctx);
        emit(LoanbookingblocLoaded(loanbookingModel: isloanbookingModel));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(LoanbookingblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
