import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/Customer_onbordingApi/CustomeronbordingApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../modeles/customeronboradingModel/Customer_onbordingStatusModel/CustomeronbordingstatusModel.dart';
import '../../../widgets/tostmessage.dart';

part 'customeronbording_event.dart';
part 'customeronbording_state.dart';

class CustomeronbordingBloc extends Bloc<CustomeronbordingEvent, CustomeronbordingState> {
  late CustomeronbordingstatusModel isCustomeronbording;
  CustomeronbordingApi customeronbordingApi = CustomeronbordingApi();

  CustomeronbordingBloc() : super(CustomeronbordingInitial()) {
    on<FetchCustomeronbording>((event, emit) async {
      emit(CustomeronbordingblocLoading());

      final preferences = await SharedPreferences.getInstance();

      try {
        // API call to fetch customer onboarding status
        isCustomeronbording = await customeronbordingApi.postCustomeronbordingstatusdata(
          event.userid,
          event.Customercode,
          event.partnercode,
          event.agentcode,
          event.ctx,
        );

        emit(CustomeronbordingblocLoaded(customeronbordingstatusModel: isCustomeronbording));
      } catch (e) {
        ToastMessage().toastmessage(message: e.toString());
        emit(CustomeronbordingblocError(Errormessage: e.toString()));
      }
    });
  }
}

