
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../Apis/SignupApi/EsignagrementApi/EsignAgrementApi.dart';
import '../../../modeles/signupModelclass/EsignagreementModel/EsignagreementModel.dart';
import '../../../widgets/tostmessage.dart';



part 'esign_event.dart';
part 'esign_state.dart';

class EsignBloc extends Bloc<EsignEvent, EsignState> {
  late EsignagreementModel isvalidesign;
  EsignagreementApi esignAgrementApi=EsignagreementApi();
  EsignBloc() : super(EsignInitial()) {
    on<FetchEsin>((event, emit) async{
      emit(EsignblocLoading());
      try{
        isvalidesign=await esignAgrementApi.postAgentesignData(event.clientId, event.PAN, event.OnboardingFor, event.ctx);
        emit(EsignblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: "Internal server error occurs. Bad Request Format");

        print('*****$e');
        emit(EsignblocError());
      }
      // TODO: implement event handler
    });
  }
}
