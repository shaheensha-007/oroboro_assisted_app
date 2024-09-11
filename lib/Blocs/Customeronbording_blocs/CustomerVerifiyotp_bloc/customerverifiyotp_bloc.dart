import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customerverifiyotp_event.dart';
part 'customerverifiyotp_state.dart';

class CustomerverifiyotpBloc extends Bloc<CustomerverifiyotpEvent, CustomerverifiyotpState> {
  CustomerverifiyotpBloc() : super(CustomerverifiyotpInitial()) {
    on<CustomerverifiyotpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
