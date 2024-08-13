
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../Apis/SignupApi/bankregsitrationApi/bankregstrationApi.dart';
import '../../../modeles/signupModelclass/bank_registrationModel/Bank_registratioModel.dart';
import '../../../widgets/tostmessage.dart';




part 'bankregstration_event.dart';
part 'bankregstration_state.dart';

class BankregstrationBloc extends Bloc<BankregstrationEvent, BankregstrationState> {
  late BankRegistratioModel isbankverification;
  BankregstrationApi bankregstrationApi=BankregstrationApi();
  BankregstrationBloc() : super(BankregstrationInitial()) {
    on<FetchBankregstration>((event, emit) async{
      emit(BankregstrationblocLoading());
      try{
        isbankverification=await bankregstrationApi.postAgentbankverificationData(event.clientId, event.PAN, event.PartnerCode, event.OnboardingFor, event.AcoountNumber, event.IFSC, event.AccountType, event.BankName, event.BranchName, event.AccountHolderName, event.ctx);
        emit(BankregstrationblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: "Internal server error occurs. Bad Request Format");

        print('*****$e');
        emit(BankregstrationblocError());
      }
      // TODO: implement event handler
    });
  }
}
