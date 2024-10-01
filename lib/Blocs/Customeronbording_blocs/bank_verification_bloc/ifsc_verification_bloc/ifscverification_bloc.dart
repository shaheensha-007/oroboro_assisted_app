import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/bank_verificationApi/IfscverificationApi/IfscverificationApi.dart';
import 'package:oroboro_assisted_app/widgets/tostmessage.dart';

import '../../../../modeles/customeronboradingModel/bank_verification modeles/Ifsc_veriicationModel/IfscverificationModel.dart';

part 'ifscverification_event.dart';
part 'ifscverification_state.dart';

class IfscverificationBloc extends Bloc<IfscverificationEvent, IfscverificationState> {
  late IfscverificationModel isifsccode;
  IfscverificationApi ifscVerificationApi=IfscverificationApi();
  IfscverificationBloc() : super(IfscverificationInitial()) {
    on<FetchIfscverification>((event, emit)async {
      emit(IfscVerificationblocLoading());
      try{
        isifsccode=await ifscVerificationApi.postifscverifacationdata(event.userId, event.ifsccode);
        emit(IfscVerificationblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(IfscVerificatonblocError());
      }
      // TODO: implement event handler
    });
  }
}
