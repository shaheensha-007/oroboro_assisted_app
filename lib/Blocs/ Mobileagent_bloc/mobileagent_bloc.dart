import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/MobileagntApi/MobileagentApi.dart';

import '../../modeles/mobile_agentModel/mobileagentmodel.dart';
import '../../widgets/tostmessage.dart';

part 'mobileagent_event.dart';
part 'mobileagent_state.dart';

class MobileagentBloc extends Bloc<MobileagentEvent, MobileagentState> {
  late MobileagentModel ismobile;
  MobileagentApi mobileagentApi=MobileagentApi();
  MobileagentBloc() : super(MobileagentInitial()) {
    on<FetchMobileagent>((event, emit) async{
      emit(MobileagentblocLoading());
      try{
       ismobile=await mobileagentApi.postmobileData(event.clientId, event.mobile, event.OnboardingFor, event.ctx);
       emit(MobileagentblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: "Internal server error occurs. Bad Request Format");

        print('*****$e');
        emit(MobileagentblocError());
      }
      // TODO: implement event handler
    });
  }
}
