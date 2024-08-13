
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../Apis/SignupApi/AgentbusinessApi/AgentbusinessApi.dart';
import '../../../modeles/signupModelclass/AgentbusinessModel/AgentbusinessModel.dart';
import '../../../widgets/tostmessage.dart';



part 'agentbusiness_event.dart';
part 'agentbusiness_state.dart';

class AgentbusinessBloc extends Bloc<AgentbusinessEvent, AgentbusinessState> {
late AgentbusinessModel isagentbusiness;
AgentbusinessApi agentbusinessApi=AgentbusinessApi();
  AgentbusinessBloc() : super(AgentbusinessInitial()) {
    on<FetchAgentbusiness>((event, emit) async{
      emit(AgentbusinessblocLoading());
      try{
        isagentbusiness=await agentbusinessApi.postagentbusinessData(event.clientId, event.PAN, event.PartnerCode, event.OnboardingFor, event.GSTNUMBER, event.REGISTRATIONTYPE, event.AGENTNAME, event.BRANDNAME, event.TANNUMBER, event.TELEPHONE, event.SIGNATURE,event.LATITUDE, event.LONGITUDE, event.ctx);
        emit(AgentbusinessblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: "Internal server error occurs. Bad Request Format");

        print('*****$e');
        emit(AgentbusinessblocError());
      }
      // TODO: implement event handler
    });
  }
}
