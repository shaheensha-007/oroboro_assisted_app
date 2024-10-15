import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/upadateaddressApi/UpadateaddressApi.dart';

import '../../../modeles/customeronboradingModel/UpadateaddressModel/UpadateaddaressModel.dart';
import '../../../widgets/tostmessage.dart';

part 'upadateaddress_event.dart';
part 'upadateaddress_state.dart';

class UpadateaddressBloc extends Bloc<UpadateaddressEvent, UpadateaddressState> {
  late UpadateaddressModel isupadateaddress;
  UpadateaddressApi upadateaddressApi=UpadateaddressApi();
  UpadateaddressBloc() : super(UpadateaddressInitial()) {
    on<FetchUpadteaddress>((event, emit)async {
      emit(UpadateaddressblocLoading());
      try {
        isupadateaddress = await upadateaddressApi.postUpadateaddressdata(
            event.userid,
            event.Customercode,
            event.Address1,
            event.Address2,
            event.Address3,
            event.City,
            event.State,
            event.Pincode,
            event.District,
        event.ctx);
        emit(UpadateaddressblocLoading());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(UpadateaddressblocError());
      }
      // TODO: implement event handler
    });
  }
}
