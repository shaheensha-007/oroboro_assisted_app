import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Apis/CustomeronbordingApies/PanverificationApi/PanverificationApi.dart';
import '../../../modeles/customeronboradingModel/panverificationModel/PanverificationModel.dart';
import '../../../widgets/tostmessage.dart';

part 'panverification_event.dart';
part 'panverification_state.dart';

class PanverificationBloc extends Bloc<PanverificationEvent, PanverificationState> {
  late PanverificationModel iscustomerverification;
  PanverificationApi panverificationApi=PanverificationApi();
  PanverificationBloc() : super(PanverificationInitial()) {
    on<FetchPanverification>((event, emit) async{
      emit(PanverificationblocLoading());
      try{
        iscustomerverification=await panverificationApi.postPanverificationdata(event.userid,event.Customercode, event.PAN);
        emit(PanverificationblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(PanverificationblocError());
      }
      // TODO: implement event handler
    });
  }
}
