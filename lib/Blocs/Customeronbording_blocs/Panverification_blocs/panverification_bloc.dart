import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Blocs/Customeronbording_blocs/Customerupadate_bloc/customerupdate_bloc.dart';

import '../../../Apis/CustomeronbordingApies/PanverificationApi/PanverificationApi.dart';
import '../../../modeles/customeronboradingModel/panverificationModel/PanverificationModel.dart';
import '../../../widgets/tostmessage.dart';

part 'panverification_event.dart';
part 'panverification_state.dart';

class PanverificationBloc extends Bloc<PanverificationEvent, PanverificationState> {
  late PanverificationModel ispanverification;
  PanverificationApi panverificationApi=PanverificationApi();
  PanverificationBloc() : super(PanverificationInitial()) {
    on<FetchPanverification>((event, emit) async{
      emit(PanverificationblocLoading());
      try{
        ispanverification=await panverificationApi.postPanverificationdata(event.userid,event.Customercode, event.PAN, event.ApplicationId,event.ctx);
        emit(PanverificationblocLoaded(panverificationModel: ispanverification));
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(PanverificationblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
