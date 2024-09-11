import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customerupdate_event.dart';
part 'customerupdate_state.dart';

class CustomerupdateBloc extends Bloc<CustomerupdateEvent, CustomerupdateState> {
  CustomerupdateBloc() : super(CustomerupdateInitial()) {
    on<CustomerupdateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
