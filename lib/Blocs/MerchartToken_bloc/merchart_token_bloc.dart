import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'merchart_token_event.dart';
part 'merchart_token_state.dart';

class MerchartTokenBloc extends Bloc<MerchartTokenEvent, MerchartTokenState> {
  MerchartTokenBloc() : super(MerchartTokenInitial()) {
    on<MerchartTokenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
