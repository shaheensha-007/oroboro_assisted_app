import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/CustomercodeApi/CustomercodeApi.dart';

import '../../../modeles/customeronboradingModel/CustomercodeModel/CustomercodeModel.dart';
import '../../../widgets/tostmessage.dart';

part 'customercodecreate_event.dart';
part 'customercodecreate_state.dart';

class CustomercodecreateBloc extends Bloc<CustomercodecreateEvent, CustomercodecreateState> {
  late CustomercodecreateModel iscreatecustomercode;
  CustomercodecreateApi customercodecreateApi=CustomercodecreateApi();
  CustomercodecreateBloc() : super(CustomercodecreateInitial()) {
    on<FetchCustomercodecreate>((event, emit) async{
      emit(CustomercodecreateblocLoading());
      try{
        iscreatecustomercode=await customercodecreateApi.postCustomercodecreatedata(event.userId, event.data);
        emit(CustomercodecreateblocLoaded());
      }catch (e){
        ToastMessage().toastmessage(message:e.toString());
        emit(CustomerCodecreateblocError());
      }
      // TODO: implement event handler
    });
  }
}