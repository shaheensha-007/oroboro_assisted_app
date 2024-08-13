
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:oroboro_assisted_app/Apis/SignLoginApi/SignLoginApi.dart';

import '../../../modeles/SigninModel/SignloginModel/SignloginModel.dart';
import '../../../widgets/tostmessage.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  late SignloginModel isvalid;
  SigninApi signinApi=SigninApi();
  SigninBloc() : super(SigninInitial()) {
    on<FetchSignin>((event, emit)async {
      emit(SigninblocLoading());
      try{
        isvalid=await signinApi.postSignlogindata(event.userName, event.password, event.ctx);
        emit(SigninblocLoaded());
      }
      catch(e){
        ToastMessage().toastmessage(message: "Internal server error occurs. Bad Request Format");

        print('*****$e');
        emit(SigninblocError());
      }
      // TODO: implement event handler
    });
  }
}
