import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customeronbording_event.dart';
part 'customeronbording_state.dart';

class CustomeronbordingBloc extends Bloc<CustomeronbordingEvent, CustomeronbordingState> {
  CustomeronbordingBloc() : super(CustomeronbordingInitial()) {
    on<CustomeronbordingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
