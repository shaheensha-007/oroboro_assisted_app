import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/CustomerupdateApi/CustomerupadateApi.dart';

import '../../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import '../../../widgets/tostmessage.dart';

part 'customerupdate_event.dart';
part 'customerupdate_state.dart';

class CustomerupdateBloc extends Bloc<CustomerupdateEvent, CustomerupdateState> {
  late UpadatenextprocessModel isupdateprocess;
  CustomerupdateApi customerupdateApi=CustomerupdateApi();
  CustomerupdateBloc() : super(CustomerupdateInitial()) {
    on<FetchCustomerupdate>((event, emit)async {
      emit(CustomerupdateblocLoading());
      try {
        isupdateprocess = await customerupdateApi.postupdatestatusdata(
            event.userid, event.Customercode, event.PartnerCode, event.FlowId,
            event.PageOrder);
        emit(CustomerupadateblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(CustomerupadateblocError());
      }
      // TODO: implement event handler
    });
  }
}