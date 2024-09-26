import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oroboro_assisted_app/Apis/CustomeronbordingApies/personalinformationApis/MonthincomeApi/MonthincomeApi.dart';

import '../../../../modeles/customeronboradingModel/Personal_informationmodel/MonthIncomeModel/MonthincomeModel.dart';
import '../../../../widgets/tostmessage.dart';

part 'monthincome_event.dart';
part 'monthincome_state.dart';

class MonthincomeBloc extends Bloc<MonthincomeEvent, MonthincomeState> {
  late MonthincomeModel ismonthlyincome;
  MonthincomeApi monthincomeApi=MonthincomeApi();
  MonthincomeBloc() : super(MonthincomeInitial()) {
    on<FetchMonthincome>((event, emit)async {
      emit(MonthincomeblocLoading());
      try{
        ismonthlyincome=await monthincomeApi.postMonthincomedata(event.userId, event.Customercode, event.EmploymentStatus, event.Income, event.MonthlyEMIAmount);
        emit(MonthincomeblocLoaded());
      }catch(e){
        ToastMessage().toastmessage(message: e.toString());
        emit(MonthioncomeblocError());
      }
      // TODO: implement event handler
    });
  }
}
