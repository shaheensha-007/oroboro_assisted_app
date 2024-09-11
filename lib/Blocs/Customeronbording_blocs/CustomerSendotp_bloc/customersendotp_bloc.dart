import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customersendotp_event.dart';
part 'customersendotp_state.dart';

class CustomersendotpBloc extends Bloc<CustomersendotpEvent, CustomersendotpState> {
  CustomersendotpBloc() : super(CustomersendotpInitial()) {
    on<CustomersendotpEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
