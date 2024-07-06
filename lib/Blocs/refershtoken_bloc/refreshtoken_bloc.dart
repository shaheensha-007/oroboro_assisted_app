import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Apis/refreshtokenApi/refreshtokenApi.dart';

part 'refreshtoken_event.dart';
part 'refreshtoken_state.dart';

class RefreshtokenBloc extends Bloc<RefreshtokenEvent, RefreshtokenState> {
  late List<String> refreshtokenModel;
  RefreshtokenApi refreshtokenApi=RefreshtokenApi();
  RefreshtokenBloc() : super(RefreshtokenInitial()) {
    on<FetchRefreshtoken>((event, emit)async {
      emit(RefreshtokenblocLoading());
      try {
        refreshtokenModel= (await refreshtokenApi.getrefreshToken())!;
        emit(RefreshtokenblocLoaded());
      } catch(e){

        // ToastMessage().toastmessage(message: e.toString());
        print(e);
        emit(RefreshtokenblocError());}
      // TODO: implement event handler
    });
  }
}
