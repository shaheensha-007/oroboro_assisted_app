import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'restpassword_event.dart';
part 'restpassword_state.dart';

class RestpasswordBloc extends Bloc<RestpasswordEvent, RestpasswordState> {
  RestpasswordBloc() : super(RestpasswordInitial()) {
    on<RestpasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
