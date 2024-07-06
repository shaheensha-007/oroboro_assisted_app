import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../Apis/tokenApi/tokenApi.dart';
import '../../widgets/tostmessage.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  late  List<String> tokenModel;
  TokenApi tokenApi =TokenApi();
  TokenBloc() : super(TokenInitial()) {
    on<FetchToken>((event, emit) async {
      emit(TokenblocLoading());
      print('loading');
      try{
        tokenModel = (await tokenApi.getToken(event.userName, event.passwordInBase64,))!;
        // await preferences.setString('Refresh token', event.refreshtoken);
        emit(TokenblocLoaded());
        print("loaded");
      } catch(e){

        ToastMessage().toastmessage(message:e.toString());

        print('*****$e');
        emit(TokenblocError());
      }
      // TODO: implement event handler
    });
  }
}
