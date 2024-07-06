import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Apis/VeriflypanApi/VerifiypanApi.dart';
import '../../modeles/verifly_pan_model/Veriflypanmodel.dart';
import '../../widgets/tostmessage.dart';

part 'verifypan_event.dart';
part 'verifypan_state.dart';

class VerifypanBloc extends Bloc<VerifypanEvent, VerifypanState> {
  late VerifypanModel isverifypan;
  VerifypanApi verifypanApi=VerifypanApi();
  VerifypanBloc() : super(VerifypanInitial()) {
    on<FetchVerifypan>((event, emit) async{
      emit(VerifypanblocLoading());
      final preference = await SharedPreferences.getInstance();
      try {
        isverifypan= await verifypanApi.postverifypanData(event.clientId, event.PAN, event.OnboardingFor, event.ctx);
        preference.setString("signpan", event.PAN);
        print(preference);
        print( "this values${isverifypan}");
        emit(VerifypanblocLoaded());
      } catch (e,stack) {
        ToastMessage().toastmessage(message: " THERE IS ERROOR${e}");

        print('*****$e');
        print('SHAHEEN$stack');
        emit(VerifypanblocError());
      }
      // TODO: implement event handler
    });
  }
}
