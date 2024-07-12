import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/AgentKycApi/AgentkycApi.dart';

import '../../modeles/AgentKycModel/AgentKycModel.dart';
import '../../widgets/tostmessage.dart';

part 'agentkyc_event.dart';
part 'agentkyc_state.dart';

class AgentkycBloc extends Bloc<AgentkycEvent, AgentkycState> {
  late AgentKycModel isagentkyccompleted;
  AgentkycApi agentkycApi=AgentkycApi();
  AgentkycBloc() : super(AgentkycInitial()) {
    on<FetchAgentKyc>((event, emit) async{
      emit(AgentKycblocLoading());
      try{
        isagentkyccompleted=await agentkycApi.postagentkycData(event.clientId, event.PartnerCode, event.PAN, event.Mobile, event.Email, event.OnboardingFor, event.ctx);
        emit(AgentKycblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: "Internal server error occurs. Bad Request Format");

        print('*****$e');
        emit(AgentKycblocError());
      }
      // TODO: implement event handler
    });
  }
}
