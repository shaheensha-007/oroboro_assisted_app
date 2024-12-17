import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/PanverificationApi/StatecodeApi/StatecodeApi.dart';
import 'package:oroboro_assisted_app/modeles/customeronboradingModel/panverificationModel/StatecodeModel/StatecodeModel.dart';

import '../../../../widgets/tostmessage.dart';

part 'statecode_event.dart';
part 'statecode_state.dart';

class StatecodeBloc extends Bloc<StatecodeEvent, StatecodeState> {
  StatecodeApi statecodeApi=StatecodeApi();
  StatecodeBloc() : super(StatecodeInitial()) {
    on<Fetchstatecode>((event, emit) async{
      emit(StatecodeblocLoading());
      try{
        final statecodeModelstatus= await statecodeApi.postStatecodedata(event.ctx);
        emit(StatecodeblocLoaded(statecodeModelstatus: statecodeModelstatus));
      }
      catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(StatecodeblocError());
      }
      // TODO: implement event handler
    });
  }
}
