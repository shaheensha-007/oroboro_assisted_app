
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../Apis/SignupApi/IfscApi/IfscApi.dart';
import '../../../modeles/signupModelclass/Ifscmodel/IfscModel.dart';
import '../../../widgets/tostmessage.dart';





part 'ifsc_event.dart';
part 'ifsc_state.dart';

class IfscBloc extends Bloc<IfscEvent, IfscState> {
  late IfscModel isverifiedifsc;
  IfscApi ifscApi=IfscApi();
  IfscBloc() : super(IfscInitial()) {
    on<FetchIfsc>((event, emit)async {
      emit(IfscblocLoding());
      try{
        isverifiedifsc=await ifscApi.postAgentifscData(event.clientId, event.IFSC, event.ctx);
        emit(IfscblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: "Internal server error occurs. Bad Request Format");

        print('*****$e');
        emit(IfscblocError());
      }
      // TODO: implement event handler
    });
  }
}
