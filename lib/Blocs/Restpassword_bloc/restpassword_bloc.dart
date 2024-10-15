import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/RestPasswordApi/RestpasswordApi.dart';

import '../../modeles/RestpasswordModel/RestpasswordModel.dart';
import '../../widgets/tostmessage.dart';

part 'restpassword_event.dart';
part 'restpassword_state.dart';

class RestpasswordBloc extends Bloc<RestpasswordEvent, RestpasswordState> {
  late RestpasswordModel isrestpassword;
  RestpasswordApi restPasswordApi=RestpasswordApi();
  RestpasswordBloc() : super(RestpasswordInitial()) {
    on<FetchRestpassword>((event, emit) async{
      emit(RestpasswordblocLoading());
      try {
        isrestpassword = await restPasswordApi.postRestpassworddata(
            event.userId, event.password,event.ctx);
        emit(RestpasswordblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(RestpasswordblocError());
      }
      // TODO: implement event handler
    });
  }
}
