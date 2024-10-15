import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/MerchartTokenApi/MerchartTokenApi.dart';

import '../../modeles/MerchartTokenModel/MerchartTokenModel.dart';
import '../../widgets/tostmessage.dart';

part 'merchart_token_event.dart';
part 'merchart_token_state.dart';

class MerchartTokenBloc extends Bloc<MerchartTokenEvent, MerchartTokenState> {
  late MerchartTokenModel mercharttokenmodel;
  MerchartTokenApi mercharttokenApi=MerchartTokenApi();
  MerchartTokenBloc() : super(MerchartTokenInitial()) {
    on<FetchMerchartToken>((event, emit)async {
      emit(MerchartTokenblocLoading());
      try{
        mercharttokenmodel=(await mercharttokenApi.simpletoken(event.userName, event.password,event.ctx))!;
        emit(MerchartTokenblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print("*******$e");
        emit(MerchartTokenblocError());
      }
      // TODO: implement event handler
    });
  }
}
