import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/EmailupadateApi/EmailupadateApi.dart';

import '../../../modeles/customeronboradingModel/EmailupadteModel/EmailupdateModel.dart';
import '../../../widgets/tostmessage.dart';

part 'emailupadate_event.dart';
part 'emailupadate_state.dart';

class EmailupadateBloc extends Bloc<EmailupadateEvent, EmailupadateState> {
  late EmailupdateModel isemailupadate;
  EmailupadateApi emailupadateApi=EmailupadateApi();
  EmailupadateBloc() : super(EmailupadateInitial()) {
    on<FetchEmailupadate>((event, emit) async{
      emit(EmailupadateblocLoading());
      try{
        isemailupadate=await emailupadateApi.postEmailupadatedata(event.userid, event.Customercode, event.Emailid);
        emit(EmailupadateblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message:e.toString());
        emit(EmailupadateblocError());
      }
      // TODO: implement event handler
    });
  }
}