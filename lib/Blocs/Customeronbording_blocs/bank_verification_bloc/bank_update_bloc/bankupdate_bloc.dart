import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/bank_verificationApi/bankupdateApi/bankupdateApi.dart';
import 'package:oroboro_assisted_app/widgets/tostmessage.dart';

import '../../../../modeles/customeronboradingModel/bank_verification modeles/bankupadateModel/BankupdateModel.dart';

part 'bankupdate_event.dart';
part 'bankupdate_state.dart';

class BankupdateBloc extends Bloc<BankupdateEvent, BankupdateState> {
  late BankupdateModel isbankupadte;
  BankupdateApi bankupdateApi=BankupdateApi();
  BankupdateBloc() : super(BankupdateInitial()) {
    on<FetchBankupdate>((event, emit) async{
      emit(BankupdateblocLoading());
      try{
        isbankupadte=await bankupdateApi.postBankupdatedata(event.userId, event.Customercode, event.Accountnumber, event.Accounttype, event.ifsccode);
        emit(BankupdateblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(BankupdateblocError());
      }
      // TODO: implement event handler
    });
  }
}
