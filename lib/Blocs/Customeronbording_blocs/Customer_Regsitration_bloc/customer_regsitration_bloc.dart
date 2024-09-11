import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customer_regsitration_event.dart';
part 'customer_regsitration_state.dart';

class CustomerRegsitrationBloc extends Bloc<CustomerRegsitrationEvent, CustomerRegsitrationState> {
  CustomerRegsitrationBloc() : super(CustomerRegsitrationInitial()) {
    on<CustomerRegsitrationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
