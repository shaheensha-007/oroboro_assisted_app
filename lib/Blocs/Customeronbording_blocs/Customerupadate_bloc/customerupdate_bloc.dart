import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/CustomerupdateApi/CustomerupadateApi.dart';

import '../../../modeles/customeronboradingModel/Customer_onbordingupadteprocessModel;/UpadatenextprocessModel.dart';
import '../../../widgets/tostmessage.dart';

part 'customerupdate_event.dart';
part 'customerupdate_state.dart';

class CustomerupdatenextBloc extends Bloc<CustomerupdatenextEvent, CustomerupdatenextState> {
  late UpadatenextprocessModel iscustomerupadate;
  CustomerupdateApi customerupdateApi = CustomerupdateApi();
  CustomerupdatenextBloc() : super(CustomerupdateInitial()) {
    on<FetchCustomerupdate>((event, emit) async {
      emit(CustomerupdatenextblocLoading());
      try {
        iscustomerupadate = await customerupdateApi.postupdatestatusdata(
            event.userid,
            event.Customercode,
            event.PartnerCode,
            event.FlowId,
            event.PageOrder,
            event.ApplicationId,
            event.PageType,
            event.ctx);
        emit(CustomerupdatenextblocLoaded(upadatenextprocessModel: iscustomerupadate));
      } catch (e) {
        ToastMessage().toastmessage(message: e.toString());
        emit(CustomerupdatenextblocError(Errormessage: e.toString()));
      }
      // TODO: implement event handler
    });
  }
}
