import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/EmicalculatorApis/calculatorEmiApi/calculatoremiApi.dart';

import '../../../../modeles/EmicalculatorModels/calculatorEmiModel/calculatoremiModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'calculatoremi_event.dart';
part 'calculatoremi_state.dart';

class CalculatoremiBloc extends Bloc<CalculatoremiEvent, CalculatoremiState> {
  late CalculatoremiModel calculatoremiModel;
  CalculatoremiApi calculatoremiApi=CalculatoremiApi();
  CalculatoremiBloc() : super(CalculatoremiInitial()) {
    on<Fetchcalculatoremi>((event, emit)async {
      emit(CalculatoremiblocLoading());
      try {
        calculatoremiModel = await calculatoremiApi.postCalculatoremidata(
            event.userid,
            event.Customercode,
            event.ApplicationId,
            event.partnercode,
            event.agentcode,
            event.Loanamout,
            event.ProductId,
            event.Tenure,
            event.Frequency,
            event.ctx);
        emit(CalculatoremiblocLoaded(calculatoremiModel: calculatoremiModel));
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(CalculatoremiblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
