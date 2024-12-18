
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:oroboro_assisted_app/Apis/SignLoginApi/SignLoginApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../modeles/SigninModel/SignloginModel/SignloginModel.dart';
import '../../../widgets/tostmessage.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninApi signinApi=SigninApi();
  SigninBloc() : super(SigninInitial()) {
    on<FetchSignin>((event, emit)async {
      final preferences = await SharedPreferences.getInstance();
      emit(SigninblocLoading());
      try{
     final isvalid=await signinApi.postSignlogindata(event.userName, event.password,event.ctx);
       preferences.setString("userId", isvalid.result!.userId.toString());
        emit(SigninblocLoaded(signloginModel:isvalid ));
      }
      catch(e){
       // ToastMessage().toastmessage(message:e.toString());

        print('*****$e');
        emit(SigninblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
