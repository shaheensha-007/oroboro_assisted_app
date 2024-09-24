import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/userdetalisApi/UserdetalisApi.dart';

import '../../modeles/UserdetalisModel/UserdetalisModel.dart';
import '../../widgets/tostmessage.dart';

part 'userdetalis_event.dart';
part 'userdetalis_state.dart';

class UserdetalisBloc extends Bloc<UserdetalisEvent, UserdetalisState> {
  late UserdetalisModel isuser;
  UserdetalisApi userdetalisApi=UserdetalisApi();
  UserdetalisBloc() : super(UserdetalisInitial()) {
    on<FetchUserdetalis>((event, emit)async {
      emit(UserdetalisblocLoading());
      try{
        isuser=await userdetalisApi.postuserdetalisdata(event.userId, event.Identity);
        emit(UserdetalisblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(UserdetalisblocError());
      }
      // TODO: implement event handler
    });
  }
}
