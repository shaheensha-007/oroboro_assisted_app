import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customercodecreate_event.dart';
part 'customercodecreate_state.dart';

class CustomercodecreateBloc extends Bloc<CustomercodecreateEvent, CustomercodecreateState> {
  CustomercodecreateBloc() : super(CustomercodecreateInitial()) {
    on<CustomercodecreateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
