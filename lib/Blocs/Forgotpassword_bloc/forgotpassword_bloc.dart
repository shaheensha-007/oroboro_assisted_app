import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/ForgotpasswordApi/ForgotpasswordApi.dart';

import '../../modeles/FogotpasswordModel/ForgotpasswordModel.dart';
import '../../widgets/tostmessage.dart';

part 'forgotpassword_event.dart';
part 'forgotpassword_state.dart';

class ForgotpasswordBloc extends Bloc<ForgotpasswordEvent, ForgotpasswordState> {
  late ForgotpasswordModel isforgotpassword;
  ForgotpasswordApi forgotpasswordApi=ForgotpasswordApi();
  ForgotpasswordBloc() : super(ForgotpasswordInitial()) {
    on<FetchForgotpassword>((event, emit)async{
      emit(ForgotpasswordblocLoading());
      try {
        isforgotpassword = await forgotpasswordApi.postForgotpassworddata(
            event.Username, event.Mobilenumber, event.ctx);
        emit(ForgotpasswordblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        print("*****$e");
        emit(ForgotpasswordblocError());
      }
      // TODO: implement event handler
    });
  }
}
